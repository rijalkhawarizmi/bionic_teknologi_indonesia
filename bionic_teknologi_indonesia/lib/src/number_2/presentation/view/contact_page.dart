
import 'package:bionic_teknologi_indonesia/common/custom_text.dart';
import 'package:bionic_teknologi_indonesia/core/style/color_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatefulWidget {

  static const String contactRoute="contact-route";
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  static const platform = MethodChannel('com.example.bionic_teknologi_indonesia/contacts');
  List<Map<String, String>> _contacts = [];

  @override
  void initState() {
    super.initState();
    _getContacts();
  }

  final String contactsUrl = 'content://contacts/people/';

  Future<void> _openContacts() async {
    if (await canLaunch(contactsUrl)) {
      await launch(contactsUrl);
    } else {
      throw 'Could not open the contacts application.';
    }
  }

  Future<void> _getContacts() async {
    // Request permission to access contacts
    if (await Permission.contacts.request().isGranted) {
      try {
        final List<dynamic> contacts =
            await platform.invokeMethod('getContacts');
        setState(() {
          _contacts = List<Map<String, String>>.from(
              contacts.map((item) => Map<String, String>.from(item)));
        });
      } on PlatformException catch (e) {
        print("Failed to get contacts: '${e.message}'.");
      }
    } else {
      print("Permission denied");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _openContacts();
        },
        child: CustomText(text: "Add", fontSize: 15, fontWeight: FontWeight.bold, color: ColorApp.black)
      ),
      appBar: AppBar(
        title: CustomText(text: "Contact list", fontSize: 20, fontWeight: FontWeight.bold, color: ColorApp.black)
      ),
      body: _contacts.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _contacts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_contacts[index]['name']!),
                  subtitle: Text(_contacts[index]['phoneNumber']!),
                );
              },
            ),
    );
  }
}

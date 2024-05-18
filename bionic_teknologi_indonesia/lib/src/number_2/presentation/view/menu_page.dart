import 'package:bionic_teknologi_indonesia/src/number_2/presentation/view/camera_page.dart';
import 'package:bionic_teknologi_indonesia/src/number_2/presentation/view/contact_page.dart';
import 'package:bionic_teknologi_indonesia/src/number_2/presentation/view/todo_list_page.dart';
import 'package:bionic_teknologi_indonesia/src/number_2/presentation/view/login_page.dart';
import 'package:bionic_teknologi_indonesia/src/number_2/presentation/view/map_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  static const String menuRoute = "menu-route";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                context.pushNamed(LoginPage.loginRoute);
              },
              icon: Icon(Icons.person)),
          IconButton(
              onPressed: () {
                context.pushNamed(MapPage.mapRoute);
              },
              icon: Icon(Icons.map)),
          IconButton(
              onPressed: () {
                context.pushNamed(ContactPage.contactRoute);
              },
              icon: Icon(Icons.contact_mail_sharp)),
          IconButton(
              onPressed: () {
                context.pushNamed(CameraPage.cameraRoute);
              },
              icon: Icon(Icons.camera_alt_outlined)),
          IconButton(
              onPressed: () {
                context.pushNamed(TodoListPage.todoListRoute);
              },
              icon: Icon(Icons.contact_phone_outlined)),
        ],
      ),
    ));
  }
}

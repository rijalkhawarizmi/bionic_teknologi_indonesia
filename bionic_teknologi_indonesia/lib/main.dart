import 'package:bionic_teknologi_indonesia/core/utils/objectbox.dart';
import 'package:bionic_teknologi_indonesia/firebase_options.dart';
import 'package:bionic_teknologi_indonesia/main/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

import 'core/route/routes.dart';

late ObjectBox objectBox;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   
  objectBox= await ObjectBox.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MaterialApp.router(
        routerConfig: routerApp,
        theme: ThemeData(
            fontFamily: GoogleFonts.poppins().fontFamily,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

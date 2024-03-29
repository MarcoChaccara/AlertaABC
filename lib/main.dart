
import 'package:alerta_abc/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pages/login_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FireTask",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme:  GoogleFonts.manropeTextTheme(),
      ),
      home: LoginPage(),
    );
  }
}
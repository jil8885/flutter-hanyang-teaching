import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'page/homepage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '한양대 학과 정보 시스템',
      debugShowCheckedModeBanner: false,
      home: HomePage(title: '한양대 학과 정보 시스템',),
    );
  }
}



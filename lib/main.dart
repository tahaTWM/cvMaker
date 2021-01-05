import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './editorPage/editorPage.dart';
import './login/selectLanguage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      // DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // accentColor: Color(0xFFFFC311),
        primaryColor: Color(0xFFFFC311),
        primaryColorDark: Color(0xFFFFC311),
        // primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: SelectLanguage(),
    );
  }
}

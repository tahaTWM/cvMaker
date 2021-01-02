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
        accentColor: Colors.purple,
        primaryColor: Colors.purpleAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: EditorPage(),
    );
  }
}

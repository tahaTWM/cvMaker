import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Objective extends StatefulWidget {


  @override
  _ObjectiveState createState() => _ObjectiveState();
}

class _ObjectiveState extends State<Objective> {
   final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar:  AppBar(
          title: Text("Objective"),
        ),
        body: ListView(children: [
          

        ],),
      ),
    );
  }
}
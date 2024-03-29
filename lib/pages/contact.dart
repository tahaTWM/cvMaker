// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:email_validator/email_validator.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  bool cklangauge = false;
  lang() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var langauge = _pref.getString("lan");
    print(langauge);
    setState(() {
      if (langauge == "Arabic") {
        cklangauge = true;
      } else {
        cklangauge = false;
      }
    });
  }

  List list = [];

  contact(
      String firstname, String lastname, String email, String phonenum) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    double per = _pref.getDouble("per") ?? 0.0;

    if (firstname.isNotEmpty) {
      // _pref.setString("firstname", firstname);
      if (_pref.getString("firstname") != firstname) {
        _pref.setString("firstname", firstname);
      }
    }
    if (firstname.isEmpty) {
      if (_pref.getString("firstname").isNotEmpty) {
        list.remove(1);
        _pref.remove("firstname");
      }
    }
    if (firstname.isNotEmpty) {
      if (_pref.getString("firstname").isEmpty) {
        _pref.setString("firstname", firstname);
        if (list.contains(1) != false) {
          list.add(1);
        }
      }
    }
    if (firstname.isEmpty) {
      if (_pref.getString("firstname").isEmpty) {
        return null;
      }
    }

    if (lastname.isNotEmpty) {
      _pref.setString("lastname", lastname);
      list.add(2);
      if (list.contains(2) == false) {
        list.add(2);
      }
    } else {
      list.remove(2);
    }

    if (phonenum.isNotEmpty) {
      _pref.setString("phonenum", phonenum);
      list.add(3);
      if (list.contains(3) == false) {
        list.add(3);
      }
    } else {
      list.remove(3);
    }

    if (email.isNotEmpty) {
      _pref.setString("email", email);
      list.add(4);
      if (list.contains(4) == false) {
        list.add(4);
      }
    } else {
      list.remove(4);
    }

    if (list.contains(1) == true) {
      _pref.setDouble("per", per + 0.1);
    } else {
      if (per > 0) {
        _pref.setDouble("per", per - 0.1);
      }
    }
    if (list.contains(2) == true) {
      _pref.setDouble("per", per + 0.1);

      if (per > 0) {
        _pref.setDouble("per", per - 0.1);
      }
    }
    if (list.contains(3) == true) {
      _pref.setDouble("per", per + 0.1);
      if (per > 0) {
        _pref.setDouble("per", per - 0.1);
      }
    }
    if (list.contains(4) == true) {
      _pref.setDouble("per", per + 0.1);
      if (per > 0) {
        _pref.setDouble("per", per - 0.1);
      }
    }
    if (firstname.isNotEmpty) {
      _pref.setString("firstname", firstname);
    }
    print(_pref.getString("firstname"));
    print(_pref.getString("lastname"));
    print(_pref.getString("email"));
    print(_pref.getString("phonenum"));
    // print(_pref.getDouble("per"));

    // print(firstname + "-" + lastname + "-" + email + "-" + phonenum);

    print("per" + _pref.getDouble("per").toString());
  }

  @override
  void initState() {
    FocusNode(canRequestFocus: false);
    lang();
    // _getAllCoockies();
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());

    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title:
              cklangauge == false ? Text("Let's get started") : Text("لنبدأ"),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Color(0xFF73AEF5),
          brightness: Brightness.light,
          toolbarHeight: 40,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
          ),
        ),
        body: Container(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: cklangauge == false
                    ? Text(
                        "Enter your contact information.",
                        style: TextStyle(fontSize: 22),
                        textAlign: TextAlign.start,
                      )
                    : Text(
                        ".ادخل معلوماتك الشخصية",
                        style: TextStyle(fontSize: 22),
                        textAlign: TextAlign.end,
                      ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Theme(
                  child: TextField(
                    textAlign:
                        cklangauge == false ? TextAlign.start : TextAlign.end,
                    maxLength: 40,
                    autofocus: true,
                    // onEditingComplete: () {
                    //   contact(
                    //       firstnameController.text.toString(),
                    //       lastnameController.text.toString(),
                    //       emailController.text.toString(),
                    //       phonenumController.text.toString());
                    // },
                    controller: firstnameController,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                      ),
                      hintText: cklangauge == false
                          ? 'Enter your first name.'
                          : '.ادخال الاسم الاول',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF61A4F1), width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF61A4F1), width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      ),
                    ),
                  ),
                  data: Theme.of(context).copyWith(
                    primaryColor: Colors.pink,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Theme(
                  child: TextField(
                    textAlign:
                        cklangauge == false ? TextAlign.start : TextAlign.end,
                    maxLength: 40,
                    autofocus: true,
                    // onEditingComplete: () {
                    //   contact(
                    //       firstnameController.text.toString(),
                    //       lastnameController.text.toString(),
                    //       emailController.text.toString(),
                    //       phonenumController.text.toString());
                    // },
                    controller: lastnameController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: cklangauge == false
                          ? 'Enter your Last name.'
                          : '.ادخال اسم العائلة',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF61A4F1), width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF61A4F1), width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      ),
                    ),
                  ),
                  data: Theme.of(context).copyWith(
                    primaryColor: Colors.pink,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Theme(
                  child: TextFormField(
                    textAlign:
                        cklangauge == false ? TextAlign.start : TextAlign.end,
                    maxLength: 50,
                    controller: emailController,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      hintText: cklangauge == false
                          ? "Enter your email"
                          : ".ادخال البريد الالكتروني",
                      icon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF61A4F1), width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF61A4F1), width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      ),
                    ),
                    validator: (value) {
                      if (value != null && value.isNotEmpty) {
                        if (!EmailValidator.validate(value))
                          return 'it is not email';
                      } else
                        return 'the text feild is empty';
                      return null;
                    },
                    // onFieldSubmitted: (_) {
                    //   contact(
                    //       firstnameController.text.toString(),
                    //       lastnameController.text.toString(),
                    //       emailController.text.toString(),
                    //       phonenumController.text.toString());
                    //   _formKey.currentState.validate();
                    // },
                  ),
                  data: Theme.of(context).copyWith(
                    primaryColor: Colors.pink,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Theme(
                  child: TextFormField(
                    textAlign:
                        cklangauge == false ? TextAlign.start : TextAlign.end,
                    maxLength: 15,
                    keyboardType: TextInputType.number,
                    controller: phonenumController,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      hintText: cklangauge == false
                          ? "Enter your phone number"
                          : ".ادخل رقم الهاتف",
                      icon: Icon(Icons.phone),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF61A4F1), width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF61A4F1), width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      ),
                    ),
                    // validator: (value) {
                    //   if (value.isNotEmpty) {
                    //     if (value.toString().length > 20)
                    //       return ' the value must be less than 20';
                    //   } else {
                    //     return 'the text feild is empty';
                    //   }
                    //   return null;
                    // },
                    onFieldSubmitted: (_) {
                      contact(
                          firstnameController.text.toString(),
                          lastnameController.text.toString(),
                          emailController.text.toString(),
                          phonenumController.text.toString());
                      _formKey.currentState.validate();
                    },
                  ),
                  data: Theme.of(context).copyWith(
                    primaryColor: Colors.pink,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Material(
                  elevation: 5.0,
                  color: Color(0xFF398AE5),
                  borderRadius: BorderRadius.circular(30.0),
                  child: MaterialButton(
                    onPressed: () {
                      contact(
                          firstnameController.text.toString(),
                          lastnameController.text.toString(),
                          emailController.text.toString(),
                          phonenumController.text.toString());
                      // SharedPreferences sharedPreferences =
                      //     await SharedPreferences.getInstance();
                      // sharedPreferences.clear();
                    },
                    minWidth: double.infinity,
                    height: 42.0,
                    child: Text(
                      "Done",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

TextEditingController firstnameController = TextEditingController();
TextEditingController lastnameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController phonenumController = TextEditingController();

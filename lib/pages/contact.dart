import 'package:cvmaker/main.dart';
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

  contact(
      String firstname, String lastname, String email, String phonenum) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    if (firstname == null) {
      return null;
    } else {
      _pref.setString("firstname", firstname);
    }

    if (lastname == null) {
      return null;
    } else {
      _pref.setString("lastname", lastname);
    }
    if (phonenum == null) {
      return null;
    } else {
      _pref.setString("phonenum", phonenum);
    }
    if (email == null) {
      return null;
    } else {
      _pref.setString("email", email);
    }
    print(cklangauge);
    print(_pref.getString("firstname"));
    print(_pref.getString("lastname"));
    print(_pref.getString("email"));
    print(_pref.getString("phonenum"));
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
          title: Text("Let's get started"),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.cyan[400],
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
                    onEditingComplete: () {
                      contact(
                          firstnameController.text.toString(),
                          lastnameController.text.toString(),
                          emailController.text.toString(),
                          phonenumController.text.toString());
                    },
                    controller: firstnameController,
                    decoration: InputDecoration(
                   
                      icon: Icon(Icons.person,),
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
                            BorderSide(color: Colors.pink[400], width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.pink[400], width: 2.0),
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
                    onEditingComplete: () {
                      contact(
                          firstnameController.text.toString(),
                          lastnameController.text.toString(),
                          emailController.text.toString(),
                          phonenumController.text.toString());
                    },
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
                            BorderSide(color: Colors.pink[400], width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.pink[400], width: 2.0),
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
                            BorderSide(color: Colors.pink[400], width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.pink[400], width: 2.0),
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
                          ? "Enter your phone nummber"
                          : ".ادخل رقم الهاتف",
                      icon: Icon(Icons.phone),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.pink[400], width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.pink[400], width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      ),
                    ),
                    validator: (value) {
                      if (value.isNotEmpty) {
                        if (value.toString().length > 20)
                          return ' the value must be less than 20';
                      } else {
                        return 'the text feild is empty';
                      }
                      return null;
                    },
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
                  color: Colors.pink[400],
                  borderRadius: BorderRadius.circular(30.0),
                  child: MaterialButton(
                    onPressed: () {
                      contact(
                          firstnameController.text.toString(),
                          lastnameController.text.toString(),
                          emailController.text.toString(),
                          phonenumController.text.toString());
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

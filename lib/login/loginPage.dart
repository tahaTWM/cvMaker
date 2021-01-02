import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:cvMaker/app.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _txtcontrol = new TextEditingController();
  final TextEditingController _txtcontrol2 = new TextEditingController();
  bool lang = true;

  @override
  void initState() {
    super.initState();
    _txtcontrol.text = "admin";
    _txtcontrol2.text = "admin";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(),
            padding: EdgeInsets.all(8),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Select Language",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Container(
                        // height: MediaQuery.of(context).size.height / 13,
                        child: LiteRollingSwitch(
                          //initial value
                          value: true,
                          textOn: 'En',
                          textOff: 'Ar',
                          colorOn: Colors.greenAccent[700],
                          colorOff: Colors.redAccent[700],
                          iconOn: Icons.done,
                          iconOff: Icons.remove_circle_outline,
                          textSize: 17,
                          onChanged: (bool state) {
                            lang = state;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Image(
                  image: AssetImage(
                    'asset/logo.png',
                  ),
                ),
                SizedBox(height: 30),
                SizedBox(
                  width: 350,
                  child: new TextField(
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                      hintText: "admin",
                      icon: new Icon(Icons.verified_user),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100)),
                    ),
                    controller: _txtcontrol,
                    autocorrect: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                SizedBox(
                  width: 350,
                  child: new TextField(
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                      hintText: "admin",
                      icon: new Icon(Icons.security),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100)),
                    ),
                    controller: _txtcontrol2,
                    obscureText: true,
                    onSubmitted: (_) {
                      String username, password;
                      username = _txtcontrol.value.text;
                      password = _txtcontrol2.value.text;
                      if (username == 'admin' && password == 'admin') {
                        print("Ur password is Correct");
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => App()));
                      } else
                        print("Ur password is InCorrect");
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: new RaisedButton(
                    onPressed: () {
                      String username, password;
                      username = _txtcontrol.value.text;
                      password = _txtcontrol2.value.text;
                      if (username == 'admin' && password == 'admin') {
                        print("Ur password is Correct");
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => App()));
                      } else
                        print("Ur password is InCorrect");
                    },
                    child: new Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    shape: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent[700]),
                        borderRadius: BorderRadius.circular(50)),
                    elevation: 5,
                    color: Colors.greenAccent[700],
                    textColor: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                SizedBox(
                  child: new Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 30),
                      ),
                      new FlatButton(
                          child: new Text("Register",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold)),
                          onPressed: () {
                            print("forget password");
                          }),
                      Padding(
                        padding: EdgeInsets.only(left: 30),
                      ),
                      new FlatButton(
                          child: new Text("Forget Password",
                              style: TextStyle(fontSize: 18)),
                          onPressed: () {
                            print("forget password");
                          }),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

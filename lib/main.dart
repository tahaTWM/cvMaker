import 'package:flutter/material.dart';

import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/services.dart';
import 'package:cvmaker/pages/contact.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String ln = "";
  langauge(String lang) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setString("lan", lang);

    // print(_pref.getString("lan"));
  }

  getlangauge() async {
    // print("getting");
    SharedPreferences _pref = await SharedPreferences.getInstance();

    setState(() {
      ln = _pref.getString("lan") ?? "English";

      if (ln == "English") {
        selectedLanguage = Language("English", "en");
      } else {
        selectedLanguage = Language("Arabic", "ar");
      }
    });
    // print(selectedLanguage.name);
  }

  var en = [
    "CONTACT INFO",
    "OBJECTIVE",
    "EXPERIENCE",
    "EDUCATION",
    "LANGUAGES",
    "SKILLS",
    "CERTIFICATES",
  ];
  var ar = [
    "المعلومات الشخصية",
    "الموضوع",
    "الخبرة",
    "التعليم",
    "اللغة",
    "المهارات",
    "الشهادة",
  ];
  List<Language> listLanguage = <Language>[
    Language("English", "en"),
    Language("Arabic", "ar"),
  ];
  bool chk = true;

  Language selectedLanguage = Language("English", "en");

  @override
  initState() {
    getlangauge();
    // setState(() {
    //   if (ln == "English") {
    //     selectedLanguage = Language("English", "en");
    //   } else {
    //     selectedLanguage = Language("Arabic", "ar");
    //   }
    // });

    // print("ss" + selectedLanguage.name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CREATE NEW CV"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.cyan[400],
        brightness: Brightness.light,
        toolbarHeight: 40,
        automaticallyImplyLeading: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
        ),
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(top: 10),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 0, bottom: 20),
                child: new LinearPercentIndicator(
                  width: MediaQuery.of(context).size.width * 1,
                  animation: true,
                  animationDuration: 1000,
                  lineHeight: 12,
                  percent: 0.3,
                  center: Text(
                    "20.0%",
                    style: TextStyle(fontSize: 10),
                  ),
                  linearStrokeCap: LinearStrokeCap.butt,
                  progressColor: Colors.pink[400],
                  backgroundColor: Color(0xFFFCEED0),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(
                    top: 0, left: 10, right: 2, bottom: 0),
                child: Text("CV Language"),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 0, left: 10, right: 10, bottom: 10),
                child: Container(
                  padding: EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width - 10,
                  height: MediaQuery.of(context).size.height / 11.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 2),
                      ),
                    ],
                    color: Colors.white,
                    // borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
                        width: MediaQuery.of(context).size.width - 120,
                        child: DropdownButtonHideUnderline(
                          child: new DropdownButton<Language>(
                            value: selectedLanguage,
                            icon: Icon(null),
                            iconSize: 100,
                            onChanged: (Language newValue) {
                              setState(() {
                                selectedLanguage = newValue;
                                langauge(selectedLanguage.name);
                              });
                            },
                            onTap: () {
                              setState(() {
                                chk = false;
                              });
                            },
                            items: listLanguage.map((Language language) {
                              return new DropdownMenuItem<Language>(
                                value: language,
                                onTap: () {
                                  setState(() {
                                    chk = true;
                                  });
                                },
                                child: Container(
                                  child: Row(
                                    children: [
                                      Image(
                                        image: AssetImage(
                                            'asset/${language.name}.png'),
                                        width: 80,
                                        height: 70,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Text(
                                          language.name,
                                          style: TextStyle(
                                              fontSize: 26,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              letterSpacing: 1.1),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      Center(
                        child: chk == true
                            ? Icon(
                                Icons.arrow_drop_down,
                                size: 50,
                                color: Colors.pink[400],
                              )
                            : Icon(
                                Icons.arrow_left_rounded,
                                size: 50,
                                color: Colors.pink[400],
                              ),
                      ),
                    ],
                  ),
                ),
              ),

              // Padding(
              //   padding: const EdgeInsets.only(
              //       top: 5, left: 10, right: 2, bottom: 0),
              //   child: Text("CV TEMPLATES"),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(
              //       top: 0, left: 10, right: 10, bottom: 20),
              //   child: GestureDetector(
              //     child: Container(
              //       padding: EdgeInsets.all(5),
              //       width: MediaQuery.of(context).size.width - 20,
              //       // height: MediaQuery.of(context).size.height / 10,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(20),
              //         boxShadow: [
              //           BoxShadow(
              //             color: Colors.grey.withOpacity(0.5),
              //             spreadRadius: 5,
              //             blurRadius: 7,
              //             offset: Offset(0, 2),
              //           ),
              //         ],
              //         color: Colors.white,
              //         // borderRadius: BorderRadius.circular(10),
              //       ),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         children: [
              //           Padding(
              //             padding: const EdgeInsets.only(left: 10),
              //             child: Container(
              //               width: MediaQuery.of(context).size.width / 7,
              //               height: MediaQuery.of(context).size.height / 9,
              //               decoration: BoxDecoration(
              //                   image: DecorationImage(
              //                       image: AssetImage("asset/bg.png"))),
              //             ),
              //           ),
              //           Padding(
              //             padding: const EdgeInsets.only(left: 20),
              //             child: Text(
              //               "Templates",
              //               textAlign: TextAlign.center,
              //               style: TextStyle(
              //                   fontSize: 26,
              //                   fontWeight: FontWeight.bold,
              //                   color: Colors.black,
              //                   letterSpacing: 1.1),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //     onTap: () {
              //       print("Template");
              //     },
              //   ),
              // ),
              Expanded(
                flex: 0,
                child: RotatedBox(
                  quarterTurns: 1,
                  child: Icon(Icons.sync_alt),
                ),
              ),
              Expanded(
                flex: 13,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.5,
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Scrollbar(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.pink[400],
                      ),
                      child: ListView.builder(
                        itemCount: en.length,
                        itemBuilder: (BuildContext context, int index) {
                          // print("dadasd" + selectedLanguage.name);
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 5, top: 8, bottom: 8, right: 5),
                            child: GestureDetector(
                              onTap: () {
                                switch (index) {
                                  case 0:
                                    {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Contact()));
                                    }
                                    break;
                                  case 1:
                                    {}
                                    break;
                                  case 2:
                                    {}
                                    break;
                                  case 3:
                                    {}
                                    break;
                                  case 4:
                                    {}
                                    break;
                                  case 5:
                                    {}
                                    break;

                                  // default:
                                  //   break;
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color: Colors.black38,
                                      blurRadius: 7,
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Image.asset(
                                        "asset/Asset ${index + 1}.png",
                                        width: 30,
                                        height: 30,
                                        color: Color(0xFFFE2E62),
                                      ),
                                    ),
                                    selectedLanguage.name == "English"
                                        ? Text(
                                            en[index],
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 26,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                letterSpacing: 1.1),
                                          )
                                        : Align(
                                            alignment: Alignment.bottomRight,
                                            child: Text(
                                              ar[index],
                                              style: TextStyle(
                                                  fontSize: 26,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  letterSpacing: 1.1),
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.07,
                color: Colors.transparent,
                // ignore: deprecated_member_use
                child: RaisedButton(
                    color: Colors.pink[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                    ),
                    child: Text(
                      "Next",
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                    onPressed: () {}),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Language {
  final String code;
  final String name;

  const Language(this.name, this.code);

  int get hashCode => code.hashCode;

  bool operator ==(Object other) => other is Language && other.code == code;
}

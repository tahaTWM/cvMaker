import 'package:flutter/material.dart';
import '../app.dart';
import '../login/loginPage.dart';

class SelectLanguage extends StatefulWidget {
  @override
  _SelectLanguageState createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  List<Language> listLanguage = <Language>[
    new Language("English", "en"),
    new Language("Arabic", "ar"),
  ];

  Language selectedLanguage = new Language("English", "en");
  bool chk = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Select ",
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFE2E62),
                    ),
                  ),
                  Text(
                    "Language",
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFC331),
                    ),
                  )
                ],
              ),
              Image(
                image: AssetImage(
                  'asset/logo.png',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 0, left: 10, right: 10, bottom: 10),
                child: Container(
                  padding: EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width - 30,
                  height: MediaQuery.of(context).size.height / 10,
                  decoration: BoxDecoration(
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 120,
                        child: DropdownButtonHideUnderline(
                          child: new DropdownButton<Language>(
                            value: selectedLanguage,
                            icon: Icon(null),
                            iconSize: 100,
                            onChanged: (Language newValue) {
                              setState(() {
                                selectedLanguage = newValue;
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
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Image(
                                          image: AssetImage(
                                              'asset/${language.name}.png'),
                                          width: 80,
                                          height: 70,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 30),
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
                      Padding(
                        padding: const EdgeInsets.only(right: 0),
                        child: chk == true
                            ? Icon(
                                Icons.arrow_drop_down,
                                size: 80,
                                color: Color(0xFFFE2E62),
                              )
                            : Icon(
                                Icons.arrow_left_rounded,
                                size: 80,
                                color: Color(0xFFFE2E62),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFFFE2E62),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      bottomRight: Radius.circular(35),
                    ),
                  ),
                  height: MediaQuery.of(context).size.width / 6,
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: Text(
                      "SELECT",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ),
                onTap: () => Navigator.push(
                    context, MaterialPageRoute(builder: (context) => App())),
              ),
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

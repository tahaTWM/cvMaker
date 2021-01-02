import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class EditorPage extends StatefulWidget {
  @override
  _EditorPageState createState() => _EditorPageState();
}

class _EditorPageState extends State<EditorPage> {
  var list = [
    "CONTACT INFORMATION",
    "OBJECTIVE",
    "EXPERIENCE",
    "EDUCATION",
    "LANGUAGES",
    "SKILLS",
    "CERTIFICATES",
  ];
  @override
  Widget build(BuildContext context) {
    List<Language> listLanguage = <Language>[
      new Language("English", "en"),
      new Language("Arabic", "ar"),
      new Language("Kurdi", "kr"),
    ];

    Language selectedLanguage = new Language("English", "en");

    return Scaffold(
      appBar: AppBar(title: Text("EDITOR"), centerTitle: true),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 5, left: 2, right: 2, bottom: 20),
              child: new LinearPercentIndicator(
                width: MediaQuery.of(context).size.width - 4,
                animation: true,
                lineHeight: 20.0,
                animationDuration: 2000,
                percent: 0.4,
                center: Text(
                  "40.0% complete",
                  style: TextStyle(color: Colors.white),
                ),
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.purple,
                backgroundColor: Colors.grey,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 0, left: 10, right: 2, bottom: 5),
              child: Text("CV Language"),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 5, left: 10, right: 10, bottom: 20),
              child: Container(
                padding: EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width - 20,
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
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage('asset/${selectedLanguage.name}.png'),
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height / 13,
                    ),
                    DropdownButtonHideUnderline(
                      child: new DropdownButton<Language>(
                        value: selectedLanguage,
                        onChanged: (Language newValue) {
                          setState(() {
                            selectedLanguage = newValue;
                          });
                        },
                        items: listLanguage.map((Language language) {
                          return new DropdownMenuItem<Language>(
                            value: language,
                            child: Padding(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: Text(
                                language.name,
                                style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    letterSpacing: 1.1),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
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

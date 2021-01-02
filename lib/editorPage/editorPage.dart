import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/percent_indicator.dart';

class EditorPage extends StatefulWidget {
  @override
  _EditorPageState createState() => _EditorPageState();
}

class _EditorPageState extends State<EditorPage> {
  var list = [
    "CONTACT INFO",
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
                  const EdgeInsets.only(top: 0, left: 10, right: 2, bottom: 0),
              child: Text("CV Language"),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 0, left: 10, right: 10, bottom: 10),
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Image(
                        image: AssetImage('asset/${selectedLanguage.name}.png'),
                        width: 100,
                        height: 70,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 200,
                      child: DropdownButtonHideUnderline(
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
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 5, left: 10, right: 2, bottom: 0),
              child: Text("CV TEMPLATES"),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 0, left: 10, right: 10, bottom: 20),
              child: GestureDetector(
                child: Container(
                  padding: EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width - 20,
                  // height: MediaQuery.of(context).size.height / 10,
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          color: Colors.red,
                          width: MediaQuery.of(context).size.width / 7,
                          height: MediaQuery.of(context).size.height / 9,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          "Templates",
                          textAlign: TextAlign.center,
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
                onTap: () {
                  print("Template");
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0, right: 0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.5,
                padding:
                    EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Scrollbar(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 8, bottom: 8, right: 5),
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Colors.black38,
                                  blurRadius: 10,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(13),
                                  child: SvgPicture.asset(
                                    "asset/Asset ${index + 1}.svg",
                                    width: 40,
                                    height: 40,
                                    color: Colors.red,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    list[index],
                                    textAlign: TextAlign.center,
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
                      },
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red,
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 14,
                alignment: Alignment.center,
                child: Text(
                  "Ads",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      letterSpacing: 1.1),
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

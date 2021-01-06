import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/services.dart';

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
  List<Language> listLanguage = <Language>[
    new Language("English", "en"),
    new Language("Arabic", "ar"),
  ];
  bool chk = true;
  Language selectedLanguage = new Language("English", "en");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CREATE NEW CV"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xFFFFC311),
        brightness: Brightness.light,
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 0, bottom: 20),
                child: new LinearPercentIndicator(
                  width: MediaQuery.of(context).size.width,
                  animation: true,
                  animationDuration: 1000,
                  lineHeight: 12,
                  percent: 0.2,
                  center: Text(
                    "20.0%",
                    style: TextStyle(fontSize: 10),
                  ),
                  linearStrokeCap: LinearStrokeCap.butt,
                  progressColor: Color(0xFFFE2E62),
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
                        padding: const EdgeInsets.only(left: 0),
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
              Padding(
                padding: const EdgeInsets.only(
                    top: 5, left: 10, right: 2, bottom: 0),
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
                      // borderRadius: BorderRadius.circular(10),
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
                        bottomLeft: Radius.circular(0),
                        topLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                        topRight: Radius.circular(0),
                      ),
                      child: ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 5, top: 8, bottom: 8, right: 5),
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.black38,
                                    blurRadius: 7,
                                  ),
                                ],
                                // borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(15),
                                    child:
                                        // Image.asset("Asset ${index + 1}.svg"),
                                        SvgPicture.asset(
                                      "asset/Asset ${index + 1}.svg",
                                      width: 30,
                                      height: 30,
                                      color: Color(0xFFFE2E62),
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
                    const EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 0),
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

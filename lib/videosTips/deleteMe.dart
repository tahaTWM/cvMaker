import 'package:flutter/material.dart';

class DeleteMe extends StatefulWidget {
  @override
  _DeleteMeState createState() => _DeleteMeState();
}

class _DeleteMeState extends State<DeleteMe> {
  List<Language> listLanguage = <Language>[
    new Language("English", "en"),
    new Language("Arabic", "ar"),
    new Language("Kurdi", "kr"),
  ];

  Language selectedLanguage = new Language("English", "en");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
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
                          image:
                              AssetImage('asset/${selectedLanguage.name}.png'),
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

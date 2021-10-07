import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Experience extends StatefulWidget {
  @override
  _ExperienceState createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
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
  final _formKey = GlobalKey<FormState>();
  @override
    void initState() {
       lang();
      // TODO: implement initState
      super.initState();
    }
  @override
  
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title:cklangauge==false? Text("Experience"):Text("خبرة"),
        ),
        body: ListView(
          children: [
       Padding(
                padding: const EdgeInsets.all(8.0),
                child: Theme(
                  child: TextField(
                    textAlign:
                        cklangauge == false ? TextAlign.start : TextAlign.end,
                    maxLength: 250,
                    autofocus: true,
                    onEditingComplete: () {
              
                    },
                    // controller: lastnameController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: cklangauge == false
                          ? 'Experience'
                          : 'خبرات',
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
            
          ],
        ),
      ),
    );
  }
}
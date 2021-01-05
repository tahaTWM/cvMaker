import 'package:cvMaker/editorPage/editorPage.dart';
import 'package:cvMaker/homePage/cvTemplate.dart';
import 'package:cvMaker/homePage/interViewQandA.dart';
import 'package:cvMaker/homePage/jobsHiring.dart';
import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: MediaQuery.of(context).size.width * 0.1),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Icon(
                            Icons.add,
                            size: 30,
                          ),
                          Text("Create Youre CV")
                        ],
                      ),
                    ),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditorPage(),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal:
                                MediaQuery.of(context).size.width * 0.1),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            Icon(
                              Icons.videocam,
                              size: 30,
                            ),
                            Text("Videos Tips")
                          ],
                        ),
                      ),
                      onTap: () => print("pressed")),
                ],
              ),
            ),
            SizedBox(height: 10),
            // adding ads for app
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 50),
                decoration: BoxDecoration(
                    color: Colors.pink[800],
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text("ADS"),
                ),
              ),
            ),
            SizedBox(height: 10),
            CVTemplates(),
            SizedBox(height: 10),
            JobHiring(),
            SizedBox(height: 10),
            InterViewQandA(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'page1.dart';

class CvMakerPage extends StatefulWidget {
  @override
  _CvMakerPageState createState() => _CvMakerPageState();
}

class _CvMakerPageState extends State<CvMakerPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            onTap: (index) {
              // Tab index when user select it, it start from zero
            },
            tabs: [
              Tab(
                child: Text(
                  "All",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
              Tab(
                child: Text(
                  "DEVELOPER",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
              Tab(
                child: Text(
                  "SALES & MARKETING",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
            ],
          ),
          title: Text(
            "CV MAKER",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 28, color: Colors.black),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Image(
                width: 50,
                height: 50,
                image: AssetImage("asset/store.png"),
              ),
            )
          ],
          centerTitle: true,
          elevation: 0,
          backgroundColor: Color(0xFFFFC311),
          brightness: Brightness.light,
        ),
        body: TabBarView(
          children: [
            ALL(),
            ALL(),
            ALL(),
          ],
        ),
      ),
    );
  }
}


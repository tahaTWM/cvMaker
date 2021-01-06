import 'package:flutter/material.dart';

class ALL extends StatefulWidget {
  @override
  _ALLState createState() => _ALLState();
}

class _ALLState extends State<ALL> {
  final ScrollController _homeController = ScrollController();

  void _selectedTab() {
    setState(() {
      _homeController.animateTo(
        _homeController.position.minScrollExtent,
        duration: Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 14),
          height: MediaQuery.of(context).size.height - 250,
          width: MediaQuery.of(context).size.width / 1.5,
          child: ListView.builder(
            controller: _homeController,
            itemCount: 7,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  height: MediaQuery.of(context).size.height / 2.3,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      image: DecorationImage(
                          image: AssetImage("asset/bg.png"),
                          fit: BoxFit.fitWidth)),
                  // padding: EdgeInsets.only(left: 100, right: 100, bottom: 10),
                  child: Center(
                    child: Text(
                      "CV ${index + 1}",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              child: CircleAvatar(
                radius: 20,
                child: Icon(Icons.arrow_upward),
              ),
              onTap: () => _selectedTab,
            ),
          ],
        ),
        Container(
          height: 71,
          width: MediaQuery.of(context).size.width,
          child: Text("ADS"),
          color: Colors.pink,
          alignment: Alignment.center,
        ),
      ],
    );
  }
}

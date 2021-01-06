import '../cvPage/cvMakerPage.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CVTemplates extends StatelessWidget {
  List list = [
    "temp ",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("CV Templates"),
                GestureDetector(
                  child: Text("View All.."),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CvMakerPage())),
                ),
              ],
            ),
          ),
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              // color: Colors.blue,
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.black,
                    ),
                    width: 130,
                    height: 100,
                    child: Center(
                      child: Text("${index + 1}",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

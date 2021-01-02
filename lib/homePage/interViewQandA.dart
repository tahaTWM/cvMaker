import 'package:flutter/material.dart';

class InterViewQandA extends StatelessWidget {
  List list = [
    "How to Write\nGood CV",
    "How to Write\nGood CV",
    "How to Write\nGood CV",
    "How to Write\nGood CV",
    "How to Write\nGood CV",
    "How to Write\nGood CV",
    "How to Write\nGood CV",
    "How to Write\nGood CV",
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
                Text("InterView Questions and Answer"),
                GestureDetector(child: Text("View All..")),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(0),
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              // color: Colors.blue,
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black,
                    ),
                    width: 160,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Center(
                        child: Text(
                          list[index],
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
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

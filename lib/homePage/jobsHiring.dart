import 'package:flutter/material.dart';

class JobHiring extends StatelessWidget {
  List list = [
    "EarthLing\nBackend\nDevelober",
    "EarthLing\nBackend\nDevelober",
    "EarthLing\nBackend\nDevelober",
    "EarthLing\nBackend\nDevelober",
    "EarthLing\nBackend\nDevelober",
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
                Text("Job Hiring"),
                GestureDetector(child: Text("View All..")),
              ],
            ),
          ),
          Container(
            height: 120,
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
                    width: 100,
                    child: Center(
                      child: Text(
                        list[index],
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
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

import 'package:flutter/material.dart';

class ALL extends StatefulWidget {
  @override
  _ALLState createState() => _ALLState();
}

class _ALLState extends State<ALL> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 77),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.only(left: 0, top: 14),
                height: MediaQuery.of(context).size.height / 1.27,
                width: MediaQuery.of(context).size.width / 1.5,
                child: ListView.builder(
                  controller: _controller,
                  itemCount: 17,
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
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 20),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_upward,
                    size: 30,
                  ),
                  onPressed: () {
                    _controller.animateTo(
                      0.0,
                      duration: Duration(seconds: 2),
                      curve: Curves.fastOutSlowIn,
                    );
                  },
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 2.5,
        ),
        Container(
          height: MediaQuery.of(context).size.height / 16.8,
          width: MediaQuery.of(context).size.width,
          child: Text("ADS"),
          color: Colors.pink,
          alignment: Alignment.center,
        ),
      ],
    );
  }
}

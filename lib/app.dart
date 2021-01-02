import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'homePage/homepage1.dart';
import 'editorPage/editorPage.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var children2 = <Widget>[
      page1(),
      Container(
        color: Colors.red,
      ),
      Container(
        color: Colors.red,
        // child: CVTemplates(),
      ),
      Container(
        color: Colors.green,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("MSMAR\nCV Maker"),
        actions: [
          FlatButton.icon(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EditorPage()));
            },
            icon: Icon(Icons.store),
            label: Text("More"),
            color: Theme.of(context).primaryColor,
          ),
        ],
        elevation: 1.0,
      ),
      body: SizedBox(
        height: double.infinity,
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: children2,
        ),
      ),
      //bottom nav Bar
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            title: Text('Home'),
            icon: Icon(Icons.home),
          ),
          BottomNavyBarItem(
            title: Text('Jobs'),
            icon: Icon(Icons.work),
          ),
          BottomNavyBarItem(
            title: Text('Q&A'),
            icon: Icon(Icons.article_rounded),
          ),
          BottomNavyBarItem(
            title: Text('Settings'),
            icon: Icon(Icons.settings),
          ),
        ],
        showElevation: false,
        backgroundColor: Colors.white,
      ),
    );
  }
}

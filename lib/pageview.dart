import 'package:callforhelp/ibm_generic.dart';
import 'package:callforhelp/sospage.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainPage extends StatefulWidget {
  List<Widget> pages;
  MainPage({this.pages, Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _index = 0;

  List<IconData> myIcon = [
    Icons.home,
    Icons.notifications,
    Icons.chat_bubble,
    Icons.person
  ];

  List<Color> colors = [
    Color.fromRGBO(242, 174, 193, 1),
    Color.fromRGBO(56, 60, 59, 1),
    Color.fromRGBO(56, 60, 59, 1),
    Color.fromRGBO(56, 60, 59, 1),
  ];

  void _onItemTapped(
    int index,
  ) {
    setState(() {
      _index = index;
    });
  }

  Future<bool> _onWillPop() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit the App'),
        actions: <Widget>[
          new GestureDetector(
            onTap: () => Navigator.of(context).pop(false),
            child: Text("NO"),
          ),
          SizedBox(height: 16),
          new GestureDetector(
            onTap: () => SystemNavigator.pop(),
            child: Text("YES"),
          ),
        ],
      ),
    ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Center(
          child: widget.pages.elementAt(_index),
        ),
        bottomNavigationBar: new Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color.fromRGBO(209, 71, 78, 1)),
          child: new Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              new Positioned(
                child: IconButton(
                  icon: Icon(
                    myIcon[0],
                    size: 40,
                  ),
                  onPressed: () => {_onItemTapped(0),
                    colors[0] = Color.fromRGBO(242, 174, 193, 1),
                    colors[1] = Color.fromRGBO(56, 60, 59, 1),
                    colors[2] = Color.fromRGBO(56, 60, 59, 1),
                    colors[3] = Color.fromRGBO(56, 60, 59, 1)},
                  color: colors[0],
                ),
                left: MediaQuery.of(context).size.width/25,),
              new Positioned(
                child: IconButton(
                  icon: Icon(
                    myIcon[1],
                    size: 40,
                  ),
                  onPressed: () => {_onItemTapped(1),
                    colors[1] = Color.fromRGBO(242, 174, 193, 1),
                    colors[0] = Color.fromRGBO(56, 60, 59, 1),
                    colors[2] = Color.fromRGBO(56, 60, 59, 1),
                    colors[3] = Color.fromRGBO(56, 60, 59, 1)},
                  color: colors[1],
                ),
                left: MediaQuery.of(context).size.width/4.7,),
              new Positioned(
                child: IconButton(
                  icon: Icon(
                    myIcon[2],
                    size: 40,
                  ),
                  onPressed: () => {
                    _onItemTapped(2),
                    colors[2] = Color.fromRGBO(242, 174, 193, 1),
                    colors[1] = Color.fromRGBO(56, 60, 59, 1),
                    colors[0] = Color.fromRGBO(56, 60, 59, 1),
                    colors[3] = Color.fromRGBO(56, 60, 59, 1)},
                  color: colors[2],
                ),
                left: MediaQuery.of(context).size.width/1.55,),

              new Positioned(
                child: IconButton(
                  icon: Icon(
                    myIcon[3],
                    size: 40,
                  ),
                  onPressed: () => {_onItemTapped(3),
                    colors[3] = Color.fromRGBO(242, 174, 193, 1),
                    colors[1] = Color.fromRGBO(56, 60, 59, 1),
                    colors[2] = Color.fromRGBO(56, 60, 59, 1),
                    colors[0] = Color.fromRGBO(56, 60, 59, 1)},
                  color: colors[3],
                ),
                left: MediaQuery.of(context).size.width/1.24,),
            ],
          ),
        ),
        floatingActionButton: new Material(
            type: MaterialType
                .transparency, //Makes it usable on any background color, thanks @IanSmith
            child: Ink(
              decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromRGBO(242, 174, 193, 1), width: 2.0),
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: InkWell(
                //This keeps the splash effect within the circle
                  borderRadius: BorderRadius.circular(
                      1000.0), //Something large to ensure a circle
                  onTap: () => { Navigator.push(context, MaterialPageRoute(builder: (BuildContext build) {
                    return SOSPage();
                  }))},
                  child: Image.asset(
                    'assets/images/helpbutton.png',
                    width: 80,
                    height: 80,
                  )),
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}

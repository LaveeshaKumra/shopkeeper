import 'package:flutter/material.dart';

import 'package:badges/badges.dart';

import 'components/navdrawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bussiness Name',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0), // here the desired height
          child:AppBar(
            title: Text("Business Name"),
            actions: [
              Badge(
                position: BadgePosition.topEnd(top: 3, end: 18),
                animationDuration: Duration(milliseconds: 300),
                animationType: BadgeAnimationType.slide,
                badgeColor: Colors.black,
                badgeContent: Text(
                  '0',
                  style: TextStyle(color: Colors.white),
                ),
                child: IconButton(
                    icon: Icon(Icons.notifications),
                    padding: EdgeInsets.only(right: 30.0),
                    onPressed: () {}),
              ),
              // Badge(
              //   position: BadgePosition.topEnd(top: 3, end: 18),
              //   animationDuration: Duration(milliseconds: 300),
              //   animationType: BadgeAnimationType.slide,
              //   badgeColor: Colors.black,
              //   badgeContent: Text(
              //     '0',
              //     style: TextStyle(color: Colors.white),
              //   ),
              //   child: IconButton(
              //       icon: Icon(Icons.shopping_cart),
              //       padding: EdgeInsets.only(right: 30.0),
              //       onPressed: () {}),
              // ),

            ],
          )
      ),

      body: Container(),
    );
  }
}

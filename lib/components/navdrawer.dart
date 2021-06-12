import 'package:flutter/material.dart';
import 'package:shopkeeper/pages/products.dart';

class NavDrawer extends StatefulWidget {

  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  Future<bool> _onBackPressed(context) {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to LogOut'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: new Text('No'),
          ),
          new FlatButton(
            onPressed: () => _logout(context),
            child: new Text('Yes'),
          ),
        ],
      ),
    ) ??
        false;
  }

  _logout(context) async {

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          // padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 150,

              decoration: BoxDecoration(
                //color: Colors.green,
                  image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage('assets/icons/logo.png')
                         )),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.receipt_long_rounded),
              title: Text('Orders'),
              onTap: () => {
                Navigator.of(context).pop()
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => AllTasks(email,company)),
                // )
              },
            ),
            ListTile(
              leading: Icon(Icons.category_outlined),
              title: Text('Products'),
              onTap: ()  {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductsPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.local_offer_outlined),
              title: Text('Offers'),
              onTap: () => {
                Navigator.of(context).pop()
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => Attendance(email,company,name)),
                // )
              },
            ),

            ListTile(
              leading: Icon(Icons.equalizer),
              title: Text('Analytics'),
              onTap: () => {
                Navigator.of(context).pop()
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => PastReq(email,name,company)),
                // )
              },
            ),
            ListTile(
              leading: Icon(Icons.insights),
              title: Text('Business Insights'),
              onTap: () => {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => Rewards(email)),
                // )
              },
            ),
            ListTile(
              leading: Icon(Icons.feedback_outlined),
              title: Text('Customer Feedback'),
              onTap: () => {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => Rewards(email)),
                // )
              },
            ),
            ListTile(
              leading: Icon(Icons.storefront),
              title: Text('About Business'),
              onTap: () => {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => ReportPage(email)),
                // )
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () => {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => Rewards(email)),
                // )
              },
            ),

            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () => {_onBackPressed(context)},
            ),
          ],
        ),
      ),
    );
  }
}

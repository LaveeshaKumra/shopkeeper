import 'package:shopkeeper/pages/additem.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> with TickerProviderStateMixin {
  String _text = '';
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SpeedDial(

        child: const Icon(Icons.add),
        speedDialChildren: <SpeedDialChild>[
          SpeedDialChild(

            child: const Icon(Icons.add),
            foregroundColor: Colors.white,
            backgroundColor: Colors.red,
            label: 'Add Item',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddItem()),
              );
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.add),
            foregroundColor: Colors.black,
            backgroundColor: Colors.yellow,
            label: 'Add Category',
            onPressed: () {
              _displayTextInputDialog(context);
print(category);

            },
          ),

        ],
        closedForegroundColor: Colors.black,
        openForegroundColor: Colors.white,
        closedBackgroundColor: Colors.white,
        openBackgroundColor: Colors.black,
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("All Products",style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(),
    );
  }


TextEditingController _textFieldController= new TextEditingController();
  var category;
  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Add a new Category'),
            content: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Text Field in Dialog"),
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.red,
                textColor: Colors.white,
                child: Text('CANCEL'),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
              FlatButton(
                color: Colors.green,
                textColor: Colors.white,
                child: Text('OK'),
                onPressed: () {
                  setState(() {
                    print(_textFieldController.text);
                    category = _textFieldController.text;
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        });
  }

}

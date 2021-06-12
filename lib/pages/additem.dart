
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

import 'multi_assets_page.dart';

class AddItem extends StatefulWidget {
  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _title = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _price = TextEditingController();
var category1=["Daily Requirement","Frozen Food","Packed Food"];
  List<DropdownMenuItem> category = [];
var type;

_AddItemState(){
  _categories();
}
_categories(){
  for(int i=0;i<category1.length;i++){

      category.add(DropdownMenuItem(
        child: Text(category1[i]),
        value: Text(category1[i]),
      ));

  }
}

  final PageController controller = PageController();
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(pageControllerListener);
  }

  void pageControllerListener() {
    final int currentPage = controller.page.round();
    if (currentPage != null && currentPage != currentIndex) {
      currentIndex = currentPage;
      if (mounted) {
        setState(() {});
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            "Add Item",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: ListView(
              children: <Widget>[

                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*0.27,
                  child: PageView(
                    controller: controller,
                    children: <Widget>[
                     MultiAssetsPage()
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _title,
                  cursorColor: Theme.of(context).primaryColor,
                  minLines: 1,
                  maxLines: 3,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Item Title',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _description,
                  cursorColor: Theme.of(context).primaryColor,
                  minLines: 1,
                  maxLines: 6,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Item Desription',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
             Container(
               decoration: new BoxDecoration(
               border: new Border.all(
                   color: Colors.grey,
                   // width: 5.0,
                   style: BorderStyle.solid,
               ),
                 borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
               ),
               child:Padding(
                 padding: const EdgeInsets.all(6.0),
                 child: SearchableDropdown.single(
                   underline: Padding(
                     padding: EdgeInsets.all(0),
                   ),
                 clearIcon: type!=null?Icon(Icons.clear,color: Colors.redAccent,):Icon(Icons.add),
                 // validator: (var value) {
                 //   if (value==null) {
                 //     return 'Please enter a farmer';
                 //   }
                 //   return null;
                 // },
                 items: category,
                 value: type,
                 hint: "Select Category",
                 searchHint: "Choose One Category",
                 onChanged: (value) {
                   setState(() {
                     type = value;
                   });
                 },
                 isExpanded: true,
             ),
               ),),

                // DropdownButton(
                //
                //   isExpanded: true,
                //   hint: Text('Category'),
                //   value: type,
                //   items: category
                //       .map((e) =>
                //       DropdownMenuItem(value: e, child: Text(e)))
                //       .toList(),
                //   onChanged: (value) {
                //     setState(() {
                //       type = value;
                //     });
                //   },
                // ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _price,
                  cursorColor: Theme.of(context).primaryColor,
                  keyboardType: TextInputType.number,
                  maxLines: 1,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Item Price',
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

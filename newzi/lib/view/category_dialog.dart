import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class CategoryDialog extends StatelessWidget {
  final ValueChanged<String> onSelectedCategory;

  CategoryDialog({@required this.onSelectedCategory});

  dialogContent(BuildContext context) {
    return Container(
      height: 340.0,
      decoration: new BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.white30,
            blurRadius: 10.0,
            offset: const Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.lightBlueAccent,
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Select news category!',
              textAlign: TextAlign.center,
              style: descriptionStyle.copyWith(fontSize: 16.0, color: Colors.white),
            ),
          ),
          GridView.count(
            crossAxisCount: 3,
            controller: ScrollController(keepScrollOffset: false),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: category.map((String value) {
              return Card(
                color: Colors.white,
                child: GestureDetector(
                  onTap: () {
                    this.onSelectedCategory(value);
                    Navigator.pop(context, value);
                  },
                  child: Column(children: [
                    SizedBox(height: 20.0,),
                    Image.asset('images/$value.png', height: 25, width: 25,),
                    SizedBox(height: 10.0,),
                    Text('${value.toUpperCase()}', style: TextStyle(
                        fontSize: 9.0,
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.normal),)
                  ],),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
}

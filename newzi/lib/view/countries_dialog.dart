import 'package:flag/flag.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant.dart';


class CountryDialog extends StatelessWidget {
  final ValueChanged<String> onSelectedCountry;

  CountryDialog({@required this.onSelectedCountry});

  dialogContent(BuildContext context) {
    return Container(
      height: 350.0,
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
              'Select news country!',
              textAlign: TextAlign.center,
              style: descriptionStyle.copyWith(fontSize: 16.0, color: Colors.white),
            ),
          ),
          GridView.count(
            crossAxisCount: 4,
            controller: ScrollController(keepScrollOffset: false),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: countries.map((String value) {
              return GestureDetector(
                onTap: () {
                  this.onSelectedCountry(value);
                  Navigator.pop(context, value);
                },
                child: Container(
                    margin: EdgeInsets.all(3.0),
                    child: Flag(value.toUpperCase(), height: 5.0, width: 5.0),
                  decoration: new BoxDecoration(
                    color: Colors.white10,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10.0,
                        offset: const Offset(0.0, 10.0),
                      ),
                    ],
                  ),),
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

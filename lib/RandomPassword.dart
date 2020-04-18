import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RandomPassword extends StatelessWidget {
  final String randomWord;

  RandomPassword({this.randomWord});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(7, 0, 15, 0),
      margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 170,
            padding: EdgeInsets.fromLTRB(7, 4, 0, 6),
            margin: EdgeInsets.fromLTRB(7, 0, 0, 0),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(15)),
            child: Text(
              '$randomWord',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w300,
                fontFamily: 'Ariel',
                color: Theme.of(context).primaryColorLight,
              ),
              softWrap: false, // TODO
              overflow: TextOverflow.fade,
            ),
          ),
          Container(
              child: GestureDetector(
            child: Icon(
              Icons.content_copy,
              color: Theme.of(context).primaryColor,
            ),
            onTap: () {
              Clipboard.setData(new ClipboardData(text: randomWord));
              displaySnackBar(context);
            },
          ))
        ],
      ),
    );
  }

  displaySnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Copied to Clipboard'),
      duration: Duration(milliseconds: 500),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }
}

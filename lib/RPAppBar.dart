import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RPAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(children: <Widget>[
        Container(
          height: 60,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/title_image.jpeg'),
                fit: BoxFit.fill,
              ),
              borderRadius:
                  BorderRadius.only(bottomLeft: Radius.circular(100.0))),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
          child: Center(
              child: Text(
            "Memorable Password Generator",
            style: TextStyle(
                color: Theme.of(context).primaryColorLight,
                fontWeight: FontWeight.bold,
                fontSize: 17),
          )),
        ),
        Container(
          height: 60,
          width: 60,
          padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
          margin: EdgeInsets.fromLTRB(50.0, 30.0, 0.0, 0.0),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 20.0,
                spreadRadius: 0.5,
                offset: Offset(
                  2.0,
                  2.0,
                ),
              )
            ],
            image: DecorationImage(
              image: AssetImage('assets/images/title_image_lock.jpg'),
              fit: BoxFit.fill,
            ),
            shape: BoxShape.circle,
          ),
        ),
      ]),
    );
  }
}

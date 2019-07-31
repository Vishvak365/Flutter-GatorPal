import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class RatingPage extends StatefulWidget {
  _RatingPageState createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  double _value = 0;
  double scales = 0.01;
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Rating Time',
              style: TextStyle(color: Colors.blue, fontSize: 30.0)),
          centerTitle: true,
        ),
        body: WillPopScope(
            //Will Pop Scope to prevent popping (backing) into the login page again on Android
            onWillPop: () async {
              Future.value(
                  false); //return a `Future` with false value so this route cant be popped or closed.
            },
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(20),
                  alignment: Alignment.center,
                  child: Text(
                    'On a scale from zero to ten, zero being not scared at all and 10 being the scardest you have ever been, how scared are you about your procedure?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: "Montserrat",
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
                Slider(
                  onChanged: (value) {
                    setState(() {
                      _value = value;
                      print(_value);
                    });
                  },
                  value: _value,
                  activeColor: Colors.blue,
                ),
              ],
            )));
  }
}
  
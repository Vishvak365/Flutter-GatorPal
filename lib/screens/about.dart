import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'rating.dart';

class AboutPage extends StatefulWidget {
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  int index;
  double scales = 0.01;
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('About the App',
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
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .8,
                    //height: Image(image: AssetImage('assets/intropg1.PNG')).height,

                    child: Carousel(
                      images: [
                        Image.asset('assets/intropg1.PNG', scale: scales),
                        Image.asset('assets/intropg2.PNG', scale: scales),
                        Image.asset('assets/intropg3.PNG', scale: scales),
                        Image.asset('assets/intropg4.PNG', scale: scales),
                      ],
                      autoplay: false,
                    )),
                Container(
                    padding: EdgeInsets.only(top: 10),
                    child: ButtonTheme(
                        minWidth: 300.0,
                        height: 40.0,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RatingPage(),
                                maintainState: false,
                              ),
                            );
                          },
                          color: Colors.orange,
                          child: Text('Continue'),
                          splashColor: Colors.blue,
                          textColor: Colors.white,
                        ))),
              ],
            )));
  }
}

import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'rating.dart';

class AboutPage extends StatefulWidget {
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  static int index = 0;
  //Should the continue button move to the next button?
  bool continueToNextPage = false;
  //Array of the different things the text should say
  static final List<String> textArray = [
    "Hello There! This app will help you through whatever else I am supposed to put in this text section",
    "Here is another thing that I will talk about the app. This section has a little bit more about the app",
    "All Set!"
  ];
  
  static final List<String> animationArray = ["Standing","Standing","Thumbs_up"];
  String currentAnimation = "Standing";
  //Current text
  String currentText = textArray[index];
  //int currentIndex = 0;
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
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .6,
              child: FlareActor(
                'assets/Gator.flr',
                animation: currentAnimation,
                snapToEnd: true,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .2,
              child: Text(
                currentText,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 1),
              child: ButtonTheme(
                minWidth: 300.0,
                height: 40.0,
                child: RaisedButton(
                  onPressed: () {
                    setState(
                      () {
                        print(index);
                        if (textArray.length-1 == index) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RatingPage(),
                              maintainState: false,
                            ),
                          );
                        } else {
                          index++;
                          currentText = textArray[index];
                          currentAnimation = animationArray[index];
                        }
                      },
                    );
                  },
                  color: Colors.orange,
                  child: Text('Continue'),
                  splashColor: Colors.blue,
                  textColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

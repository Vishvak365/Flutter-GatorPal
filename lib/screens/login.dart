import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'about.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginPage extends StatefulWidget {
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final double leftRightFormPadding = 40.0;
  String password;
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    bool _success;
    String _userEmail;

    void _signInWithEmailAndPassword() async {
      final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      ))
          .user;
      if (user != null) {
        setState(() {
          _success = true;
          _userEmail = user.email;
        });
      } else {
        _success = false;
      }
    }

    return Scaffold(
      backgroundColor: Colors.blue,
      body: WillPopScope(
        //Will Pop Scope to prevent popping (backing) into the login page again on Android
        onWillPop: () async {
          Future.value(
              false); //return a `Future` with false value so this route cant be popped or closed.
        },
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 60.0),
                child: Text(
                  'Gator P.A.L',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 70.0,
                    letterSpacing: 3.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 50.0),
                child: Image(
                  image: AssetImage('assets/gatorCharacter.png'),
                  alignment: Alignment.center,
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    leftRightFormPadding, 40, leftRightFormPadding, 5),
                child: TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  autofocus: false,
                  decoration: formFields('Provider ID Number'),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please enter your ID number';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    leftRightFormPadding, 0, leftRightFormPadding, 5),
                child: TextFormField(
                  controller: _passwordController,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  autofocus: false,
                  decoration: formFields('Password'),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please enter your Password';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                child: ButtonTheme(
                  minWidth: 300.0,
                  height: 40.0,
                  child: RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _signInWithEmailAndPassword();
                      }
                      if (_success) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AboutPage(),
                            maintainState: false,
                          ),
                        );
                      } else {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text(
                              'Username or Password is Incorrect, please try again'),
                        ));
                      }
                    },
                    color: Colors.orange,
                    child: Text('Login'),
                    splashColor: Colors.blue,
                    textColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

InputDecoration formFields(String hintTextInput) {
  return (InputDecoration(
      focusColor: Colors.green,
      hintText: hintTextInput,
      contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32.0),
      ),
      fillColor: Colors.black,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(2.0),
      )));
}

import 'package:flutter/material.dart';
import 'package:bros/chat_screen.dart';
import 'constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;
  late String email;
  late String password;
  final _auth = FirebaseAuth.instance;
  late User LoggedInUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/chat.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                  email = value;
                },
                decoration: Idecor1,
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                  password = value;
                },
                decoration: Idecor2,
              ),
              SizedBox(
                height: 24.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  elevation: 5.0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFff017f),
                          Color(0xFFce24b3),
                          Color(0xFFbb18d5)
                        ],
                      ),
                    ),
                    child: MaterialButton(
                      onPressed: () async {
                        //Implement login functionality.
                        setState(() {
                          showSpinner = true;
                        });
                        try {
                          final user =
                              await _auth.createUserWithEmailAndPassword(
                                  email: email, password: password);
                          if (user != null) {
                            Navigator.pushNamed(context, ChatScreen.id);

                            setState(() {
                              showSpinner = false;
                            });
                          }
                        } catch (e) {
                          print(e);
                        }
                      },
                      minWidth: 200.0,
                      height: 42.0,
                      child: Text(
                        'Log In',
                      ),
                    ),
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

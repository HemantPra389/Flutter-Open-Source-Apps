import 'package:flutter/material.dart';
import 'package:bros/login_screen.dart';
import 'package:bros/registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'Great.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    height: 80.00,
                    child: Image.asset('images/chat.png'),
                  ),
                ),
                SizedBox(width: 20),
                SizedBox(
                  width: 300,
                  child: DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                    child: AnimatedTextKit(animatedTexts: [
                      ColorizeAnimatedText(
                        'The Bro Code',
                        textStyle: TextStyle(
                          fontSize: 50,
                          fontFamily: 'Lobster',
                        ),
                        colors: [
                          Colors.white,
                          Colors.purple,
                          Colors.blue,
                          Colors.yellow,
                          Colors.red,
                        ],
                      ),
                    ]),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            Great(Colors.white, 'Log In', LoginScreen.id),
            Great(Colors.white, 'Register', RegistrationScreen.id),
          ],
        ),
      ),
    );
  }
}

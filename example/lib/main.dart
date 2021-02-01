import 'package:flutter/material.dart';
import 'package:transition_x/transition_x.dart';

import 'pageOne.dart';
import 'pageTwo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Builder(
        builder: (context) => Scaffold(
          backgroundColor: Colors.red,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/home');
                  },
                  child: Text('Go to Home Page'),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      TransitionX(
                        widget: Home(),
                        bounce: true,
                        transitionType: TransitionType.slideToLeftWithFade,
                      ),
                    );
                  },
                  child: Text('Go to Login Page'),
                ),
              ],
            ),
          ),
        ),
      ),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/home':
            return TransitionX(
              widget: Home(),
              bounce: true,
              transitionType: TransitionType.slideToLeftWithFade,
            );
          case '/login':
            return TransitionX(
              widget: Login(),
              bounce: false,
              transitionType: TransitionType.slideToLeftWithFade,
            );
          default:
            return TransitionX(widget: Home());
        }
      },
    );
  }
}

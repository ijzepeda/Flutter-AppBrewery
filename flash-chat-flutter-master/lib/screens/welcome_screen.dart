import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components/w_rounded_button.dart';
import 'package:firebase_core/firebase_core.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = '/';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
    //UPPERBOUND cant be used with curvedanimaiton, either with opacity in background. with a number greater than 1.

    animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this, //this is the ticker provider
      // upperBound: 100.0, //este no funciona en el fondo
    ); //este se mueve de 1 en 1, por lo que pasa de 0 a 1 en 60 segundos.

    /*CURVED ANIMATION*/
    // animation =
    //     CurvedAnimation(parent: animationController, curve: Curves.bounceOut);

    /*TWEEN ANIMATION : smooth transition, work with colors*/
    animation = ColorTween(begin: Colors.teal, end: Colors.white)
        .animate(animationController);
    animationController.forward(); //play animation in forward
    /*STATUS LISTENER ANIMATION */
    // animationController.reverse(from: 1.0); //set the position
    // animationController.addStatusListener((status) {
    //   print(status);
    //   if (status == AnimationStatus.completed) {
    //     animationController.reverse(from: 1.0);
    //   } else if (status == AnimationStatus.dismissed) {
    //     animationController.forward();
    //   }
    //   //The animation will loop, so I require to dispose it correctly
    // }); //get a status after done animation. it works also with reverse(released) and forward(complete)
    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  String getTitle() {
    return animationController.value * 100 < 100
        ? '${(animationController.value * 100).toInt()}'
        : 'Flash Chat';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      // Colors.white, //.withOpacity(animationController.value), //use the controller value to show the color. en caso de usar este, no funciona con upperbound
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Flexible(
                  child: Hero(
                    tag: 'logo',
                    child: Container(
                      child: Image.asset('images/logo.png'),
                      height: 60,
                      // animationController.value * 100
                    ),
                  ),
                ),
                TypewriterAnimatedTextKit(
                  //'${animationController.value.toInt()}%',
                  text: ["Flash Chat"],
                  speed: Duration(milliseconds: 800),
                  textStyle: TextStyle(
                    fontSize: 45.0, //45
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            ButtonScreen(
              title: 'Log In',
              color: Colors.lightBlueAccent,
              screen: LoginScreen.id,
            ),
            ButtonScreen(
              title: 'Register',
              color: Colors.blueAccent,
              screen: RegistrationScreen.id,
            ),
          ],
        ),
      ),
    );
  }
}

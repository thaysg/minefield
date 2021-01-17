import 'package:flutter/material.dart';
import 'package:minefield/screens/home.dart';
import 'package:splashscreen/splashscreen.dart';

class MySplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SplashScreen(
            seconds: 3,
            navigateAfterSeconds: HomeScreen(),
            loaderColor: Colors.transparent,
          ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: ExactAssetImage(
                  'images/minefield.png',
                ),
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(35.0),
                child: Center(
                  child: Text(
                    'MINEFIELD',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                            blurRadius: 5.0,
                            color: Colors.white,
                            offset: Offset(4.0, 4.0)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:task3/Screens/Login/login_screen.dart';
import 'package:task3/Screens/SignUp/signup_screen.dart';
import 'package:task3/Screens/Welcome/components/Background.dart';
import 'package:task3/components/rounded_button.dart';
import 'package:task3/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "WELCOME",
              style: TextStyle(
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                  fontSize: size.height * 0.08),
            ),
            SizedBox(
              height: size.height * 0.19,
            ),
            SizedBox(
              height: size.height * 0.08,
              child: RoundButton(
                text: "LOGIN",
                textColor: Colors.white,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: size.height * 0.08,
              child: RoundButton(
                text: "REGISTER",
                textColor: Colors.white,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignupScreen();
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

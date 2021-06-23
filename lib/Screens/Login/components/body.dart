import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task3/Screens/Home/home_screen.dart';
import 'package:task3/Screens/Login/components/background.dart';
import 'package:task3/Screens/SignUp/signup_screen.dart';
import 'package:task3/Screens/global.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isHiddenPassword = true;
  bool isPassCorrect = true;
  bool isEmailCorrect = true;
  final formKey = GlobalKey<FormState>();
  TextEditingController username = new TextEditingController();
  TextEditingController emailAddress = new TextEditingController();
  TextEditingController password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "LOGIN",
            style: TextStyle(
              fontSize: size.height * 0.05,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          SizedBox(
            height: size.height * 0.085,
          ),
          Container(
            padding: EdgeInsets.only(top: 1, left: 20, right: 20),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    child: TextFormField(
                      controller: emailAddress,
                      validator: (email) =>
                          email != null && !EmailValidator.validate(email)
                              ? 'Enter a valid email'
                              : isEmailCorrect
                                  ? null
                                  : 'Incorrect email',
                      decoration: InputDecoration(
                        labelText: 'EMAIL',
                        labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  SizedBox(
                    child: TextFormField(
                      controller: password,
                      validator: (password) =>
                          password != null && password.length < 5
                              ? 'Enter min. 5 characters'
                              : null,
                      obscureText: isHiddenPassword,
                      decoration: InputDecoration(
                        labelText: 'PASSWORD',
                        labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: InkWell(
                          onTap: _togglePassword,
                          child: Icon(Icons.visibility),
                        ),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.015),
                  Container(
                    alignment: Alignment(1, 0),
                    padding: EdgeInsets.only(top: 20, left: 20),
                    child: InkWell(
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.065,
                  ),
                  Container(
                    height: size.height * 0.05,
                    child: Material(
                      borderRadius: BorderRadius.circular(20),
                      shadowColor: Colors.greenAccent,
                      color: Colors.green,
                      elevation: 8,
                      child: GestureDetector(
                          onTap: login,
                          child: Center(
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                                fontSize: size.height * 0.026,
                              ),
                            ),
                          )),
                    ),
                  ),
                  SizedBox(height: size.height * 0.065),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "New User ?   ",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: size.height * 0.024,
                          color: Colors.brown,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return SignupScreen();
                              },
                            ),
                          );
                        },
                        child: Text(
                          'SignUp',
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: size.height * 0.024,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  SizedBox(
                    child: Row(
                      children: <Widget>[
                        buildDivider(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "OR",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        buildDivider(),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: size.height * 0.050),
                      Text(
                        'Login using',
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: size.height * 0.024,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icons/facebook_icon.png",
                        height: size.height * 0.05,
                      ),
                      SizedBox(
                        width: size.width * 0.0375,
                      ),
                      Image.asset(
                        "assets/icons/twitter_icon.png",
                        height: size.height * 0.05,
                      ),
                      SizedBox(
                        width: size.width * 0.0375,
                      ),
                      Image.asset(
                        "assets/icons/google-plus_icon.png",
                        height: size.height * 0.05,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void login() async {
    FormState form = formKey.currentState!;
    setState(() {
      isEmailCorrect = true;
      isPassCorrect = true;
    });

    if (form.validate()) {
      TextInput.finishAutofillContext();
      final email = emailAddress.text;
      final pass = password.text;

      SharedPreferences _sh = await SharedPreferences.getInstance();
      setState(() {
        gname = _sh.getString("nameKey")!;
        gemail = _sh.getString("emailKey")!;
        gpassword = _sh.getString("passKey")!;
        gaddress = _sh.getString("addressKey")!;
      });

      if ((email == gemail) && pass == gpassword) {
        ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(SnackBar(
            backgroundColor: Colors.green,
            content: Text('You have successfully logged in.'),
          ));
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return HomeScreen();
            },
          ),
        );
      } else if (email == gemail) {
        setState(() {
          isPassCorrect = false;
        });
      } else {
        setState(() {
          isPassCorrect = false;
          isEmailCorrect = false;
        });
      }
      form = formKey.currentState!;
      form.validate();
    }
  }

  void _togglePassword() {
    isHiddenPassword = !isHiddenPassword;
    setState(() {});
  }
}

Expanded buildDivider() {
  return Expanded(
    child: Divider(
      thickness: 1.5,
      color: Colors.blueGrey[900],
      height: 1.5,
    ),
  );
}

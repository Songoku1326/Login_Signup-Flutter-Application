import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task3/Screens/Login/components/background.dart';
import 'package:task3/Screens/Login/login_screen.dart';
import 'package:task3/Screens/global.dart' as globalData;

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final formKey = GlobalKey<FormState>();
  TextEditingController username = new TextEditingController();
  TextEditingController emailAddress = new TextEditingController();
  TextEditingController password = new TextEditingController();
  saveName(String str) async {
    SharedPreferences _sh = await SharedPreferences.getInstance();
    _sh.setString("nameKey", str);
    _sh.setString("emailKey", str);
    _sh.setString("passwordKey", str);
  }

  // void initState() {
  //   Timer(
  //     Duration(seconds: 3),
  //     () => Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) {
  //           return SignupScreen();
  //         },
  //       ),
  //     ),
  //   );
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "SIGNUP",
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
                      controller: username,
                      validator: (value) =>
                          value == null ? 'Please Fill' : null,
                      decoration: InputDecoration(
                        labelText: 'USERNAME',
                        labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                      ),
                      onChanged: (value) {
                        setState(() {
                          globalData.gname = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  SizedBox(
                    child: TextFormField(
                      controller: emailAddress,
                      validator: (value) =>
                          value == null ? 'Please Fill' : null,
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
                      onChanged: (value) {
                        setState(() {
                          globalData.gemail = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  SizedBox(
                    child: TextFormField(
                      controller: password,
                      validator: (value) =>
                          value == null ? 'Please Fill' : null,
                      decoration: InputDecoration(
                        labelText: 'PASSWORD',
                        labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                      ),
                      onChanged: (value) {
                        setState(() {
                          globalData.gpassword = value;
                        });
                      },
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
                          onTap: signup,
                          child: Center(
                            child: Text(
                              'CREATE ACCOUNT',
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
                        "Have an Account ?   ",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: size.height * 0.022,
                          color: Colors.orange,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return LoginScreen();
                              },
                            ),
                          );
                        },
                        child: Text(
                          'Signin',
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
                        'Signin using',
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

  void signup() async {
    final form = formKey.currentState!;
    if (form.validate()) {
      TextInput.finishAutofillContext();
      final user = username.text;
      final email = emailAddress.text;
      final pass = password.text;

      SharedPreferences _sh = await SharedPreferences.getInstance();
      _sh.setString("nameKey", user);
      _sh.setString("emailKey", email);
      _sh.setString("passKey", pass);
      _sh.setString("addressKey", "");

      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            'Thanks for Signing up! Login to continue',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ));
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return LoginScreen();
          },
        ),
      );
    }
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

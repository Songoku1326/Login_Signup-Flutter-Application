import 'package:flutter/material.dart';
import 'package:task3/Screens/Address/address_screen.dart';
import 'package:task3/Screens/global.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();

  String address = gaddress;
  String name = gname;
  String email = gemail;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Form(
            key: formKey,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.025,
                ),
                Container(
                  alignment: Alignment(0, 0),
                  child: Icon(
                    Icons.account_circle,
                    size: 115,
                    color: Colors.blue[600],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.015,
                ),
                Container(
                  alignment: Alignment(0, 0),
                  child: Text("USER",
                      style: TextStyle(
                          color: Colors.black, fontSize: size.height * 0.028)),
                ),
                SizedBox(
                  height: size.height * 0.020,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'USERNAME',
                    labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                    prefixIcon: Icon(Icons.person),
                    suffixIcon: Icon(Icons.edit),
                  ),
                  initialValue: gname,
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'EMAIL',
                    labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                    prefixIcon: Icon(Icons.email),
                    suffixIcon: Icon(Icons.edit),
                  ),
                  initialValue: gemail,
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                (address != '')
                    ? TextFormField(
                        decoration: InputDecoration(
                          labelText: 'ADDRESS',
                          labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                          prefixIcon: Icon(Icons.email),
                          suffixIcon: Icon(Icons.edit),
                        ),
                        initialValue: gaddress,
                      )
                    : SizedBox(height: size.height * 0.07),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return AddressScreen();
                        },
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      side: BorderSide(
                        color: Colors.green,
                      )),
                  child: Text(
                    "ADD ADDRESS",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: size.height * 0.020,
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

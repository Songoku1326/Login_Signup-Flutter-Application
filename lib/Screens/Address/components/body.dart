import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task3/Screens/Account/account_screen.dart';
import 'package:task3/Screens/Address/components/background.dart';

import '../../global.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final houseController = TextEditingController();
  final localityController = TextEditingController();
  final cityController = TextEditingController();
  final pincodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Container(
        padding: EdgeInsets.all(5),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.025,
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  controller: houseController,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    labelText: 'House no. / Building name',
                    labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  controller: localityController,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    labelText: 'Locality',
                    labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: size.height * 0.018),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  controller: cityController,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    labelText: 'City',
                    labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: size.height * 0.018),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  controller: pincodeController,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    labelText: 'Pin Code',
                    labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: size.height * 0.018),
                  ),
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: size.width * 0.8,
                  height: size.height * 0.08,
                  child: ElevatedButton(
                    onPressed: address,
                    child: Text("Add Address",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: size.height * 0.025,
                          color: Colors.white,
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void address() async {
    final form = formKey.currentState!;
    if (form.validate()) {
      TextInput.finishAutofillContext();
      final name = nameController.text;
      final house = houseController.text;
      final locality = localityController.text;
      final city = cityController.text;
      final pincode = pincodeController.text;

      String address =
          name + ', ' + house + ', ' + locality + ', ' + city + ', ' + pincode;
      gaddress = address;

      SharedPreferences _sh = await SharedPreferences.getInstance();
      _sh.setString("addressKey", address);

      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
          backgroundColor: Colors.blueAccent,
          content: Text(
            'Address updated!',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ));
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return AccountScreen();
          },
        ),
      );
    }
  }
}

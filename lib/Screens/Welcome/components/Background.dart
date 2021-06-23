import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(color: Colors.purple[300]),
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Positioned(
          //   top: 0,
          //   bottom: 0,
          //   child: Image.asset(
          //     "assets/images/pexels-photo-1366907.png",
          //     height: size.height,
          //   ),
          // ),
          child,
        ],
      ),
    );
  }
}

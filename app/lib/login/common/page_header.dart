import 'package:flutter/material.dart';

class PageHeader extends StatelessWidget {
  const PageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.3,
      child: Card(
        color: Color.fromARGB(255, 204, 204, 204),
        shadowColor: Color.fromARGB(255, 204, 204, 204),
        elevation: 8,
        child: Image.asset('assets/images/logo.jpg')
        ),
    );
  }
}
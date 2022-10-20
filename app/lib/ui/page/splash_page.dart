import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:login_signup/ui/page/home_page.dart';

import '../../login/login_page.dart';
import '../core/color.dart';


class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(height: 25),
          const Text(
            'Let\'s find you a Quick job',
            style: TextStyle(
              
              fontSize: 22.0,
              letterSpacing: 1.8,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'Sign up to get started!',
            style: TextStyle(
              color: grey,
              fontSize: 16,
              letterSpacing: 1.8,
              fontWeight: FontWeight.w600,
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 450,
              width: 450,
              child: Image.asset('assets/images/welcome1.jpg'),
            ),
          ),
          const SizedBox(height: 25),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => const HomePage1()));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 80.0,
                vertical: 20.0,
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 93, 114, 144),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Text(
                'Get Started!',
                style: TextStyle(
                  color: white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

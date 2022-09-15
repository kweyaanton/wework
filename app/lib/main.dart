
import 'dart:html';
import 'dart:ui';


import  'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    )
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold( body: LoginScreen()
    )

    return Scaffold(
      body: loginpage(),
    );
  }
}

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "WeWork",
            style: TextStyle(
              color: Colors.black,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "login to your App",
            style: TextStyle(
                color: Colors.blue,
                fontSize: 44.0,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 44.0,
          ),
          TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
                hintText: "User Email",
                prefixIcon: Icon(Icons.mail, color: Colors.black)),
          ),
        ],
      ),
    );
  }
}


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text (
            "WANA WORK Title" ,
             style :TextStyle(
              color: Colors.black,
               fontSize:28.0,
               fontWeight: FontWeight.bold,
            )
          )
          Text(
            "Login to Your App",
           style :TextStyle(
               color: Colors.black,
               fontSize:44.0,
               fontWeight: FontWeight.bold,
           )
          )
          SizedBox(height: 44.0,
          )
          TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: "User Email",
              prefixIcon: Icon(Icon.mail, color: Colors.black,
              )
             ),
            )
        ],
      ),
      );
  }
}
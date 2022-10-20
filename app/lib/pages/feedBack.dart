// ignore_for_file: dead_code

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/maps_screens/main.dart';
import 'package:login_signup/maps_screens/store.dart';
import 'package:login_signup/pages/available.dart';

class feedBackPage extends StatefulWidget {
  @override
  State<feedBackPage> createState() => _feedBackPageState();
}

class _feedBackPageState extends State<feedBackPage> {
  var Dets = FirebaseAuth.instance.currentUser;

  String message = 'Application Pending';

  fetchFeedBack() async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(Dets!.uid)
        .collection('Status')
        .doc(Dets!.uid)
        .get()
        .then((ds) {
      setState(() {
        message = ds.data()!['email'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 93, 114, 144),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const availabe()),
            );
          },
          icon: Icon(Icons.menu),
        ),
        title: Text('FeedBack'),
      ),
      body: FutureBuilder(
          future: fetchFeedBack(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done)
              // ignore: curly_braces_in_flow_control_structures
              return Column(
                children: [
                  Container(
                     decoration: BoxDecoration(
              color: Color.fromARGB(255, 93, 114, 144),
            ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => MyApp2()));
                      },
                      child: const Text("Direction"),
                    ),
                  ),
                  const SizedBox(height: 20.0,),
                  Center(
                    child: Text(
                      message,
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              );

            return Text('not done');
          }),
    );
  }
}

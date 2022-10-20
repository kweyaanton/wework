import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/jobs/application/transactions.dart';
import 'package:login_signup/pages/available.dart';
import 'package:login_signup/users/user.dart';

import '../data/clients.dart';
import '../data/jobs.dart';

// ignore: camel_case_types
class status extends StatelessWidget {
  final String jobType;
  final int jobprice;
  var IDS;

  status(
      {super.key,
      required this.jobType,
      required this.jobprice,
      required this.IDS});



  Future createUsers(Clients user) async {
    final data = FirebaseFirestore.instance.collection('application').doc(IDS).collection('applicants').doc(Details!.uid);
    final json = user.toCloud();
    await data.set(json);
  }

  var Details = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        elevation: 0,
        leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
             Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const availabe()),
            );
            }),
      ),
      body: Container(
        child: Column(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.all(20.0),
                padding: EdgeInsets.all(20.0),
                color: Colors.amber,
                child: Text(jobType),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(child: Text('$jobprice')),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  var userf = Clients(
                      email: Details!.email.toString(), UID: Details!.uid);
                  createUsers(userf);


                },
                child: Text('apply')),
          ],
        ),
      ),
    );
  }
}

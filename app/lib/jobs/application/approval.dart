import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/authentication/verification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_signup/jobs/data/clients.dart';

import 'confirmations.dart';

class approval extends StatefulWidget {
  var UserId;
  approval({required this.UserId});

  @override
  State<approval> createState() => _approvalState(ClientDetails: UserId);
}

class _approvalState extends State<approval> {
  var ClientDetails;

  _approvalState({required this.ClientDetails});

  var IDUser = FirebaseAuth.instance.currentUser;



  String id = '';
  String FirstName = 'hello';
  String LastName = '';
  String Age = '';
  String Gender = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lime,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const verification()),
            );
          },
          icon: Icon(Icons.menu),
        ),
        title: Text('Account Details'),
      ),
      body: FutureBuilder(
          future: fetchUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done)
              return Scaffold(
                appBar: AppBar(
                  title: Text(FirstName),
                ),
                body: Column(children: [
                  SizedBox(
                    height: 20,
                  ),
                  Center(child: Card(child: Text(LastName))),
                  SizedBox(
                    height: 20,
                  ),
                  Center(child: Card(child: Text(Age))),
                  SizedBox(
                    height: 20,
                  ),
                  Center(child: Card(child: Text(Gender))),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        var person = confirmations(message: 'YOU HAVE BEEN APPROVED');
                        approve(person);
                      },
                      child: Text('Approve')),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(onPressed: () {
                    FirebaseFirestore.instance
                            .collection("application")
                            .doc(IDUser!.uid)
                            .collection('applicants')
                            .doc(ClientDetails)
                            .delete();
                  }, child: Text('Decline')),
                ]),
              );

            return Text('not done');
          }),
    );
  }



   Future approve(confirmations user) async {
  final data = FirebaseFirestore.instance.collection('Users').doc(ClientDetails).collection('Status').doc(ClientDetails);
  final json = user.toCloud();
  await data.set(json);
   }

  fetchUser() async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(ClientDetails)
        .get()
        .then((ds) {
      setState(() {
        FirstName = ds.data()!['FirstName'];
        LastName = ds.data()!['Last'];
        Age = ds.data()!['Age'];
        Gender = ds.data()!['Gender'];
      });
    });
  }
}

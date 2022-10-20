// ignore_for_file: dead_code

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/pages/transaction.dart';


class userPage extends StatefulWidget {
  @override
  State<userPage> createState() => _userPageState();
}

class _userPageState extends State<userPage> {
  var Dets = FirebaseAuth.instance.currentUser;

        String FirstName= ''; 
        String LastName= '';
        String Age = '';
        String Gender = '';
        String email = '';

  fetchFeedBack() async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(Dets!.uid)
        .get()
        .then((ds) {
      setState(() {
        FirstName = ds.data()!['FirstName'];
        LastName = ds.data()!['LastName'];
        Age = ds.data()!['Age'];
        Gender = ds.data()!['Gender'];
        email = ds.data()!['email'];
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
                  
                  const SizedBox(height: 20.0,),
                  Center(
                    child: Text(
                      FirstName,
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

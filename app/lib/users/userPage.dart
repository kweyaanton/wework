// ignore_for_file: dead_code

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/pages/profile_page.dart';
import 'package:login_signup/pages/transaction.dart';
import 'package:login_signup/ui/core/color.dart';


class userPage extends StatefulWidget {
  @override
  State<userPage> createState() => _userPageState();
}

class _userPageState extends State<userPage> {
  var Dets = FirebaseAuth.instance.currentUser;

        String FirstName= 'hello'; 
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
        LastName = ds.data()!['Last'];
        Age = ds.data()!['Age'];
        Gender = ds.data()!['Gender'];
        email = ds.data()!['email'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/theme.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 93, 114, 144),
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
            icon: const Icon(Icons.settings_applications_rounded),
          ),
          title: const Text('Profile'),
        ),
        body: FutureBuilder(
            future: fetchFeedBack(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done)
                // ignore: curly_braces_in_flow_control_structures
                return Column(
                  children: [
                    
                    const SizedBox(height: 20.0,),
                    Card(
                      elevation: 50,color: Colors.green,
                      child: Text(
                        'FirstName: $FirstName',
                        style: const TextStyle(
                          fontSize: 20.0,
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0,),
                    Card(
                      elevation: 50,color: Colors.green,
                      child: Text(
                        'LastName: $LastName',
                        style: const TextStyle(
                          fontSize: 20.0,
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0,),
                    Card(
                      elevation: 50,color: Colors.green,
                      child: Text(
                        'Age: $Age',
                        style: const TextStyle(
                          fontSize: 20.0,
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0,),
                    Card(
                      elevation: 50,color: Colors.green,
                      child: Text(
                        'Gender: $Gender',
                        style: const TextStyle(
                          fontSize: 20.0,
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0,),
                    Card(
                      elevation: 50,color: Colors.green,
                      child: Text(
                        'email: $email',
                        style: const TextStyle(
                          fontSize: 20.0,
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                );
    
              return const Text('not done');
            }),
      ),
    );  
    
    
    
    }
}

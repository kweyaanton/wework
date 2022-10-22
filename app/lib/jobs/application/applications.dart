import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/jobs/data/jobs.dart';
import 'package:login_signup/pages/available.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:location/location.dart' as loc;

import '../../pages/feedBack.dart';

// ignore: camel_case_types
class application extends StatefulWidget {
  const application({super.key});

  @override
  State<application> createState() => _applicationState();
}

// ignore: camel_case_types
class _applicationState extends State<application> {
  var FirebaseUsers = FirebaseAuth.instance.currentUser;
  final loc.Location location = loc.Location();
  StreamSubscription<loc.LocationData>? _locationSubscription;

  @override
  Widget build(BuildContext context) {
    TextEditingController jobtype = TextEditingController();
    TextEditingController location = TextEditingController();
    TextEditingController price = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 93, 114, 144),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => feedBackPage()),
            );
          },
        ),
        title: Text("job applications"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: TextField(
                  controller: jobtype,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'what job are you looking for',
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: TextField(
                  controller: price,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'price',
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: TextField(
                  controller: location,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'describe your job',
                  ),
                ),
              ),
            ),
          ),

          // ignore: prefer_const_constructors
          SizedBox(
            height: 10,
          ),
          TextButton(
              onPressed: () {
                _getLocation();
              },
              child: const Text('add my location')),
          TextButton(
              onPressed: () {
                _listenLocation();
              },
              child: Text('enable live location')),
          TextButton(
              onPressed: () {
                _stopListening();
              },
              child: Text('stop live location')),
          const SizedBox(
            height: 10,
          ),

          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 93, 114, 144),
            ),
            child: ElevatedButton(
              onPressed: () {
                final user = Client(
                  jobtype: jobtype.text,
                  price: int.parse(price.text),
                  location: location.text,
                  ID: FirebaseUsers!.uid,
                );

                createUser(user);

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const availabe()));
              },
              child: Text("create"),
            ),
          ),
        ],
      ),
    );
  }

  Future createUser(Client user) async {
    final data = FirebaseFirestore.instance
        .collection('application')
        .doc(FirebaseUsers!.uid);
    final json = user.toCloud();
    await data.set(json);
  }

  _getLocation() async {
    try {
      final loc.LocationData locationResult = await location.getLocation();
      await FirebaseFirestore.instance.collection('location').doc('user1').set({
        'latitude': locationResult.latitude,
        'longitude': locationResult.longitude,
        'name': 'john'
      }, SetOptions(merge: true));
    } catch (e) {
      print(e);
    }
  }

  Future<void> _listenLocation() async {
    _locationSubscription = location.onLocationChanged.handleError((onError) {
      print(onError);
      _locationSubscription?.cancel();
      setState(() {
        _locationSubscription = null;
      });
    }).listen((loc.LocationData currentlocation) async {
      await FirebaseFirestore.instance.collection('location').doc('user1').set({
        'latitude': currentlocation.latitude,
        'longitude': currentlocation.longitude,
        'name': 'john'
      }, SetOptions(merge: true));
    });
  }

  _stopListening() {
    _locationSubscription?.cancel();
    setState(() {
      _locationSubscription = null;
    });
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/jobs/application/approval.dart';
import 'package:login_signup/jobs/data/clients.dart';
import 'package:login_signup/ui/core/color.dart';

class transactions extends StatefulWidget {
  const transactions({super.key});

  @override
  State<transactions> createState() => _transactionsState();
}

class _transactionsState extends State<transactions> {
  var FirebaseUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 93, 114, 144),
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
        title: const Text("Transactions"),
      ),
      body: StreamBuilder<List<Clients>>(
        stream: readUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('someting when wrong');
          } else if (snapshot.hasData) {
            final users = snapshot.data!;
            return ListView(
              padding: const EdgeInsets.all(8.0),
              itemExtent: 106.0,
              children: users.map(buildUser).toList(),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget buildUser(Clients user) => Card(
    child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => approval(UserId: user.UID,)));
          },
          child: Container(
            decoration: BoxDecoration(
                      image: const DecorationImage(
                        image:AssetImage('assets/images/red.jpg'),
                        fit: BoxFit.cover,
                      ),
                      color: Colors.grey[300],
                    ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
                      child: Text(
                        user.email,
                        style: const TextStyle(
                          color: black,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
  );

  Stream<List<Clients>> readUsers() => FirebaseFirestore.instance
      .collection('application')
      .doc(FirebaseUser!.uid)
      .collection('applicants')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Clients.fromCloud(doc.data())).toList());
}

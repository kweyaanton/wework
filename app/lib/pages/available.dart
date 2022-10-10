import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/authentication/verification.dart';
import 'package:login_signup/jobs/data/jobs.dart';
import 'customList.dart';

class availabe extends StatefulWidget {
  const availabe({super.key});

  @override
  State<availabe> createState() => _availabeState();
}

class _availabeState extends State<availabe> {
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
            icon: Icon(Icons.menu)),
        title: Text("Home"),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              width: 36,
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(10)),
              child: Center(child: Text("0")),
            ),
          )
        ],
      ),
      body: StreamBuilder<List<Client>>(
        stream: readUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('someting when wrong');
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

  Widget buildUser(Client user) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Text('${user.jobtype}'),
            ),
            Expanded(
              flex: 3,
              child: VideoDescription(
                title: user.location,
                price: user.price,
              ),
            ),
            const Icon(
              Icons.more_vert,
              size: 16.0,
            ),
          ],
        ),
      );

  Stream<List<Client>> readUsers() => FirebaseFirestore.instance
      .collection('application')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Client.fromCloud(doc.data())).toList());
}

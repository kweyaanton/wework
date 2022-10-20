import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/ui/core/color.dart';
import '../jobs/data/clients.dart';
import 'package:firebase_auth/firebase_auth.dart';

class availabe extends StatefulWidget {
  const availabe({super.key});

  @override
  State<availabe> createState() => _availabeState();
}

class _availabeState extends State<availabe> {
  ScrollController _controller = new ScrollController();

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
        title: const Text(
          "Clients",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: StreamBuilder<List<Clients>>(
        stream: readUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('someting when wrong');
          } else if (snapshot.hasData) {
            final users = snapshot.data!;
            return ListView(
              physics: const AlwaysScrollableScrollPhysics(), // new
              controller: _controller,
              padding: const EdgeInsets.all(8.0),
              itemExtent: 106.0,
              scrollDirection: Axis.horizontal,
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

  Widget buildUser(Clients user) => GestureDetector(
        onTap: () {},
        child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://media.istockphoto.com/photos/old-wall-background-picture-id1296377266?k=20&m=1296377266&s=612x612&w=0&h=0B9aq2sZyKPu9ipBFtWQ7aCW_HRwh5Hy3gwayAgc1b0='),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(
                      width: 8,
                      color: Color.fromARGB(255, 93, 114, 144),
                    ),
                  ),
                  padding: const EdgeInsets.fromLTRB(10.0, 20.0, 0.0, 20.0),
                  child: Text(
                    '${user.UID}',
                    style: TextStyle(
                      color: black,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    border: Border.all(
                      width: 8,
                      color: Colors.blue,
                    ),
                  ),
                  padding: const EdgeInsets.fromLTRB(10.0, 20.0, 0.0, 20.0),
                  child: Text(
                    '${user.email}',
                    style: TextStyle(
                      color: black,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              const Icon(
                Icons.more_vert,
                size: 16.0,
              ),
            ],
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

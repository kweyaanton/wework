import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/jobs/data/jobs.dart';
import 'package:login_signup/pages/available.dart';

// ignore: camel_case_types
class application extends StatefulWidget {
  const application({super.key});

  @override
  State<application> createState() => _applicationState();
}

// ignore: camel_case_types
class _applicationState extends State<application> {
  @override
  Widget build(BuildContext context) {
    TextEditingController jobtype = TextEditingController();
    TextEditingController location = TextEditingController();
    TextEditingController price = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.menu),
        title: Text("job applications"),
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
      body: Column(
        children: [
          TextField(
            controller: jobtype,
            decoration: InputDecoration(
              hintText: 'what type of task do you want done',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: location,
            decoration: InputDecoration(
              hintText: 'location',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: price,
            decoration: InputDecoration(
              hintText: 'price',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              final user = Client(
                jobtype: jobtype.text,
                price: int.parse(price.text),
                location: location.text,
              );

              createUser(user);

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const availabe()));
            },
            child: Text("create"),
          ),
        ],
      ),
    );
  }
}

Future createUser(Client user) async {
  final data = FirebaseFirestore.instance.collection('application').doc();
  final json = user.toCloud();
  await data.set(json);
}

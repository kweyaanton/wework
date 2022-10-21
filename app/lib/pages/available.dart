import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/jobs/application/applications.dart';
import 'package:login_signup/jobs/application/transactions.dart';
import 'package:login_signup/jobs/data/jobs.dart';
import 'package:login_signup/jobs/status/status.dart';
import 'package:login_signup/ui/core/color.dart';
import 'customList.dart';

class availabe extends StatefulWidget {
  const availabe({super.key});

  @override
  State<availabe> createState() => _availabeState();
}

class _availabeState extends State<availabe> {
  final ScrollController _controller = ScrollController();

  var userId = '';

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
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const availabe()),
              );
            },
            icon: const Icon(Icons.arrow_circle_left_rounded),
          ),
          title: const Text("Available Jobs"),
        ),
        body: StreamBuilder<List<Client>>(
          stream: readUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text('someting when wrong');
            } else if (snapshot.hasData) {
              final users = snapshot.data!;
              return Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Card(
                      elevation: 50,
                      color: white,
                      child: SizedBox(
                        width: double.infinity,
                        height: 150,
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/theme.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                const Expanded(
                                  flex: 2,
                                  child: SizedBox(
                                    height: 20,
                                    child: Text(
                                      'Check On Your Progress',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color:
                                            Color.fromARGB(255, 93, 114, 144),
                                        fontWeight: FontWeight.w500,
                                      ), //Textstyle
                                    ),
                                  ),
                                ), //Text
                                //Text//SizedBox
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 20.0,
                                      ),
                                      SizedBox(
                                        width: 120,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pushReplacement(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            transactions()));
                                          },
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                            const Color.fromARGB(
                                                255, 93, 114, 144),
                                          )),
                                          child: Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8, 4, 4, 4),
                                              child: Row(
                                                children: const [
                                                  Icon(Icons.touch_app),
                                                  Text('Clients')
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      SizedBox(
                                        width: 120,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pushReplacement(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            application()));
                                          },
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                            Color.fromARGB(255, 93, 114, 144),
                                          )),
                                          child: Padding(
                                            padding: const EdgeInsets.all(4),
                                            child: Row(
                                              children: const [
                                                Icon(Icons.touch_app),
                                                Text('Status')
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ) //SizedBox
                              ],
                            ), //Column
                          ),
                        ), //Padding
                      ), //SizedBox
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Expanded(
                    flex: 4,
                    child: ListView(
                      physics: const AlwaysScrollableScrollPhysics(), // new
                      controller: _controller,

                      padding: const EdgeInsets.all(8.0),
                      itemExtent: 106.0,
                      children: users.map(buildUser).toList(),
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Widget buildUser(Client user) => GestureDetector(
        onTap: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder: (context) => status(
                      jobType: user.jobtype,
                      jobprice: user.price,
                      IDS: user.ID,
                    )),
          );
        },
        child: Card(
          elevation: 3,
          child: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image:AssetImage('assets/images/paint.jpg'),
                        fit: BoxFit.cover,
                      ),
                      color: Colors.grey[300],
                    ),
                    child: Text(
                      '${user.jobtype}: needed',
                      style: const TextStyle(
                        color: black,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
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
          ),
        ),
      );

  Stream<List<Client>> readUsers() => FirebaseFirestore.instance
      .collection('application')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Client.fromCloud(doc.data())).toList());
}

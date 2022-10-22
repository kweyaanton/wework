import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/authentication/verification.dart';
import 'package:login_signup/jobs/application/transactions.dart';
import 'package:login_signup/pages/available.dart';
import 'package:login_signup/pages/feedBack.dart';
import 'package:login_signup/pages/profile_page.dart';
import 'package:login_signup/users/userPage.dart';
import 'package:maps_launcher/maps_launcher.dart';
import '../../jobs/application/applications.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({Key? key}) : super(key: key);

  @override
  State<HomePage1> createState() => _HomePageState();
}

launchMap(lat, long) {
  MapsLauncher.launchCoordinates(lat, long);
}

class _HomePageState extends State<HomePage1> {
  var Dets = FirebaseAuth.instance.currentUser;

  String FirstName = 'hello';
  String LastName = '';
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

  PageController controller = PageController();
  @override
  void initState() {
    controller = PageController(viewportFraction: 0.6, initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/home.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          drawer: Drawer(
            backgroundColor: Colors.cyan,
            // Add a ListView to the drawer. This ensures the user can scroll
            // through the options in the drawer if there isn't enough vertical
            // space to fit everything.
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(width: 4, color: Colors.white),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1))
                          ],
                          shape: BoxShape.circle,
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: const NetworkImage(
                                'https://media.istockphoto.com/photos/old-wall-background-picture-id1296377266?k=20&m=1296377266&s=612x612&w=0&h=0B9aq2sZyKPu9ipBFtWQ7aCW_HRwh5Hy3gwayAgc1b0='),
                          )),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 4, color: Colors.white),
                              color: Colors.blue),
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProfilePage()),
                              );
                            },
                            icon: const Icon(
                              Icons.edit_note_sharp,
                              color: Colors.white,
                            ),
                          ),
                        )),
                  ],
                ),
                const SizedBox(height: 30),
                FutureBuilder(
                    future: fetchFeedBack(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState != ConnectionState.done) {
                        return ListTile(
                          title: Text(
                            'welcome back $FirstName',
                            style: const TextStyle(
                              decorationStyle: TextDecorationStyle.wavy,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          onTap: () {
                            // Update the state of the app
                            // ...
                            // Then close the drawer
                            Navigator.pop(context);
                          },
                        );
                      }

                      return const Text('check your internet connection');
                    }),
                ListTile(
                  title: const Text('Pop'),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 70,
                  child: Card(
                    color: const Color.fromARGB(137, 16, 105, 86),
                    elevation: 50,
                    shadowColor: Color.fromARGB(255, 24, 7, 2),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const transactions()),
                          );
                        },
                        child: const Text('Transactions'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 70,
                  child: Card(
                    color: const Color.fromARGB(137, 16, 105, 86),
                    elevation: 50,
                    shadowColor: Color.fromARGB(255, 24, 7, 2),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const verification()),
                          );
                        },
                        child: const Text('get verified'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 70,
                  child: Card(
                    color: const Color.fromARGB(137, 16, 105, 86),
                    elevation: 50,
                    shadowColor: const Color.fromARGB(255, 24, 7, 2),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => application()),
                          );
                        },
                        child: const Text('clients'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 70,
                  child: Card(
                    color: const Color.fromARGB(137, 16, 105, 86),
                    elevation: 50,
                    shadowColor: const Color.fromARGB(255, 24, 7, 2),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => feedBackPage()),
                          );
                        },
                        child: const Text('feedBack'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          appBar: AppBar(
            elevation: 20,
            backgroundColor: const Color.fromARGB(255, 207, 190, 190),
            leadingWidth: 40,
            actions: [
              Container(
                height: 40.0,
                width: 40.0,
                margin: const EdgeInsets.only(right: 20, top: 10, bottom: 5),
                decoration: BoxDecoration(
                  color:
                      const Color.fromARGB(255, 40, 172, 169).withOpacity(0.5),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 40, 172, 169).withOpacity(0.5),
                      blurRadius: 10,
                      offset: const Offset(0, 0),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10.0),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/three.jpg'),
                  ),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 20.0),
                  child: Row(
                    children: [
                      Card(
                        shadowColor: Colors.brown,
                        elevation: 50,
                        color: Color.fromARGB(255, 3, 40, 141),
                        semanticContainer: true,
                        child: Container(
                          height: 20.0,
                          width: 200.0,
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(255, 28, 51, 54)
                                    .withOpacity(0.15),
                                blurRadius: 10,
                                offset: const Offset(0, 0),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const SizedBox(
                                height: 45,
                                width: 100,
                                child: Text(
                                  'hello',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 10, 120, 134),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        height: 45.0,
                        width: 45.0,
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 93, 114, 144),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 40, 172, 169)
                                  .withOpacity(0.5),
                              blurRadius: 10,
                              offset: const Offset(0, 0),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: IconButton(
                          padding: EdgeInsets.only(right: 20),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => userPage()),
                            );
                          },
                          icon: const Icon(Icons.assignment_ind_outlined),
                        ),
                      ),
                    ],
                  ),
                ),

                /** Card Widget **/
                Card(
                  elevation: 50,
                  shadowColor: Colors.brown,
                  color: Colors.cyanAccent,
                  child: SizedBox(
                    width: 450,
                    height: 300,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          //CircleAvatar
                          const SizedBox(
                            height: 10,
                          ), //SizedBox
                          const Text(
                            'Welcome to WeWork',
                            style: TextStyle(
                              fontSize: 30,
                              color: Color.fromARGB(255, 93, 114, 144),
                              fontWeight: FontWeight.w500,
                            ), //Textstyle
                          ), //Text
                          const SizedBox(
                            height: 10,
                          ), //SizedBox
                          const Text(
                            'Welcome to we work Ugandas Most trusted Capital builder here at we work we would like for you to build your wealth even if you doont have that degree yet or even if you dont have any quallifications   experiences and much more!!',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 40, 172, 169),
                            ), //Textstyle
                          ), //Text
                          const SizedBox(
                            height: 10,
                          ), //SizedBox
                          Row(
                            children: [
                              SizedBox(
                                width: 150,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) => availabe()));
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                    const Color.fromARGB(255, 93, 114, 144),
                                  )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Row(
                                      children: const [
                                        Icon(Icons.touch_app),
                                        Text('Find Jobs')
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              SizedBox(
                                width: 150,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
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
                                        Text('Create Job')
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ) //SizedBox
                        ],
                      ), //Column
                    ), //Padding
                  ), //SizedBox
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



// Color.fromARGB(255, 40, 172, 169).withOpacity(0.5),
// 'Welcome to we work Ugandas Most trusted Capital builder here at we work we would like for you to build your wealth even if you doont have that degree yet or even if you dont have any quallifications   experiences and much more!!',
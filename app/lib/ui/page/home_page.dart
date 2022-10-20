import 'package:flutter/material.dart';
import 'package:login_signup/pages/available.dart';
import 'package:login_signup/users/userPage.dart';
import 'package:maps_launcher/maps_launcher.dart';
import '../../jobs/application/applications.dart';
import '../../pages/profile_page.dart';


class HomePage1 extends StatefulWidget {
  const HomePage1({Key? key}) : super(key: key);

  @override
  State<HomePage1> createState() => _HomePageState();
}

launchMap(lat, long) {
  MapsLauncher.launchCoordinates(lat, long);
}

class _HomePageState extends State<HomePage1> {
  PageController controller = PageController();
  @override
  void initState() {
    controller = PageController(viewportFraction: 0.6, initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/home.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 20,
          backgroundColor: Color.fromARGB(255, 19, 0, 0),
          automaticallyImplyLeading: false,
          leadingWidth: 40,
          leading: TextButton(
            onPressed: () {},
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => userPage()),
                );
              },
              icon: Icon(Icons.menu),
            ),
          ),
          actions: [
            Container(
              height: 40.0,
              width: 40.0,
              margin: const EdgeInsets.only(right: 20, top: 10, bottom: 5),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 40, 172, 169).withOpacity(0.5),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 40, 172, 169).withOpacity(0.5),
                    blurRadius: 10,
                    offset: const Offset(0, 0),
                  ),
                ],
                borderRadius: BorderRadius.circular(10.0),
                image: const DecorationImage(
                  image: AssetImage('assets/images/pro.jpg'),
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
                              color: Color.fromARGB(255, 28, 51, 54)
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
                        color: Color.fromARGB(255, 93, 114, 144),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 40, 172, 169)
                                .withOpacity(0.5),
                            blurRadius: 10,
                            offset: const Offset(0, 0),
                          ),
                        ], 
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ProfilePage()),
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
                                    backgroundColor: MaterialStateProperty.all(
                                  Color.fromARGB(255, 93, 114, 144),
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
                                          builder: (context) => application()));
                                },
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
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
    );
  }
}



// Color.fromARGB(255, 40, 172, 169).withOpacity(0.5),
// 'Welcome to we work Ugandas Most trusted Capital builder here at we work we would like for you to build your wealth even if you doont have that degree yet or even if you dont have any quallifications   experiences and much more!!',
import 'package:flutter/material.dart';
import 'package:login_signup/new/master.dart';

class CreateResume extends StatefulWidget {
  @override
  _CreateResumeState createState() => _CreateResumeState();
}

class _CreateResumeState extends State<CreateResume> {
  TextEditingController jobType = TextEditingController();
  TextEditingController contact = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController language = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController budget2 = TextEditingController();
  List<Widget> list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff3F0000),
        title: const Text(
          'start task',
          style: TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const SizedBox(height: 20),
              const Text(
                'Details',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
              const SizedBox(height: 40),
              Row(children: <Widget>[
                Flexible(
                  child: TextField(
                    controller: jobType,
                    decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(width: 2),
                        ),
                        prefixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        hintText: 'input job type'),
                  ),
                ),
                const SizedBox(width: 15),
                Flexible(
                  child: TextField(
                    controller: contact,
                    decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(width: 2),
                        ),
                        prefixIcon: const Icon(Icons.contact_page),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        hintText: 'Contact'),
                  ),
                ),
              ]),
              const SizedBox(height: 15),
              TextField(
                controller: location,
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                    ),
                    prefixIcon: const Icon(Icons.work),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    hintText: 'Job location'),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: country,
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                    ),
                    prefixIcon: const Icon(Icons.cast_for_education),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    hintText: 'country'),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: language,
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                    ),
                    prefixIcon: const Icon(Icons.cast_for_education),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    hintText: 'language'),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: price,
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                    ),
                    prefixIcon: const Icon(Icons.cast_for_education_rounded),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    hintText: 'price'),
              ),
              const SizedBox(height: 15),
              Row(
                children: <Widget>[
                  Flexible(
                    child: TextField(
                      controller: budget2,
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(width: 2),
                        ),
                        prefixIcon: const Icon(Icons.perm_identity_sharp),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        hintText: 'Skill',
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Flexible(
                    child: TextField(
                      controller: budget2,
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(width: 2),
                        ),
                        prefixIcon: const Icon(Icons.safety_divider),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        hintText: 'Percentage',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Flexible(
                    child: TextField(
                      controller: budget2,
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(width: 2),
                        ),
                        prefixIcon: const Icon(Icons.perm_identity_sharp),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        hintText: 'Skill',
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Flexible(
                    child: TextField(
                      controller: budget2,
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(width: 2),
                        ),
                        prefixIcon: const Icon(Icons.safety_divider),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        hintText: 'Percentage',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Flexible(
                    child: TextField(
                      controller: budget2,
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(width: 2),
                        ),
                        prefixIcon: const Icon(Icons.perm_identity_sharp),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        hintText: 'Skill',
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Flexible(
                    child: TextField(
                      controller: budget2,
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(width: 2),
                        ),
                        prefixIcon: const Icon(Icons.safety_divider),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        hintText: 'Percentage',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Master()))
                  },
                  child: const Text(
                    'submit',
                    style: TextStyle(
                      color: Color(0xff939393),
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

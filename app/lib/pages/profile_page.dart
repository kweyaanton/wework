import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../users/user.dart';
import '../users/userPage.dart';
import'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  XFile? _image;
  Future createUserAccount(account user) async {
    var FirebaseID = FirebaseAuth.instance.currentUser;

    final data =
        FirebaseFirestore.instance.collection('Users').doc(FirebaseID!.uid);
    final json = user.toCloud();
    await data.update(json);
  }

  TextEditingController FirstNameController = TextEditingController();
  TextEditingController LastNameController = TextEditingController();
  TextEditingController AgeController = TextEditingController();
  TextEditingController GenderController = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Edit Profile'),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => userPage()),
              );
            },
          ),
          actions: [
            IconButton(
                icon: const Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                onPressed: () {}),
          ]),
      body: Container(
        padding: EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                  child: Stack(
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
                        // ignore: prefer_const_constructors
                        image:  DecorationImage(
                      image: const NetworkImage(
                          'https://media.istockphoto.com/photos/old-wall-background-picture-id1296377266?k=20&m=1296377266&s=612x612&w=0&h=0B9aq2sZyKPu9ipBFtWQ7aCW_HRwh5Hy3gwayAgc1b0='),
                      fit: BoxFit.cover,
                        
                        )),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: InkWell(
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 4, color: Colors.white),
                              color: Colors.blue),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          showModalBottomSheet(context: context, builder: (context)=>bottomSheet(context));
                        },
                      )
                  )
                ],
              )),
              const SizedBox(height: 30),
              // ignore: prefer_const_constructors
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
                      controller: FirstNameController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'FirstName',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
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
                      controller: LastNameController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'LastName',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
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
                      controller: AgeController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Age',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
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
                      controller: GenderController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Gender',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
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
                      controller: emailcontroller,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'email',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),

              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => ProfilePage()));
                    },
                    child: const Text('CANCEL',
                        style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 2,
                            color: Colors.black)),
                    style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        var user = account(
                          FirstName: FirstNameController.text,
                          LastName: LastNameController.text,
                          Age: AgeController.text,
                          Gender: GenderController.text,
                          email: emailcontroller.text,
                        );
                        createUserAccount(user);
                      });
                    },
                    child: const Text('SAVE',
                        style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 2,
                            color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  
 Widget bottomSheet(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Container(
    width: double.infinity,
    height: size.height * 0.3,
    margin:EdgeInsets.symmetric(
      vertical: 20,
      horizontal: 10
    ),
    child: Column(
      children: [
        const Text('Choose profile photo',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          InkWell(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:const [ 
                Icon(
                  Icons.image,
                  color: Colors.blue,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Gallery',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue
                ),
                )
              ],
            ),
            onTap: () async{
              final ImagePicker _picker = ImagePicker();
              final img = await _picker.pickImage(source: ImageSource.gallery);
              if(img == null) return;
              setState(() {
                _image = img;
              });
            },
          ),
          const SizedBox(
            width: 80,
          ),
          InkWell(
            child: Column(
              children: const [
                Icon(
                  Icons.camera_alt_sharp,
                  color: Colors.blue,
                ),
                SizedBox(
                  height: 5,
                ),
                 Text(
                  'Camera',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue
                ),
                )
              ],
            ),
            onTap: () async{
              final ImagePicker _picker = ImagePicker();
              final img = await _picker.pickImage(source: ImageSource.camera);
              if(img ==null) return;
              setState(() {
                _image = img;
              });
            },
          )
        ],
        )
      ],
    ),
  );
 }
}

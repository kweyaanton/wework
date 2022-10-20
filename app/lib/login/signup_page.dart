import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_signup/login/common/page_header.dart';
import 'package:login_signup/login/common/page_heading.dart';
import 'package:login_signup/login/login_page.dart';
import 'package:login_signup/users/user.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  File? _profileImage;

  Future sendFile() async {
    final Path = 'files/${_profileImage!.path}';
    final file = File(_profileImage!.path);
    final ref = FirebaseStorage.instance.ref().child(Path);
    await ref.putFile(file);
  }

  final _signupFormKey = GlobalKey<FormState>();

  Future createUserAccount(account user) async {
    var FirebaseID = FirebaseAuth.instance.currentUser;
   
    final data =
        FirebaseFirestore.instance.collection('Users').doc(FirebaseID!.uid);
    final json = user.toCloud();
    await data.set(json);
  }

  Future _pickProfileImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => _profileImage = imageTemporary);
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image error: $e');
    }
  }

  Future Signup({
    required String email,
    required String password,
    required String FirstName,
    required String LastName,
    required String Age,
    required String Gender,
  }) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  @override
  Widget build(BuildContext context) {
    // creat the textfiled
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    TextEditingController FirstNameController = TextEditingController();
    TextEditingController LastNameController = TextEditingController();
    TextEditingController AgeController = TextEditingController();
    TextEditingController GenderController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffEEF1F3),
        body: SingleChildScrollView(
          child: Form(
            key: _signupFormKey,
            child: Column(
              children: [
                const PageHeader(),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      const PageHeading(
                        title: 'Sign-up',
                      ),
                      const SizedBox(
                        width: 130,
                        height: 130,
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
                              decoration: InputDecoration(
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
                                hintText: 'Email',
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
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
                              controller: passwordcontroller,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'password',
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        width: double.infinity,
                        child: RawMaterialButton(
                          fillColor: const Color.fromARGB(255, 83, 111, 99),
                          elevation: 0.0,
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)),
                          onPressed: () async {
                            User? user = await Signup(
                              email: emailcontroller.text,
                              password: passwordcontroller.text,
                              FirstName: FirstNameController.text,
                              LastName: LastNameController.text,
                              Age: AgeController.text,
                              Gender: GenderController.text,
                            );

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

                            print(user);
                            if (user != null) {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()));
                            }
                          },
                          child: const Text("sign up",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Already have an account ? ',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xff939393),
                                  fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              onTap: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginPage()))
                              },
                              child: const Text(
                                'Log-in',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff748288),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

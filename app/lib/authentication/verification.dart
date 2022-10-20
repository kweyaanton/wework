import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_signup/jobs/application/applications.dart';
import 'package:login_signup/jobs/application/transactions.dart';
import 'userData.dart';

class verification extends StatefulWidget {
  const verification({super.key});

  @override
  State<verification> createState() => _verificationState();
}

class _verificationState extends State<verification> {
  PlatformFile? pickedFile;

  Future uploadFile() async {
    final Path = 'files/${pickedFile!.name}';
    final file = File(pickedFile!.path!);
    final ref = FirebaseStorage.instance.ref().child(Path);
    await ref.putFile(file);
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();

    if (result == null) return;
    setState(() {
      pickedFile = result.files.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const application()),
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
            ),
          )
        ],
      ),
      body: Column(
        children: [
          if (pickedFile != null)
            Expanded(
              child: Container(
                color: Colors.blue[100],
                child: Center(
                  child: Text(pickedFile!.name),
                ),
              ),
            ),
          const SizedBox(
            height: 10,
          ),
          const TextField(
            decoration: InputDecoration(
              hintText: 'first name',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const TextField(
            decoration: InputDecoration(
              hintText: 'last name',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          
          

          ElevatedButton(
            
            onPressed: selectFile,
            child: const Text('select file'),
          ),
          ElevatedButton(
            onPressed: uploadFile,
            child: const Text('upload file'),
          ),
        ],
      ),
    );
  }
}

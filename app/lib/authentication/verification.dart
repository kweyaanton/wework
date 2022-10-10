import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/jobs/application/applications.dart';
import 'userData.dart';

class verification extends StatefulWidget {
  const verification({super.key});

  @override
  State<verification> createState() => _verificationState();
}

class _verificationState extends State<verification> {
  @override
  Widget build(BuildContext context) {
    TextEditingController firstname = TextEditingController();
    TextEditingController lastname = TextEditingController();

    final Storage storage = Storage();
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
          TextField(
            controller: firstname,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'first name',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: lastname,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'last name',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                final results = await FilePicker.platform.pickFiles(
                  allowMultiple: false,
                  type: FileType.image,
                );
                if (results == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('no file picked'),
                    ),
                  );
                  return null;
                }
                final path = results.files.single.path!;
                final fileName = results.files.single.name;

                storage.uploadFile(path, fileName).then(
                      (value) => print('done'),
                    );
              },
              child: Text('upload national id'),
            ),
          ),
        ],
      ),
    );
  }
}

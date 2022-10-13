import'package:cloud_firestore/cloud_firestore.dart';
import'package:firebase_core/firebase_core.dart';
import'package:flutter/material.dart';

class UserDetails extends StatefulWidget{
  const UserDetails({super.key});
  @override
 State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails>{
   TextEditingController name =  TextEditingController();
   TextEditingController email =  TextEditingController();
   TextEditingController location = TextEditingController();
   TextEditingController country =  TextEditingController();
   TextEditingController contact = TextEditingController();
   TextEditingController bio =  TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('More of your personal details'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0) ,
        child: Center(
          child: Column(
            children: [
              TextFormField(
                controller: name,
                decoration: InputDecoration(
                labelText: 'Full Name',
                hintText: 'enter your names here',
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: email,
                decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'enter your email address',
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: location,
                decoration: InputDecoration(
                labelText:'Location',
                hintText: 'enter your home address',
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: country,
                decoration: InputDecoration(
                labelText: 'Country',
                hintText: 'enter the name of the country you live in',
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: contact,
                decoration: InputDecoration(
                labelText: 'Contact',
                hintText: 'enter your phone number',
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
               TextFormField(
                controller: bio,
                decoration: InputDecoration(
                labelText: 'Bio',
                hintText: 'A few words about yourself',
                ),
              ),
              SizedBox(
                height:10.0,
              ),
              ElevatedButton(
                child: Text('SUBMIT'),
                onPressed: () {
                  Map<String,String> dataToSave={
                    'name': name.text,
                    'email': email.text,
                    'location': location.text,
                    'country': country.text,
                    'contact': contact.text,
                    'bio': bio.text
                  };

                  FirebaseFirestore.instance.collection('users').add(dataToSave);
                }
              )
            ],
          ),
        ),
      ),
    );
    
  }
}


 
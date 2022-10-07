import 'package:flutter/material.dart';



class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Edit Profile'),
        leading:IconButton(
          icon:Icon(
            Icons.arrow_back,
            color:Colors.white,
          ),
          onPressed:() {},
        ),
        actions:[
          IconButton(
            icon:Icon(
              Icons.settings,
              color:Colors.white,
            ),
            onPressed:() {}
          ),
        ]
      ),
      body:Container(
        padding:EdgeInsets.only(left:15, top:20,right:15),
        child:GestureDetector(
          onTap:() {
            FocusScope.of(context).unfocus();
          },
          child:ListView(
            children:[
              Center(
                child:Stack(
                  children:[
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border:Border.all(width:4,color:Colors.white),
                        boxShadow:[
                          BoxShadow(
                            spreadRadius:2,
                            blurRadius:10,
                            color:Colors.black.withOpacity(0.1)
                          )
                        ] ,
                        shape:BoxShape.circle,
                        image: DecorationImage(
                          fit:BoxFit.cover,
                          image:NetworkImage('assets/images/profile_pic.jpg'),
                        )
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color: Colors.white
                          ),
                          color: Colors.blue
                        ),
                        child: Icon(
                          Icons.edit,
                          color:Colors.white,
                         ),
                      )
                    )
                  ],
                )
              ),
              SizedBox(
                height:30
              ),
             buildTextField('Full Name','Posh Kyla',false),
             buildTextField('Email','poshkyla12@gmail.com',false),
             buildTextField('Location','Kampala,Uganda',false),
             buildTextField('Password','*luv',true),
             buildTextField('Bio','The storm too shall pass',false),
              SizedBox(height:30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    child: Text('CANCEL', style: TextStyle(
                      fontSize:15,
                      letterSpacing: 2,
                      color: Colors.black
                    )),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {}, 
                    child: Text('SAVE', style: TextStyle(
                      fontSize:15,
                      letterSpacing: 2,
                      color: Colors.white 
                    )),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:Colors.blue,
                      padding:EdgeInsets.symmetric(horizontal: 50),
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                    ),
                    )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

Widget buildTextField(String LabelText, String placeholder, bool isPasswordTextField) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 35.0),
    child: TextField(
decoration: InputDecoration(
                  suffixIcon: isPasswordTextField ?
                  IconButton(
                    onPressed: () {
                      setState(() => showPassword = !showPassword); 
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                    color: Colors.grey,
                    )
                  ):null,
                  contentPadding: EdgeInsets.only(bottom: 3),
                  labelText:LabelText,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: placeholder,
                  hintStyle:TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
          ),
        )
      )
    );
  }
}
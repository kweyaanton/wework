import'package:flutter/material.dart';
import'package:flutterwave/flutterwave.dart';

class Pay extends StatefulWidget{
  const Pay({super.key});

  @override
  State<Pay> createState() => _PayState();
}

class _PayState extends State<Pay>{
  TextEditingController _phone = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _amount = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Details'),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10,),
                  child: TextFormField(
                    controller: _phone,
                    decoration: InputDecoration(
                      labelText: 'Phone number'
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10,),
                  child: TextFormField(
                    controller: _email,
                    decoration: InputDecoration(
                      labelText: 'Email'
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10,),
                  child: TextFormField(
                    controller: _amount,
                    decoration: InputDecoration(
                      labelText: 'Amount to pay'
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: GestureDetector(
              onTap: () {
                final phone = _phone.text;
                final email = _email.text;
                final amount = _amount.text;

                if(phone.isEmpty || email.isEmpty || amount.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('some of the fields are empty')));
                }else{
                   _MakePayment(context);    
                }
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                color: Colors.lightBlue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.payment),
                    Text('Make payment',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      )
            
                    )
                  ],
                )
              ),
            ) ,
          )
        ],
      ),
    );
  }
  
  void _MakePayment(BuildContext context) {
    
  }
}
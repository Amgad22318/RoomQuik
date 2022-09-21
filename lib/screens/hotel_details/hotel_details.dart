import 'package:flutter/material.dart';

class HotelDetails extends StatelessWidget {
  const HotelDetails({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios)),
          elevation: 5,
      title: Text('Name Hotel',),
      centerTitle: true,),
      body: Column(
        children: [


        ],
      ),
    );
  }
}

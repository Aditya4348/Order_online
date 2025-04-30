import 'package:flutter/material.dart';


class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Center(
          child: Text('Setting', 
          style: TextStyle(color: Colors.black),),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text('Ini Page Setting' , 
        style:TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

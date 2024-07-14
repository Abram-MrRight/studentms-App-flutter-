// lib/views/home_view.dart
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:studentms_app/pages/studentsList/students_screen.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Card(
            elevation: 14,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            child: const ListTile(
              title: Text("Expected Aount"),
              subtitle: Text('500,000'),
            ),
          ),// Add more widgets as needed
          SizedBox(height: 10,),
           Card(
            elevation: 14,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            ),
            child:const ListTile(
              title: Text("Total Collected"),
              subtitle: Text('30,000'),
            ) ,
          ),
          SizedBox(height: 10,),
          Card(
            elevation: 14,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            ),
            child:ListTile(
              title: Text("Outstanding Balances"),
              subtitle: Text('20,000'),
            ) ,
          ),
          SizedBox(height: 10,),
          Card(
            elevation: 14,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            ),
            child:const ListTile(
              title: Text("Percentage Collected"),
              subtitle: Text('60%'),
            ) ,
          ),
          const SizedBox(height: 30,),
          ElevatedButton(
            onPressed: (){
              Get.to(()=> StudentsScreen());
            },
            child: Text('Students'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              textStyle: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

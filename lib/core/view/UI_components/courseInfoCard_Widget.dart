
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class courseInfoCardWidget extends StatelessWidget {
  String title  ; 
  String image ; 
  Color color ; 
   courseInfoCardWidget({
    super.key,
    required this.title , 
    required this.image , 
    required this.color  ,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Container(
     decoration: BoxDecoration(
        
      borderRadius: BorderRadius.circular(10) , 
      image: DecorationImage(
        scale: 0.8  ,
        image: AssetImage("Assets/images/courseInfo/${image}" ) )
      
      ),
      height: 40 ,
      width: 40 ,
    
    )  ,
    SizedBox(width: 10 ) , 
    Text("$title" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18  ,color :color  ),) , 
      ],
    );
  }
}
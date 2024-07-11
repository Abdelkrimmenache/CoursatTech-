

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class categoryCardWidget extends StatelessWidget {

  String? title ; 
  String? image ; 

  categoryCardWidget({
    super.key,
    required this.title  , 
    required this.image  , 
    

  });

  @override
  Widget build(BuildContext context) {
    return Container(
     padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 70 ,
     decoration: BoxDecoration(
       border: Border.all(color: Get.theme.primaryColor), 
        color: const Color.fromARGB(255, 237, 237, 237), 
       borderRadius: BorderRadius.circular(10) , 
     ),
      child: 
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            
             decoration: BoxDecoration(
             color: Get.theme.primaryColor , 
             borderRadius: BorderRadius.circular(10) , 
             image: DecorationImage(image: NetworkImage("$image") , 
             scale: 1.8
             )
             
             ),
            width: 50 ,
           
          )  ,
          Text( title! , style: TextStyle(fontFamily: "noor" , color: Colors.black , fontSize: 15, fontWeight: FontWeight.bold ) ), 
          Icon(Icons.arrow_right) , 
        ],
      ),
    );
  }
}

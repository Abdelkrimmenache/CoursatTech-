


import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class customProfileCard extends StatelessWidget {

  final  String title ; 
  final  Icon icon ; 
  void Function()? onTap ; 
  
   customProfileCard({
    super.key, required this.title,required this.icon, required this.onTap 
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:  onTap ,
      child: Container(
        
        padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 20 ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5), // Shadow color
              spreadRadius: 5, // Spread radius
              blurRadius: 7, // Blur radius
              offset: Offset(0, 3), // Offset in the x and y direction
      
            )
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(10) , 
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
            icon , 
            SizedBox(width: 15,) , 
            Text("$title" , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w900 ),) , 
              ],
            ) , 
            
            Icon(FontAwesomeIcons.arrowRight ) , 
          ],
        ),
      ),
    );
  }
}


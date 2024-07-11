


import 'package:corsatech_app/core/model/course_Model.dart';
import 'package:corsatech_app/core/model/instructor_Model.dart';
import 'package:corsatech_app/core/view/pages/details_View.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class courseCardWidget extends StatelessWidget {
  String? image ; 
  String? title ; 
  String? instructorName ;
  String? instructorImage; 

  CourseModel? coursemodel ;
  InstructorModel? instructorModel ;
  

   courseCardWidget({
    super.key,
    this.image ,
    this.title ,
    this.instructorName ,
    this.instructorImage ,
    required this.coursemodel ,  
    required this.instructorModel , 
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Get.to(() => detailsView(coursemodel: coursemodel! , instructorModel: instructorModel!,)) ; 
          },
          child: Container(
           
            height: 120 ,
            decoration: BoxDecoration(
              border: Border.all(color: Get.theme.primaryColor),
               color: const Color.fromARGB(255, 0, 0, 0) ,
               borderRadius: BorderRadius.circular(20 ) , 
               image: DecorationImage(image: NetworkImage("$image" ) , 
               
               
              
               )
              
            ),
                
            
          ),
        ) ,
        SizedBox(height: 10 ,) ,  
        Text("$title" , style: TextStyle(fontSize: 15 , fontWeight:FontWeight.bold) ,), 
        Spacer(flex: 3,) , 
        Row(
          children: [
            Container(
              height: 25 ,
              width: 25,
             
              decoration: BoxDecoration(
                 color: const Color.fromARGB(255, 0, 0, 0) ,
                image: DecorationImage(image: NetworkImage("$instructorImage")),
                borderRadius: BorderRadius.circular(100) , 
              ),
            ) , 
            SizedBox(width: 5 ,) , 
            Text("$instructorName"),
          ],
        ) , 
      ],
      
    );
  }
}
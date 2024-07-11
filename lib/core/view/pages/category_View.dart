// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:corsatech_app/core/model/course_Model.dart';
import 'package:corsatech_app/core/model/instructor_Model.dart';
import 'package:corsatech_app/core/view/pages/details_View.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:corsatech_app/core/viewModel/home_ViewMedel.dart';

class categoryView extends StatelessWidget {




  String category ; 
  categoryView({
    Key? key,
    required this.category,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    
    return GetBuilder<homeViewModel>(
      init: Get.find<homeViewModel>() ,
      builder: (controller) =>


        (controller.isLoading == true) ? 
         Center(child: CircularProgressIndicator(),)
        :
          Scaffold(
          
          appBar: AppBar(
           title: Text("$category"),
          ) , 
          body: 
           ListView.builder(
            
        shrinkWrap: true ,
        scrollDirection: Axis.vertical,
        itemCount: controller.courseModel.where((course) => course.catergory == category ).length ,
        itemBuilder: (context , i) {
            List<CourseModel> categoryCourse = controller.courseModel.where((course) => course.catergory == category ).toList() ; 
            List<InstructorModel> InstructorCourse = controller.instructorModel.where((instructor) => instructor.instructorId == categoryCourse[i].instructorId ).toList() ; 
            
        return 
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15  ), 
        
        
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end ,
                    children: [
                      Column(
                      crossAxisAlignment: CrossAxisAlignment.end,  
                      children: [
                      Text("${categoryCourse[i].title}" ) , 
                      SizedBox(width: 5 ,) , 
                      Text("${InstructorCourse[i].name}") , 
                      
                       
                      ],
                      ) , 
                      SizedBox(width: 20 ,) , 
                      
                      GestureDetector(
              onTap: () {
                Get.to(() => detailsView(coursemodel: categoryCourse[i] , instructorModel: InstructorCourse[i],)) ; 
              },
              child: Container(
               height: 100 ,
                width: 100 ,
                decoration: BoxDecoration(
                  border: Border.all(color: Get.theme.primaryColor),
                   color: const Color.fromARGB(255, 0, 0, 0) ,
                   borderRadius: BorderRadius.circular(20 ) , 
                   image: DecorationImage(image: NetworkImage("${controller.courseModel[i].picOfCourse}" ) , 
                   
                   
                  
                   )
                  
                ),
                    
                
              ),
                      ) ,
                   
                    ],
                    
                  ),
                  SizedBox(height: 10 ,) , 
                  Divider( ) , 
            ],
          )
        ) ;
        
        }),
        ) 
      
    ); 
  }
}


import 'package:corsatech_app/core/model/course_Model.dart';
import 'package:corsatech_app/core/model/instructor_Model.dart';
import 'package:corsatech_app/core/view/pages/details_View.dart';

import 'package:corsatech_app/core/viewModel/favorate_ViewModel.dart';
import 'package:corsatech_app/core/viewModel/home_ViewMedel.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class  FavoriteView  extends StatelessWidget {

  CourseModel? coursemodel         ;
  InstructorModel? instructorModel ;
    FavoriteView ({super.key})     ;

  @override
  Widget build(BuildContext context) {
   
    return GetBuilder<favorateViewModel>(
      init: favorateViewModel() , 
      builder: (controller) =>
       Scaffold(
        appBar: AppBar(
          title: Text(" المفضلة",style: TextStyle(fontFamily: "noor" , color: Colors.black , fontSize: 18 , fontWeight: FontWeight.bold ),) , 
        ),
        body: 
       ListView.builder(
        shrinkWrap: true ,
        scrollDirection: Axis.vertical,
        itemCount: controller.favoriteCourseModel.length ,
        itemBuilder: (context , i) {
        return 
        Container(
        
          margin: EdgeInsets.symmetric(horizontal: 15  ), 
        
        
          child: Column(

            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: Get.mediaQuery.size.width*0.60,
                    child: Row(
                      
                      mainAxisAlignment: MainAxisAlignment.end ,
                          children: [
                            Column(
                            crossAxisAlignment: CrossAxisAlignment.end,  
                            children: [
                            Container(
                              
                              width: 200 ,
                              child: Text("${controller.favoriteCourseModel[i].name}",
                              style: TextStyle(fontWeight: FontWeight.w900 ),
                              )), 
                            SizedBox(height: 10,) , 
                            Text("${controller.favoriteCourseModel[i].instructor}") , 
                            // Text("${(controller.instructorModel[i].instructorId == controller.courseModel[i].instructorId) ?
                            //       controller.instructorModel[i].name: "not defined"}") , 
                            SizedBox(height: 5 ,) , 
                            Text("${controller.favoriteCourseModel[i].category}") , 
                            ],
                            ) , 
                            SizedBox(width: 10,) , 
                            
                           
                          ],
                          
                        ),
                  ),

                       GetBuilder<homeViewModel>(
                        init: Get.find<homeViewModel>() ,
                        builder: (contoller) {
                      
                          return GestureDetector(
                          
                                            
                          onTap: () {
                            
                            
                         
                          },
                          child: Container(
                            width: Get.mediaQuery.size.width * 0.30,
                            height: 100 ,
                          
                            decoration: BoxDecoration(
                              border: Border.all(color: Get.theme.primaryColor),
                              color: const Color.fromARGB(255, 0, 0, 0) ,
                              borderRadius: BorderRadius.circular(20 ) , 
                              image: DecorationImage(image: 
                              NetworkImage("${controller.favoriteCourseModel[i].picOfCourse}" , 
                                
                                ) , 
                              
                              
                              
                              )
                              
                            ),
                                
                            
                          ),
                          );
                        }
                      ) ,
                ],
              ),
                  SizedBox(height: 10 ,) , 
                  Divider( ) , 
            ],
          )
        ) ;
        
        }),
        
      ),
    );
  }
}
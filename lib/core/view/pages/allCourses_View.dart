
import 'package:corsatech_app/core/model/course_Model.dart';
import 'package:corsatech_app/core/model/instructor_Model.dart';
import 'package:corsatech_app/core/view/UI_components/courseCard_Widget.dart';
import 'package:corsatech_app/core/view/pages/details_View.dart';
import 'package:corsatech_app/core/viewModel/home_ViewMedel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class allCourses extends StatelessWidget {

  CourseModel? coursemodel         ;
  InstructorModel? instructorModel ;
   allCourses({super.key})         ;

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<homeViewModel>() ;  
    return GetBuilder<homeViewModel>(
      builder: (controller) =>
       Scaffold(
        appBar: AppBar(
          title: Text("جميع الكورسات",style: TextStyle(fontFamily: "noor" , color: Colors.black , fontSize: 18 , fontWeight: FontWeight.bold ),) , 
        ),
        body: 
       ListView.builder(
        shrinkWrap: true ,
        scrollDirection: Axis.vertical,
        itemCount: controller.courseModel.length ,
        itemBuilder: (context , i) {
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
                      Text("${controller.courseModel[i].title}"  ,), 
                      SizedBox(width: 5 ,) , 
                      Text("${(controller.instructorModel[i].instructorId == controller.courseModel[i].instructorId) ?
                            controller.instructorModel[i].name: "not defined"}") , 
                      SizedBox(width: 5 ,) , 
                      Text("${controller.courseModel[i].catergory}") , 
              ],
                      ) , 
                      SizedBox(width: 20,) , 
                      
                      GestureDetector(
              onTap: () {
                Get.to(() => detailsView(coursemodel: controller.courseModel[i] , instructorModel: controller.instructorModel[i],)) ; 
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
        
      ),
    );
  }
}
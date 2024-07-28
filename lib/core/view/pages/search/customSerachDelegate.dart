

import 'package:corsatech_app/core/model/course_Model.dart';
import 'package:corsatech_app/core/view/pages/details_View.dart';
import 'package:corsatech_app/core/viewModel/home_ViewMedel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSerach extends SearchDelegate {



  @override
  List<Widget>? buildActions(BuildContext context) {
  return [
    IconButton(onPressed: () {}, icon: Icon(Icons.close))
    ]  ; 
  }

  @override
  Widget? buildLeading(BuildContext context) {
     
    return IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)) ; 
    

  }

  @override
  Widget buildResults(BuildContext context) {
    return Text(""); 
  }

  @override
  Widget buildSuggestions(BuildContext context) {
   return GetBuilder<homeViewModel>(
    init: Get.find<homeViewModel>(),
     builder: (controller) {
      List<CourseModel>  filterCourseModel = controller.courseModel.where((course) => course.title!.toLowerCase().contains(query)).toList() ;   
       return ListView.builder(
            shrinkWrap: true ,
            scrollDirection: Axis.vertical,
            itemCount: (query == "") ? controller.courseModel.length : 
            filterCourseModel.length ,
            itemBuilder: (context , i) {
            return 
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15  ), 
            
            
              child: 
    
              Column(
                children: [
                   (query == "") ? 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end ,
                        children: [
                         
                          Column(
                          crossAxisAlignment: CrossAxisAlignment.end,  
                          children: [
                          Container(
                            
                            width: 250 ,
                            child: Text("${controller.courseModel[i].title}",
                            style: TextStyle(fontWeight: FontWeight.w900 ),
                            )), 
                          SizedBox(height: 10,) , 
                          Text("${(controller.instructorModel[i].instructorId == controller.courseModel[i].instructorId) ?
                                controller.instructorModel[i].name: "not defined"}") , 
                          SizedBox(height: 5 ,) , 
                          Text("${controller.courseModel[i].catergory}") , 
                          ],
                          ) , 
                          ///////////
                          //    Column(
                          // crossAxisAlignment: CrossAxisAlignment.end,  
                          // children: [
                          // Container(
                            
                          //   width: 250 ,
                          //   child: Text("${filterCourseModel[i].title}",
                          //   style: TextStyle(fontWeight: FontWeight.w900 ),
                          //   )), 
                          // SizedBox(height: 10,) , 
                          // Text("${(controller.instructorModel[i].instructorId == filterCourseModel[i].instructorId) ?
                          //       controller.instructorModel[i].name: "not defined"}") , 
                          // SizedBox(height: 5 ,) , 
                          // Text("${filterCourseModel[i].catergory}") , 
                          // ],
                          // ) , 

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
                       image: DecorationImage(image: 
                       NetworkImage("${filterCourseModel[i].picOfCourse}" , 
                        
                        ) , 
                       
                       
                      
                       )
                      
                    ),
                        
                    
                  ),
                          ) ,
                      
                          
                         
                        ],
                        
                      ) : 
                       Row(
                    mainAxisAlignment: MainAxisAlignment.end ,
                        children: [
                         
                        
                          ///////////
                             Column(
                          crossAxisAlignment: CrossAxisAlignment.end,  
                          children: [
                          Container(
                            
                            width: 250 ,
                            child: Text("${filterCourseModel[i].title}",
                            style: TextStyle(fontWeight: FontWeight.w900 ),
                            )), 
                          SizedBox(height: 10,) , 
                          Text("${(controller.instructorModel[i].instructorId == filterCourseModel[i].instructorId) ?
                                controller.instructorModel[i].name: "not defined"}") , 
                          SizedBox(height: 5 ,) , 
                          Text("${filterCourseModel[i].catergory}") , 
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
                       image: DecorationImage(image: 
                       NetworkImage("${filterCourseModel[i].picOfCourse}" , 
                        
                        ) , 
                       
                       
                      
                       )
                      
                    ),
                        
                    
                  ),
                          ) ,
                      
                          
                         
                        ],
                        
                      ) , 






                      SizedBox(height: 10 ,) , 
                      Divider( ) , 
                ],
              ) 
            ) ;
            
            });
     }
   );
  }

}
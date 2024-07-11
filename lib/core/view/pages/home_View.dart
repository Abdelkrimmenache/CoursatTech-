

import 'package:corsatech_app/core/model/course_Model.dart';
import 'package:corsatech_app/core/view/UI_components/categoryCard_Widget.dart';
import 'package:corsatech_app/core/view/UI_components/courseCard_Widget.dart';
import 'package:corsatech_app/core/view/UI_components/searchBar.dart';
import 'package:corsatech_app/core/view/pages/allCourses_View.dart';
import 'package:corsatech_app/core/view/pages/category_View.dart';
import 'package:corsatech_app/core/view/pages/personal_Screen.dart';
import 'package:corsatech_app/core/viewModel/home_ViewMedel.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';


class HomeView extends StatelessWidget {
   HomeView({super.key});

  TextEditingController searchController  =TextEditingController() ; 
  

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<homeViewModel>() ;  
    return GetBuilder<homeViewModel>(
      init: controller,
      builder: (controller) => 
       (controller.isLoading == true ) ? 
       Center(child: CircularProgressIndicator(
        color: Get.theme.primaryColor ,
       ),)
       :
       Scaffold(
      //   appBar: AppBar(
        
      //   backgroundColor: Colors.white,
          
      //   title: Center(child: Text("corsatech" , style: TextStyle(color: Colors.white),) ) , 
      //   leading: IconButton(onPressed: () {
        
      //   },
      //    icon: Icon(Icons.search)),
      // ),
       
        body:
        Padding(
              
          padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 20 ) , 
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30 ,) , 
                searchBar(controller: searchController ) , 
                  SizedBox(height: 30 ,) , 
                Container(
                  
                  child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("اشهر الكورسات" ,style: TextStyle(fontFamily: "noor" , color: Colors.black , fontSize: 18 , fontWeight: FontWeight.bold ),),
                      GestureDetector(
                        onTap: () {
                          Get.to( ()=> allCourses() ) ; 
                        },
                        child: Row(
                          children: [
                            Text("المزيد" , style: TextStyle(fontFamily: "noor" , color: Colors.black , fontSize: 15, fontWeight: FontWeight.bold )),
                            Icon(Icons.arrow_forward_ios) , 
                          ],
                        ),
                      ),
                      
                    ],
                  ),
                )  ,
                SizedBox(height: 20 ) , 
            
                Container(
                  
                  height: 220 ,
                  
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.courseModel.length ,
                    itemBuilder: (context , i) {
                    return 
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15  ), 
                    
                      width: Get.mediaQuery.size.width*0.50 ,
                      child: courseCardWidget(
                        coursemodel: controller.courseModel[i],
                        instructorModel: controller.instructorModel[i],
                        title: controller.courseModel[i].title, 
                        image: controller.courseModel[i].picOfCourse,
                        instructorImage: controller.instructorModel[i].picOfInscturctor,
                        instructorName: (controller.instructorModel[i].instructorId == controller.courseModel[i].instructorId) ?
                        controller.instructorModel[i].name: "not defined"
                      )  ,
                    ) ;
                    
                    }),
                ) , 
              SizedBox(height: 30,) , 
              Container(
                alignment: Alignment.bottomRight,
                child: Text(" جميع الاقسام",style: TextStyle(fontFamily: "noor" , color: Colors.black , fontSize: 18 , fontWeight: FontWeight.bold ),)),
                SizedBox(height: 30,) , 
                 ListView.builder(
                  shrinkWrap: true,
                   physics: NeverScrollableScrollPhysics(), 
                   itemCount: controller.categoryModel.length ,
                   itemBuilder: (context , i) { 
                     return 
                     GestureDetector(
                      onTap: () {
                        Get.to(() => categoryView(category: controller.courseModel[i].catergory!,)) ; 
                      },
                       child: categoryCardWidget(
                        title: controller.categoryModel[i].title,
                        image: controller.categoryModel[i].image , 
                       
                       ),
                     ) ; 
                 
                   })
              ],
            ),
          ),
        )
         
      
      ),
    ) ; 
  }
}



//  Expanded(
          
//               child: ListView.builder(
//                 itemCount: 6 ,
//                 itemBuilder: (context , i) { 
//                   return 
//                   Container(
//                     margin: EdgeInsets.symmetric(vertical: 10),
//                     height: 70 ,
//                     color: Colors.grey,
//                     child: 
//                     Row(
//                       children: [
//                         Container(
//                           width: 30 ,
//                           color: Colors.red,
//                         )  ,
//                         Text("الرسم و التصميم"), 
//                         Icon(Icons.arrow_right) , 
//                       ],
//                     ),
//                   ) ; 
              
              
//                 }),
//             )
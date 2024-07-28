import 'package:corsatech_app/core/view/controller_View.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class welcomView extends StatelessWidget {
  const welcomView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.primaryColor, 
      body: 

      Container(
        padding: EdgeInsets.symmetric(horizontal: 20 ),
        child: SingleChildScrollView(
          child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: Get.mediaQuery.size.height * 0.50 ,
                decoration: BoxDecoration(
                
          
                ),
                child: 
                SvgPicture.asset("Assets/images/learning.svg"),
                
                 
              ) , 
              Text("let's learn with our exiting courses !" , style: TextStyle(color:  Colors.white ,
              fontWeight: FontWeight.w600  , 
              fontSize: 50 , 
              height: 1.1 , 
              ),) , 
              SizedBox(height: 10 ,) , 
              Text("Discover top courses from popular platforms, making choice easy." , 
              style: TextStyle(color: Colors.grey  , fontSize: 20  , 
              fontWeight: FontWeight.w600
              ),
              ) , 
        
             
              SizedBox(height: 40,) , 
              Container(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () {
                    Get.offAll(() => ControllerView()) ; 
                  },
                  child: Container(

                    padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 15 ),
                   decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20) , 
                    color: Colors.white  
                   ),
                  
                    child: 
                       Container(
                      width: 145,
                         child: Row(
                           children: [
                             Text("start now" , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold ),),
                             SizedBox(width: 20 ,) , 
                             Container(
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(100) , 
                                  color: Get.theme.primaryColor,
                               ),
                               height: 40 ,
                               width: 40  ,
                              
                               child: 
                               Icon(Icons.arrow_forward_ios , color: Colors.white,),
                             )
                           ],
                         ),
                       ),
                  ),
                ),
              )
            ],
          ),
        ),
      )
      ,
    );
  }
}
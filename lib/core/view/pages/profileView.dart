


import 'package:corsatech_app/core/view/UI_components/courseInfoCard_Widget.dart';
import 'package:corsatech_app/core/viewModel/profile_ViewModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class profileView extends StatelessWidget {
  const profileView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    
   return GetBuilder(
     init: Get.find<profileViewModel>(),
     builder: (controller) {
      
       return Scaffold(
        backgroundColor: Get.theme.primaryColor ,
        appBar: 
        AppBar(
           backgroundColor: Get.theme.primaryColor , 
          title: Center(child: Text("profile"  , style: TextStyle(fontSize: 20 , color: Colors.white),) ) ,
        ),
       
        body: 
        SingleChildScrollView(
          child: 
          Column(
            
            children : [
              Container(
                alignment: Alignment.center,
                child: Column(
            
                  children: [
                    Container(
                      height: 130, 
                      width: 130,
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(100) , 
                        color: Colors.white ,
                        image: DecorationImage(image: AssetImage(""))
                      ),
                    ),
                    SizedBox(height: 15,) , 
                    Text("${controller.userModel.email!}" , style: TextStyle(color: Colors.white , fontSize: 25 ), ) , 
                    SizedBox(height: 70,) ,
       
                    Container(
                      color: Colors.white ,
                      child: Row(
                        
                        children: [
                      Container(
                                    decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10) , 
                                    image: DecorationImage(
                                    scale: 0.8  ,
                                    image: AssetImage("Assets/images/courseInfo/time.pnge" ) )
                                    
                                    ),
                                    height: 40 ,
                                    width: 40 ,
                                  
                                  )  ,
                                  SizedBox(width: 10 ) , 
                                  Text("profile" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18  ,color :Colors.black  ),) , 
                                    ],
                                  ),
                    ) , 
       
                    
                   MaterialButton(
                    color: Colors.white ,
                    onPressed: () {
                      controller.signOut() ; 
                    } , 

                   
                   )
       
                  ],
                ),
              )
       
       
            ]
          ),
        ),
       );
     }
   ) ; 
  }
}


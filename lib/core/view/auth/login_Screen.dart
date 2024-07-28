
import 'package:corsatech_app/core/view/UI_components/CustomTextFormFeild_Widget.dart';
import 'package:corsatech_app/core/view/UI_components/myCostomMaterialButtonWidget.dart';
import 'package:corsatech_app/core/view/auth/signin_Screen.dart';
import 'package:corsatech_app/core/viewModel/auth_ViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class loginScreen extends StatelessWidget {

  TextEditingController email = TextEditingController() ; 
  TextEditingController password = TextEditingController() ; 
  GlobalKey<FormState> _formstate = GlobalKey<FormState>() ; 
   loginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white ,
        shadowColor: Colors.transparent ,
        
      ),
      body: 
          GetBuilder<AuthViewModel>(
          init: AuthViewModel(), 
          builder: (controller) => 
          Form(
          key: _formstate,
           child: SingleChildScrollView(
             child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30 ,vertical: 30 ),
              // alignment: Alignment.centerRight,
              child: Column(
               
                mainAxisAlignment: MainAxisAlignment.center ,
                crossAxisAlignment: CrossAxisAlignment.end  ,
                children: [
                  Container(
                    height: 100,
                    child: SvgPicture.asset("Assets/images/login.svg")) , 
                    SizedBox(height: 30 ,) , 
                    Container(
                    alignment: Alignment.center,
                    child:
                     Text("تسجيل الدخول" , style: TextStyle(fontFamily: "noor" , fontSize: 30 , fontWeight: FontWeight.bold),)),  
                     SizedBox(height: 30 ,) ,  
                    Text("البريد الالكتروني" , style: TextStyle(fontSize: 15 , fontFamily: "noor" , fontWeight: FontWeight.w500))  ,
                    SizedBox(height: 10 ,) , 
                   
                       customTextFormFeildWidget(title: "البريد الالكتروني", icon: Icons.email_outlined,
                         mycontroller: email ,
                          onChanged: (Value) {
                            controller.email = Value ; 
                          },
                           validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'ادخل البريد الالكتروني';
                              }
                              // Regular expression for validating an email
                              String pattern =
                                  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                              RegExp regex = RegExp(pattern);
                              if (!regex.hasMatch(value)) {
                                return 'ادخل بريد الكتروني صالح';
                              }
                              return null;
                            },
                        )  ,
                    SizedBox(height: 20 ,) , 
                    Text("كلمة السر", style: TextStyle(fontSize: 15 , fontFamily: "noor" , fontWeight: FontWeight.w500))  ,
                    SizedBox(height: 10 ,) , 
                     customTextFormFeildWidget(title: "كلمة السر" ,   icon: Icons.lock_outlined,
                         mycontroller: password ,
                          onChanged: (Value) {
                            controller.password = Value ; 
                          },
                           validator: (val) {
                           if (val!.isEmpty  ) {
                            return "ادخل كلمة المرور"  ; 
                           } 
                         },
                        
                        ) ,
                    SizedBox(height: 10 ,) , 
                    TextButton(

                      onPressed: () {
                        controller.sendPasswordResetEmail() ; 
                       } ,
                      child: 
                      Text("نسيت كلمة السر؟" ,style : TextStyle(fontSize: 15 , fontFamily: "noor" , fontWeight: FontWeight.w300) ,),
                      
                      
                      
                      ) , 
                    SizedBox(height: 20 ,) , 

                    controller.isLoading ? 

                     MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      minWidth: double.infinity ,
                      padding: EdgeInsets.symmetric(vertical: 10 ),
                      color: Get.theme.primaryColor,
                      onPressed: (){}, 
                    child: CircularProgressIndicator(color: Colors.white,) 
                    )
                    :
                    cutomMaterialButtonWidget(title: "تسجيل الدخول", onPressed: () {
                      _formstate.currentState!.save() ; 
                    if(_formstate.currentState!.validate() ) {
                      controller.signInWithEmailAndPassword(); 
                    }
                    }) , 

                    SizedBox(height: 30 ,) , 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                        onPressed: () {
                          Get.to(() => signinScreen()) ; 
                        },  
                        child: Text("انشاء حساب" , style : TextStyle(fontSize: 20 , fontFamily: "noor" , fontWeight: FontWeight.bold ,color: Get.theme.primaryColor, ) ,) ,) ,
                        Text("لا تملك حساب؟" , style:  TextStyle(fontSize: 20 , fontFamily: "noor" , fontWeight: FontWeight.w300) ,)  
                      ],
                    )
                    
                ],
              ),
                   ),
           ),
         ),
       ) ,
    );
  }
}

















// import 'package:device_preview/device_preview.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:get/get.dart';

// class loginScreen extends StatelessWidget {
//    loginScreen({super.key});
//    MediaQueryData mediaQueryData = Get.mediaQuery  ; 
//   double screenHeight = Get.mediaQuery.size.height ;
//   double screenWidth = Get.mediaQuery.size.width ; 

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         height: screenHeight, 
//         width: screenWidth,
//         color: Colors.black, 
//         child: 
//         Center(
//           child: LayoutBuilder(
//             builder: (context, constraints) {
//               var deviceType = selectDeviceType(mediaQueryData) ; 
//               print("$deviceType") ; 
//              double localheight = constraints.maxHeight ; 
//              double localwidth = constraints.maxWidth ; 
//              print("###########################$screenHeight") ;
//              print("###########################$screenWidth") ;
//              print("###########################$localheight") ;
//              print("###########################$localwidth") ;
//              return
//              Container(
//               color: Colors.orange ,
//               height: localheight /2 ,
//               width: localwidth /2 ,  
//             ); 
//             } 
            
             
//           ),
//         ),
//        );

    
//   }

//  DeviceType selectDeviceType(MediaQueryData mediaQueryData ) {
//     Orientation orientation = mediaQueryData.orientation ; 
//     double width =  0 ;
//     if (orientation == Orientation.landscape) {
//       width = mediaQueryData.size.height ; 
//     } else {
//        width = mediaQueryData.size.width ;  
//     }

//     if(width >= 950 ) {
//       return DeviceType.desktop ; 
//     } 
//     if(width >= 600 ) {
//       return DeviceType.tablet  ; 
//     } 
//     return DeviceType.phone     ;
//  }
   
// }
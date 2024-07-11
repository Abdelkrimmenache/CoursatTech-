

import 'package:corsatech_app/core/model/course_Model.dart';
import 'package:corsatech_app/core/model/instructor_Model.dart';
import 'package:corsatech_app/core/view/UI_components/categoryCard_Widget.dart';
import 'package:corsatech_app/core/view/UI_components/courseInfoCard_Widget.dart';
import 'package:corsatech_app/core/viewModel/home_ViewMedel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class detailsView extends StatelessWidget {
  final CourseModel coursemodel ; 
  final InstructorModel instructorModel  ; 
  // final    InstructorModel instructorModel ; 
  const detailsView({super.key, required this.coursemodel, required this.instructorModel ,
  //  required this.instructorModel
   
   });

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<homeViewModel>() ;    
    return GetBuilder<homeViewModel>(
      builder: (controller)=> 
       Scaffold(
        appBar: AppBar(
           
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 20 ) , 
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                 alignment: Alignment.bottomRight,
                 children : [
                    Container(
                    height: 220  ,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10) , 
                      image: DecorationImage(image: NetworkImage("${coursemodel.picOfCourse}")) 
                    ),
                  ),
                  Positioned(
                    bottom: -15 ,
                    right: 15 ,
                    child: Container(
                      
                      height: 50 ,
                      width: 50 ,
                      decoration: BoxDecoration(
                        color: Get.theme.primaryColor , 
                        borderRadius: BorderRadius.circular(100) , 
                      ),
                      child: 
                      
                      IconButton(onPressed: (){
                    
                      }, 
                      icon: Icon(Icons.favorite_outline ,color: Colors.white,) 
                      
                      ),
                    ),
                  )
                  ]

                  
                   
                ) ,
                SizedBox(height: 20,) ,  
                Container(
                  alignment: Alignment.topLeft,
                  child: Text("${coursemodel.title}" , style: TextStyle(
                    fontWeight: FontWeight.bold , 
                    fontSize: 20
                    ) , 
                  
                  ),
                ) , 
                SizedBox(height: 20 ,) , 
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 20 ) ,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)
                      ) ,
                      color: Get.theme.primaryColor,
                      onPressed: () {

                      }  , 
                      child: 
                       Text("ابدا الان" ,style: TextStyle(fontFamily: "noor" , color: Colors.white , fontSize: 18 , fontWeight: FontWeight.bold )) 
                    ) , 
                   Row(
                    children: [
                      Text("${instructorModel.name}"),
                      SizedBox(width: 5 ,) , 
                      Container(
                        height: 25 ,
                        width: 25,
                      
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 0, 0, 0) ,
                          image: DecorationImage(image: NetworkImage("${instructorModel.picOfInscturctor}")),
                          borderRadius: BorderRadius.circular(100) , 
                        ),
                      ) , 
                      SizedBox(width: 5 ,) , 
                    ],
                  )
                  ],
                ) , 

                SizedBox(height: 40 ,) , 
                // paltform  - duration - rating - free of payment
                Column(
                  
                  children: [
                   
                    Container(
                    padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 6 ) ,
                    color: Color.fromARGB(255, 236, 236, 236) ,
                    child: courseInfoCardWidget(title: "${coursemodel.paltrorm}" , image: "platform.png" , 
                    color: Colors.black,
                    
                    )),
                    SizedBox(height: 10,) ,
                    Container(
                    padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 6 ) ,
                    color: Color.fromARGB(255, 236, 236, 236) ,    
                    child: courseInfoCardWidget(title: "${coursemodel.duration}" , image: "time.png", 
                    
                     color: Colors.black,)),
                    SizedBox(height: 10,) ,
                    Container(
                    padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 6 ) ,
                    color: Color.fromARGB(255, 236, 236, 236) ,
                      child: courseInfoCardWidget(title: "${coursemodel.payment}" , image: "payment.png" , 
                       color: Colors.black,)),
                    SizedBox(height: 10,) ,
                    Container(
                    padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 6 , ) ,
                    color: Color.fromARGB(255, 236, 236, 236) ,
                      child: courseInfoCardWidget(title: "${coursemodel.rating}" , image: "rating.png" ,
                      color: Colors.black ,
                       )),
                    

                 
                  ],
                ) ,  
                
                SizedBox(height: 30 ) ,  
                /////////////
              

                Container(
                alignment: Alignment.centerRight ,
                child: Text("تعرف على الكورس" , style: TextStyle(fontFamily: "noor" , color: Colors.black , fontSize: 18 , fontWeight: FontWeight.bold ) )) , 
                SizedBox(height: 30 ) , 
                
              Column( 
              children: [
              Directionality(
              textDirection : TextDirection.rtl  ,  
              child: ExpansionTile(           
              title: Text (
                'حول هذا الكورس', 
                style: TextStyle(fontFamily: "noor" , color: Colors.black , fontSize: 18 , fontWeight: FontWeight.w500 )
              ) ,
              children: [
                Padding(
                  padding:  EdgeInsets.all(8.0) ,
                  child: Text(
                    'تقدم هذه الدورة مقدمة شاملة لأساسيات البرمجة. ستتعلم كيفية كتابة الأكواد '
                    'باستخدام لغات البرمجة المختلفة مثل بايثون، جافا، وسي++. الدورة مصممة '
                    'للمبتدئين ولا تتطلب أي معرفة مسبقة بالبرمجة. سنبدأ بفهم المفاهيم الأساسية '
                    'مثل المتغيرات، الجمل الشرطية، الحلقات، والدوال، ثم سنتقدم إلى مواضيع أكثر '
                    'تعقيداً مثل هياكل البيانات، البرمجة الكائنية، وتطوير التطبيقات. بنهاية هذه '
                    'الدورة، ستكون قادراً على بناء برامج بسيطة وتطوير مهاراتك البرمجية لمشاريع '
                    'أكثر تعقيداً في المستقبل.' ,
                    style : 
                       TextStyle (
                       fontFamily: "noor" ,
                       color: Colors.black , 
                       fontSize: 14  
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Add more ExpansionTile widgets for additional sections if needed
        ],
      ),

              ],
            ),
          ),
        )
      ),
    ) ; 
  }
}



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:corsatech_app/core/model/catergory_Medel.dart';
import 'package:corsatech_app/core/model/course_Model.dart';
import 'package:corsatech_app/core/model/instructor_Model.dart';

import 'package:get/get.dart';

class homeViewModel extends GetxController {

  //part of category : 
  
  List<CategoryModel> get categoryModel => _categoryModel ; 
  List<CategoryModel> _categoryModel = []  ;  
  CollectionReference _categoryCollectionReference = FirebaseFirestore.instance.collection("category") ; 

  List<CourseModel> get courseModel => _courseModel ; 
List<CourseModel> _courseModel = []  ;  
CollectionReference _courseCollectionReference = FirebaseFirestore.instance.collection("course") ;

  List<InstructorModel> get instructorModel => _instructorModel ; 
List<InstructorModel> _instructorModel = []  ;  
CollectionReference _instructorCollectionReference = FirebaseFirestore.instance.collection("instructor") ;

bool _isLoading = false ;
bool get isLoading => _isLoading ; 


  void initState() {

    getCategory()  ;
    getcourse() ; 
    getInstructor()  ;

  }

  homeViewModel () {
    getCategory() ; 
    getcourse() ; 
    getInstructor()  ;
  }
  
  void getCategory ()  async {
  _isLoading = true ; 
  await _categoryCollectionReference.get().then((value) {

    for ( int i = 0 ; i<value.docs.length ;  i++) {

    _categoryModel.add(CategoryModel.fromJson(
      value.docs[i].data() as Map 

    )) ;

      }
    
   print(_categoryModel.length) ;  
   _isLoading = false ; 
   update() ;
  }
  ) ; 
  }


  void getcourse () async  {
    _isLoading = true ; 
 await _courseCollectionReference.get().then((value){
  for (int i=0 ; i< value.docs.length ; i++ ){
    _courseModel.add(CourseModel.fromJson(value.docs[i].data() as Map)) ; 
  }
  _isLoading = false ; 
 print(_instructorModel.length) ; 

 }

 
 
 ) ; 

}

  void getInstructor () async  {
    _isLoading = true ; 
 await _instructorCollectionReference.get().then((value){
  for (int i=0 ; i< value.docs.length ; i++ ){
    _instructorModel.add(InstructorModel.fromJson(value.docs[i].data() as Map)) ; 
  }
  _isLoading = false ; 
 print(_instructorModel.length) ; 

 }

 
 
 ) ; 

}





}

// part of course : 

 


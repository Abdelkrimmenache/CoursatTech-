import 'package:corsatech_app/core/model/instructor_Model.dart';
import 'package:corsatech_app/helper/constance.dart';
import 'package:flutter/material.dart';

class FavoriteCourseModel {
  String? courseId ; 
  String? name;
  String? category;
  String? instructor;
  String? picOfCourse ; 


  FavoriteCourseModel({
    this.courseId , 
    this.name,
    this.category,
    this.instructor,
   required this.picOfCourse 
 
    
   
  });

  // Extract a Course object from a Map object
  FavoriteCourseModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
  
    courseId =map[columnCourseId] ; 
    name =map[columnName] ; 
    category =map[columnCategory] ; 
     instructor =map[columnInstructor] ; 
     picOfCourse = map[columnPicOfCourse] ; 

  }

  // Convert a Course object into a Map object
  Map<String, dynamic> toJson() {
    return {
   columnCourseId : courseId , 
   columnName : name  ,
   columnCategory : category , 
   columnInstructor : instructor , 
   columnPicOfCourse : picOfCourse 
    };
  }
}

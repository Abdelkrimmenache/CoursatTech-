import 'package:corsatech_app/core/model/instructor_Model.dart';
import 'package:flutter/material.dart';

class CourseModel {
  String? courseId ; 
  String? title;
  String? instructorId;
  String? picOfCourse;
  String? description;
  String? duration;
  String? link;
  String? paltrorm;
  String? catergory ; 
  String? rating ; 
  String? payment ; 


  CourseModel({
    this.courseId , 
    this.title,
    this.instructorId,
    this.picOfCourse,
    this.description,
    this.duration,
    this.link,
    this.paltrorm,
    this.catergory , 
    this.rating , 
    this.payment , 
    
    thi
  });

  // Extract a Course object from a Map object
  CourseModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    title = map['title'];
    instructorId = map['instructorId'] ; 
    picOfCourse = map['picOfCourse'];
    description = map['description'];
    duration = map['duration'] ; 
    link = map['link'];
    paltrorm = map['paltrorm'];
    catergory = map['catergory'] ;
    courseId =map['courseId'] ; 
    rating = map['rating'] ; 
    payment = map['payment'] ;
  }

  // Convert a Course object into a Map object
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'instructor': instructorId , 
      'picOfCourse': picOfCourse,
      'description': description,
      'duration': duration,
      'link': link,
      'paltrorm': paltrorm,
      'catergory' : catergory , 
      'courseId' : courseId   , 
      'rating' : rating , 
      'payment' :  payment , 

    };
  }
}

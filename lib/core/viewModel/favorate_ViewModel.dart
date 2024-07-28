


import 'package:corsatech_app/core/model/favoriteCourse_Model.dart';
import 'package:corsatech_app/core/services/database/favorite_database_helper.dart';
import 'package:get/get.dart';

class favorateViewModel  extends GetxController {

  favorateViewModel () {
    getAllCourses() ; 


  }
   get existInFavorite => _existInFavorite ; 
   bool _existInFavorite = false ; 
   get loading => _loading ; 
   bool _loading = false ; 
    List <FavoriteCourseModel> get favoriteCourseModel {
      return 
      _favriteCourseModel ;  
    } 

   List<FavoriteCourseModel> _favriteCourseModel = []  ; 

    getAllCourses() async {
      _loading = true ; 
        var dbHelper =   FaviteDatabaseHelper.db ; 
       _favriteCourseModel =  await dbHelper.getAllCourses() ;
       print(_favriteCourseModel.length) ; 
       _loading = false ; 
       
       update() ;   
    }

    addCourse (FavoriteCourseModel favoriteCourseModel ) async {
    if (_favriteCourseModel.length == 0 ) {
    var dbHelper =   FaviteDatabaseHelper.db ; 
    await  dbHelper.insert(favoriteCourseModel) ; 
     _favriteCourseModel.add(favoriteCourseModel) ; 
    
    update() ;
    }

   if (elementExistInFavorite(favoriteCourseModel) == false) {
    var dbHelper =   FaviteDatabaseHelper.db ; 
    await  dbHelper.insert(favoriteCourseModel) ; 
    _favriteCourseModel.add(favoriteCourseModel) ; 
    update() ;
  
   }

  return ; 


    }  


    deleteCourse (FavoriteCourseModel favoriteCourseModel ) async {
   

      if (elementExistInFavorite(favoriteCourseModel) == true ){
      var dbHelper =   FaviteDatabaseHelper.db ; 
      await  dbHelper.delete(favoriteCourseModel) ; 
      _favriteCourseModel.remove(favoriteCourseModel) ; 
      update() ;
      }

    }  

    addOrDelteCourse (FavoriteCourseModel favoriteCourseModel) {
      addCourse(favoriteCourseModel) ; 
      deleteCourse(favoriteCourseModel) ; 
     update();
    }

    bool elementExistInFavorite(FavoriteCourseModel favoriteCourseModel) {
    return _favriteCourseModel.any((course) => course.courseId == favoriteCourseModel.courseId);
    
  }
    

   }
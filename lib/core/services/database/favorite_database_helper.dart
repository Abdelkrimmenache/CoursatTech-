
import 'package:corsatech_app/core/model/favoriteCourse_Model.dart';
import 'package:corsatech_app/core/viewModel/favorate_ViewModel.dart';
import 'package:corsatech_app/helper/constance.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class FaviteDatabaseHelper {

  FaviteDatabaseHelper._() ; 
  
  static final FaviteDatabaseHelper db = FaviteDatabaseHelper._() ; 
  static Database? _database ;  
  Future<Database> get database async {
    if (_database != null) {
    return _database! ; 
  
    }
    return await initDb() ;

  }
  
   initDb() async {
   String path = join(await getDatabasesPath() , 'favoriteCourse.db' ) ;
   return await openDatabase( path , version: 1 , 
   onCreate:  (Database db , int version ) async {
    await db.execute('''
    CREATE TABLE $favoriteCourseTable (
      $columnName TEXT NOT NULL , 
      $columnCourseId TEXT NOT NULL , 
      $columnInstructor TEXT NOT NULL , 
      $columnCategory TEXT NOT NULL , 
      $columnPicOfCourse TEXT NOT NULL 
    )
  ''') ; 
    
   }
   
   ) ;
  }

  insert(FavoriteCourseModel model )  async {
  var dbClient = await database ; 

  dbClient.insert(favoriteCourseTable, model.toJson() , conflictAlgorithm: ConflictAlgorithm.replace ,) ;
    

  }
  
 delete(FavoriteCourseModel model) async {
    var dbClient = await database;
    return await dbClient.delete(
      favoriteCourseTable,
      where: '$columnCourseId = ?',
      whereArgs: [model.courseId],
    );
  }
  getAllCourses () async {
  var dbClient = await database; 
  List<Map> maps =   await dbClient.query(favoriteCourseTable) ; 

   List<FavoriteCourseModel>  list = maps.isNotEmpty? 
   maps.map((course) =>FavoriteCourseModel.fromJson(course)  ).toList() : [] ;
   
   return list ;   
   


  }


}
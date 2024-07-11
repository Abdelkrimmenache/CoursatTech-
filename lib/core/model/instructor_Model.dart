
class InstructorModel {

 String? name ,
  picOfInscturctor ,
   instructorId ; 

 InstructorModel({this.name , this.picOfInscturctor }) ; 

  //convert course object into course map : 

  InstructorModel.fromJson(Map <dynamic , dynamic > map ) {
    if (map == null ){
      return ;  
    }
    name = map['name'] ; 
    picOfInscturctor = map['picOfInscturctor'] ; 
    instructorId = map['instructorId'] ; 
  }

  toJson () {
     return {
      'name' : name , 
      'picOfInscturctor' : picOfInscturctor , 
      'instructorId' : instructorId , 
     } ;
    
  }



}
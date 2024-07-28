import 'package:http/http.dart';
import 'dart:convert';




class UserModel {

String? userId , name , email  ;

UserModel({this.userId ,this.name , this.email , }) ;   

UserModel.fromJson(Map<dynamic , dynamic > map ) {
  if(map == null ) {
    return ; 

  }
  userId = map['userId'] ; 
  name = map['name'] ; 
  email = map['email'] ; 

  


}

  toJson ( ) { 
  return
  {
  'userid' : userId ,  
  'name' : name ,  
  'email' : email ,  

  

  } ; 

}

}





// class UserModel  {


//   String? userId , email , name , pic ;
//   UserModel({this.userId , this.email , this.name , this.pic }) ;  

//   UserModel.fromJson(Map <dynamic , dynamic> map  ) {
//     if (map == null )  {
//       return  ; 
//     }

//     userId = map['UserId']  ;
//     email = map['email']  ;
//     name = map['name']  ;
//     pic = map['pic']  ;
    

//   } 

//   toJson() {
//     return {
//       'userId' : userId , 
//       'email' : email , 
//       'name' : name , 
//       'pic' : pic , 


//     } ; 
//   }
   

  
    

// }
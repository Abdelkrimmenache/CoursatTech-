
class UserModel {

 String? userId , name , email ;  

 UserModel ( 
  {this.email , this.name , this.userId , }) ; 

 UserModel.fromJson (Map <dynamic , dynamic>  map ) {
  userId = map['userId'] ; 
  name = map['name'] ; 
  email = map['email'] ; 
 } 

 toJson () {

  return 
  {
    'userId' : userId! ,  
    'name' : name!     ,  
    'email' : email!   ,  
  } ; 
 }




}



import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String fullName ;
  final String email ;
  final String phoneNo ;
  final String password ;
 // final String nid ;


  const UserModel ({

  this.id ,
  required this.email,
  required this.fullName ,
  required this.password,
 // required this.fullName,
  required this.phoneNo,
  //  required this.nid  ,

});

toJson(){
  return{
    "FullName" : fullName ,
    "Email" : email,
    "Phone" : phoneNo ,
    "Password" : password ,

  };
}
/// step-1 Map user fetched from firebase to UserModel
  factory UserModel.fromSnapshot(DocumentSnapshot <Map<String,dynamic>> document){
  final data = document.data()!;
  return UserModel(
      id: document.id,
      email: data["Email"],
      fullName: data["FullName"],
      password: data["Password"],
      phoneNo: data["Phone"],
  );
  }
}



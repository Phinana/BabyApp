import 'package:plant_app/model/baby.dart';
class UserModel{
  int admin;
  String uid;
  String email;
  String firstName;
  String secondName;
  List<Map<String,dynamic>> babies;

  UserModel({this.admin, this.uid,this.email,this.firstName,this.secondName,this.babies});


  factory UserModel.fromMap(map){
    return UserModel(
      admin: map['admin'],
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      secondName: map['secondName'],
      babies: List<Map<String,dynamic>>.from(map['babies']),
    );
  }

  Map<String,dynamic> toMap(){
    return{
      'admin': admin,
      'uid': uid,
      'email': email,
      'firstName':firstName,
      'secondName':secondName,
      'babies':babies
    };
  }
}
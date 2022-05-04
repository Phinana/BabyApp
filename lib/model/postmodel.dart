import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel{
  String ana_baslik;
  String baslik;
  String icerik;

  PostModel({
    this.ana_baslik,
    this.baslik,
    this.icerik,
  });

  factory PostModel.fromFirestore(DocumentSnapshot documentSnapshot){
    Map data = documentSnapshot.data();
    return PostModel(
      ana_baslik: data["ana_baslik"],
      baslik: data["baslik"],
      icerik: data["icerik"],
    );
  }
  Map<String,dynamic> toMap(){
    return{
      'ana_baslik': ana_baslik,
      'baslik':baslik,
      'icerik':icerik,
    };
  }

  factory PostModel.fromMap(map){
    return PostModel(
      ana_baslik: map['ana_baslik'],
      baslik: map['baslik'],
      icerik: map['icerik'],
    );
  }
}
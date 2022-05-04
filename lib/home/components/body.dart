import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/addBabyScreen/addBabyScreen.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/login/LoginPage.dart';
import 'header_with_seachbox.dart';
import 'recomend_plants.dart';


class Body extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BodyState();
  }
}
class BodyState extends State<Body>{

  final auth = FirebaseAuth.instance;
  var firebaseUser =  FirebaseAuth.instance.currentUser;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        HeaderWithSearchBox(size: size),
        Center(
          child: Container(
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              color: kPrimaryColor,
              child: Icon(Icons.add, color: Colors.white),
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context)=>AddBabyScreen(option: 1)));
              },
            ),
          ),
        ),
        //TitleWithMoreBtn(title: "", press: () {}),
        SizedBox(height: 20),
        Babies(),
        SizedBox(height: kDefaultPadding * 3),
        Center(
          child: FlatButton(
              color: kPrimaryColor,
              child: Text(
                  "Çıkış",
                  style: TextStyle(color: kTextColorW, fontSize: 20.0, fontFamily: 'ScrambledTofu')
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              onPressed: (){
                FirebaseAuth.instance.signOut();
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginPage()));
              }
          ),
        ),
        SizedBox(
          height: 35,
        ),
      ],
    );
  }
}
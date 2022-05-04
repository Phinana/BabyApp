import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/firebaseFunctions.dart';
import 'package:plant_app/postPage/MainTitles.dart';

class MyDrawer extends StatelessWidget {

  static bool visibiltyVariable = false;

  @override
  Widget build(BuildContext context) {
    var firebaseUser = FirebaseAuth.instance.currentUser;

    var myheight = MediaQuery.of(context).size.height * .50;
    var mywidth = MediaQuery.of(context).size.width * .50;

    return Container(
      width: mywidth * .75,
      child: Drawer(
        child: Container(
          color: kSecondaryColor,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text(
                  'Side menu',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                decoration: BoxDecoration(
                    color: kPrimaryColor,),
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ListTile(
                    title: Column(
                      children: [
                        Icon(Icons.input, color: kPrimaryColor,),
                        Text('Welcome'),
                      ],
                    ),
                    onTap: () => {
                    },
                  ),
                  ListTile(
                    title: Column(
                      children: [
                        Icon(Icons.input, color: kPrimaryColor,),
                        Text('Welcome'),
                      ],
                    ),
                    onTap: () => {},
                  ),
                  ListTile(
                    title: Column(
                      children: [
                        Icon(Icons.input, color: kPrimaryColor,),
                        Text('Welcome'),
                      ],
                    ),
                    onTap: () => {},
                  ),
                  ListTile(
                    title: Column(
                      children: [
                        Icon(Icons.input, color: kPrimaryColor,),
                        Text('Post Screen'),
                      ],
                    ),
                    onTap: () async => {
                      visibiltyVariable = await FirebaseService(uid: firebaseUser.uid).getAdminState(),
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>MainTitles())),
                    },
                  ),
                  ListTile(
                    title: Column(
                      children: [
                        Icon(Icons.input, color: kPrimaryColor,),
                        Text('Welcome'),
                      ],
                    ),
                    onTap: () => {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
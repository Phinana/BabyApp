import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/addBabyScreen/addBabyScreen.dart';
import 'package:plant_app/details/details.dart';
import 'package:plant_app/firebaseFunctions.dart';
import 'package:plant_app/model/baby.dart';
import 'package:plant_app/model/user_model.dart';

import '../../../constants.dart';



class Babies extends StatefulWidget {
  const Babies({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
   return BabiesState();
  }
}

class BabiesState extends State<Babies>{
  User user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();


  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }


  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
      future: FirebaseService(uid: user.uid).getBabies(),
      builder: (context, AsyncSnapshot<List> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Expanded(
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  //color: Color.fromRGBO(155, 208, 232, 0.5),
                  color: Colors.transparent,
                ),
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 0.0),
                        child: Card(
                          color: Colors.transparent,
                          shadowColor: Colors.transparent,
                          child: ListTile(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsScreen(babydata: Baby.fromMap(snapshot.data[index])),
                                ),
                              );
                            },
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(onPressed: (){
                                  Navigator.push(context,MaterialPageRoute(builder: (context)=>AddBabyScreen(option: 2, baby: Baby.fromMap(snapshot.data[index]))));
                                }, icon: ImageIcon(AssetImage("assets/icons/editbutton.png"), color: kPrimaryColor,)),
                                SizedBox(width: 0),
                                IconButton(onPressed: (){
                                  showAlertDialog(context, snapshot.data[index]);
                                }, icon: ImageIcon(AssetImage("assets/icons/deletebutton.png"), color: kPrimaryColor,)),
                              ],
                            ),
                            title: Align(
                              alignment: Alignment(-0.7, 0),
                              child: Text(snapshot.data[index]["name"],style: TextStyle(
                                  fontSize: 25.0,
                                  fontFamily: 'ScrambledTofu',
                                  color: kPrimaryColor
                              ),),
                            ),
                            leading:  CircleAvatar(
                              radius: 25,
                              backgroundColor: kPrimaryColor,
                              child: CircleAvatar(
                                radius: 24,
                                //backgroundImage: AssetImage(babies[index].image), burada backgrund image çek
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.none) {
          return null;
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  showAlertDialog(BuildContext context, Map<String, dynamic> baby) {

    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("İptal", style: TextStyle(color: Colors.lightGreen)),
      onPressed:  () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Devam Et", style: TextStyle(color: Colors.red)),
      onPressed: () async {
        await FirebaseService(uid: user.uid).deleteBaby(Baby.fromMap(baby));
        Navigator.of(context).pop();
        setState(() {
        });
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(32)),
      ),
      title: Text("Dikkat edin!", style: TextStyle(color: kTextColorB)),
      content: Text("Seçili Bebeği Silmek İstediğinize Emin misiniz? Bu işlem Geri Alınamaz." ,
          style: TextStyle(color: kTextColorB, fontSize: 15.0)),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}
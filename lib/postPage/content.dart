import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/firebaseFunctions.dart';
import 'package:plant_app/model/postmodel.dart';
import 'package:plant_app/myDrawer.dart';

class Content extends StatefulWidget {


  final int anaindex;
  final int index;
  final PostModel post;

  Content({
    this.post,
    this.anaindex,
    this.index,
});


  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {

  bool textFieldVisibility = false;
  TextEditingController textEditingControllerBaslik = TextEditingController();
  TextEditingController textEditingControllerIcerik = TextEditingController();

  User user = FirebaseAuth.instance.currentUser;
  bool isVisible = MyDrawer.visibiltyVariable;


  PostModel post;
  @override
  Widget build(BuildContext context) {

    post = widget.post;
    textEditingControllerIcerik.text = post.icerik;
    textEditingControllerBaslik.text = post.baslik;

    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: IconButton(onPressed: (){
                    Navigator.pop(context,true);
                  }, icon: Icon(Icons.arrow_back, color: kPrimaryColor), iconSize: 30.0),
                ),

                Row(

                  children: [

                    Visibility(
                      visible: isVisible,
                      child: Container(
                        width: 60,
                        child: FlatButton(
                          color: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9.0)),
                          child: Icon(Icons.edit, color: kPrimaryColor, size: 30.0),
                          onPressed: () {
                            setState(() {
                              if(textFieldVisibility == false){
                                textFieldVisibility = true;
                              }else if(textFieldVisibility == true){
                                textFieldVisibility = false;
                              }
                            });
                          },
                        ),
                      ),
                    ),

                    Visibility(
                      visible: isVisible,
                      child: Container(
                        width: 60,
                        child: FlatButton(
                          color: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9.0)),
                          child: Icon(Icons.check, color: kPrimaryColor, size: 30.0),
                          onPressed: () async {
                            post.baslik = textEditingControllerBaslik.text;
                            post.icerik = textEditingControllerIcerik.text;
                            await FirebaseService().updateSubTitle(widget.anaindex, widget.index, post);

                            setState(() {
                              if(textFieldVisibility == false){
                                textFieldVisibility = true;
                              }else if(textFieldVisibility == true){
                                textFieldVisibility = false;
                              }
                            });

                          },
                        ),
                      ),
                    ),
                  ],
                )

              ],
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 25,right: 20, bottom: 0, left: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: Colors.white,
                                filled: textFieldVisibility,
                              ),
                            enabled: textFieldVisibility,
                            controller: textEditingControllerBaslik,
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: kTextColorB, fontFamily: "ScrambledTofu")
                          )
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: TextField(
                            keyboardType: TextInputType.multiline,
                              maxLines: null,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: Colors.white,
                                filled: textFieldVisibility,
                              ),
                            enabled: textFieldVisibility,
                            controller: textEditingControllerIcerik,
                              style: TextStyle(fontSize: 15, color: kTextColorB, fontFamily: "ScrambledTofu")
                          )
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

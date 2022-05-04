import 'package:flutter/material.dart';
import 'package:plant_app/model/baby.dart';

import '../constants.dart';
import 'components/image_and_icons.dart';
import 'components/title_and_price.dart';

//import 'package:plant_app/screens/details/components/body.dart';

class DetailsScreen extends StatelessWidget {
  final Baby babydata;

  const DetailsScreen({
    this.babydata
});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: kSecondaryColor,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ImageAndIcons(size: size),
              TitleAndPrice(name: "${babydata.name}", age: babydata.age, desc: "${babydata.desc}"),
              SizedBox(height: kDefaultPadding),
            ],
          ),
        ),
      ),
    );
  }
}

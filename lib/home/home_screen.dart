import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plant_app/home/components/body.dart';

import '../constants.dart';
import '../myDrawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key:key);
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}


class HomeScreenState extends State<HomeScreen>{
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kSecondaryColor
      ),
      child: Scaffold(
        drawer: MyDrawer(),
        backgroundColor: Colors.transparent,
        appBar: buildAppBar(),
        body: Body(),
        //bottomNavigationBar: MyBottomNavBar(),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/menu.svg", color: kPrimaryColor),
        onPressed: () {},
      ),
    );
  }
}

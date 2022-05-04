import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_app/details/guide.dart';

import '../../../constants.dart';
import 'icon_card.dart';

class ImageAndIcons extends StatelessWidget {
  const ImageAndIcons({
    Key key,
    this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPadding * 1.5),
      child: SizedBox(
        height: size.height * 0.8,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: kDefaultPadding * 3),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        padding:
                            EdgeInsets.symmetric(horizontal: kDefaultPadding),
                        icon: SvgPicture.asset("assets/icons/back_arrow.svg", color: kPrimaryColor),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Spacer(),
                    GestureDetector(child: IconCard(icon: "assets/icons/sun.svg"), onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GuideScreen(),
                        ),
                      );
                    },),
                    GestureDetector(child: IconCard(icon: "assets/icons/icon_2.svg"), onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GuideScreen(),
                        ),
                      );
                    },),
                    GestureDetector(child: IconCard(icon: "assets/icons/icon_3.svg"), onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GuideScreen(),
                        ),
                      );
                    },),
                    GestureDetector(child: IconCard(icon: "assets/icons/icon_4.svg"), onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GuideScreen(),
                        ),
                      );
                    },),
                  ],
                ),
              ),
            ),
            Container(
              height: size.height * 0.8,
              width: size.width * 0.75,
              decoration: BoxDecoration(
                border: Border.all(color: kPrimaryColor, width: 2),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(63),
                  bottomLeft: Radius.circular(63),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 60,
                    color: kPrimaryColor.withOpacity(0.20),
                  ),
                ],
                image: DecorationImage(
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                  image: AssetImage("assets/image/bebeka.jpeg"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

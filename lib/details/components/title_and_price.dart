import 'package:flutter/material.dart';

import '../../../constants.dart';

class TitleAndPrice extends StatelessWidget {
  const TitleAndPrice({
    Key key,
    this.name,
    this.age,
    this.desc,
  }) : super(key: key);

  final String name;
  final int age;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        children: <Widget>[
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$name\n",
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(color: kPrimaryColor, fontSize: 30.0, fontFamily: 'ScrambledTofu'),

                ),
                TextSpan(
                  text: age.toString(),
                  style: TextStyle(
                      color: kPrimaryColor, fontSize: 20.0, fontFamily: 'ScrambledTofu'
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Text(
            "$desc",
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: Colors.lightGreen, fontSize: 25.0, fontFamily: 'ScrambledTofu'),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../widgets/ui_color.dart';

class PageTwo extends StatelessWidget {
  final double value;
  final bool isDarkMode;

  const PageTwo({Key key, @required this.value, @required this.isDarkMode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
              width: 450,
              height: 300,
              child: Lottie.asset(
                  isDarkMode
                      ? 'assets/pagetwo_dark.json'
                      : 'assets/pagetwo_light.json',
                  alignment: Alignment.center)),
          SizedBox(
            height: 20,
          ),
          Text(
            'Watch on any devices',
            style: TextStyle(
                fontSize: 24,
                color: isDarkMode ? netflixWhite : netflixBlack,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

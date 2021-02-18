import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../widgets/ui_color.dart';

class PageOne extends StatelessWidget {
  final double value;
  final bool isDarkMode;

  const PageOne({Key key, @required this.value, @required this.isDarkMode})
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
              width: 400,
              height: 300,
              child: Lottie.asset(
                  isDarkMode
                      ? 'assets/pageone_dark.json'
                      : 'assets/pageone_light.json',
                  alignment: Alignment.center)),
          SizedBox(
            height: 20,
          ),
          Text(
            'A simple way to watch, anywhere anytime',
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

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'file:///D:/Flutter%20Project/Portofolio/netflix_clone/lib/views/login/login.dart';
import '../../widgets/ui_color.dart';

class PageThree extends StatelessWidget {
  final bool isDarkMode;

  const PageThree({Key key, @required this.isDarkMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: isDarkMode ? netflixBlack : netflixWhite,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Stack(children: [
            Container(
              width: 400,
              height: 400,
              child: Lottie.asset(
                  isDarkMode
                      ? 'assets/pagethree_dark.json'
                      : 'assets/pagethree_light.json',
                  alignment: Alignment.center),
            ),
          ]),
          RaisedButton(
            padding: EdgeInsets.all(5.0),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => LoginPage(
                        key: PageStorageKey('loginScreen'),
                            isDarkMode: isDarkMode,
                          )),
                  (route) => false);
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            color: netflixMaroon,
            elevation: 1,
            child: Text(
              'Login',
              style: TextStyle(color: netflixWhite, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}

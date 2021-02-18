import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../login/login.dart';
import 'page_one.dart';
import 'page_three.dart';
import 'page_two.dart';
import '../../widgets/ui_color.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool isDarkMode = false;
  int pageIndex;
  PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: 0,
      keepPage: true,
    )..addListener(() {
        setState(() {
          pageIndex = pageController.page.round();
        });
      });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode ? netflixBlack : netflixWhite,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: pageIndex != 2 ? Container(
            child: Image.asset(
          'assets/logo.png',
          scale: 0.2,
        )) : null,
        actions: <Widget>[
          if (pageIndex != 2)
            FlatButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => LoginPage(
                              isDarkMode: isDarkMode,
                            )),
                    (route) => false);
              },
              child: Text(
                'Skip',
                style: TextStyle(
                  fontSize: 20,
                  color: netflixMaroon,
                ),
              ),
            ),
        ],
      ),
      body: SafeArea(
        bottom: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Stack(children: [
                    if (index == 0)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              child: Icon(
                            Icons.wb_incandescent_rounded,
                            color: isDarkMode ? netflixWhite : netflixMaroon,
                          )),
                          Switch(
                            value: isDarkMode,
                            onChanged: (newValue) {
                              setState(() {
                                newValue = !isDarkMode;
                                isDarkMode = newValue;
                              });
                            },
                          ),
                        ],
                      ),
                    AnimatedBuilder(
                      animation: pageController,
                      builder: (context, child) {
                        double value = 1.0;

                        if (pageController.position.haveDimensions) {
                          value = pageController.page - index;
                          value = (1 - (value.abs() * 0.2)).clamp(0.0, 1.0);
                        } else {
                          value = index == 0 ? value : value * 0.8;
                        }

                        if (index == 0) {
                          return PageOne(
                            value: value,
                            isDarkMode: isDarkMode,
                          );
                        } else if (index == 1) {
                          return PageTwo(value: value, isDarkMode: isDarkMode);
                        } else {
                          return PageThree(isDarkMode: isDarkMode);
                        }
                      },
                    ),
                  ]);
                },
              ),
            ),
            PageIndicator(
              pageIndex: pageIndex,
              isDarkMode: isDarkMode,
            ),
          ],
        ),
      ),
    );
  }
}

class PageIndicator extends StatefulWidget {
  final int pageIndex;
  final bool isDarkMode;

  const PageIndicator({
    Key key,
    @required this.pageIndex,
    @required this.isDarkMode,
  }) : super(key: key);

  @override
  _PageIndicatorState createState() => _PageIndicatorState();
}

class _PageIndicatorState extends State<PageIndicator> {
  Color _getColor(int index) {
    return widget.pageIndex == index
        ? netflixMaroon.withOpacity(0.9)
        : netflixMaroon.withOpacity(0.3);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      alignment: Alignment.center,
      width: double.infinity,
      height: 6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          AnimatedContainer(
            height: 12.0,
            width: widget.pageIndex == 0 ? 16 : 12,
            decoration: BoxDecoration(
                color: _getColor(0),
                borderRadius: BorderRadius.all(Radius.circular(50))),
            duration: Duration(milliseconds: 700),
          ),
          SizedBox(
            width: 10,
          ),
          AnimatedContainer(
            height: 12.0,
            width: widget.pageIndex == 1 ? 16 : 12,
            decoration: BoxDecoration(
              color: _getColor(1),
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            duration: Duration(milliseconds: 700),
          ),
          SizedBox(
            width: 10,
          ),
          AnimatedContainer(
            height: 12.0,
            width: widget.pageIndex == 2 ? 16 : 12,
            decoration: BoxDecoration(
              color: _getColor(2),
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            duration: Duration(milliseconds: 700),
          ),
        ],
      ),
    );
  }
}

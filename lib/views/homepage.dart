import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/cubits/app_bar/app_bar_cubit.dart';
import 'package:netflix_clone/views/search.dart';
import '../widgets/widgets.dart';

import 'coming_soon.dart';
import 'downloads.dart';
import 'home.dart';
import 'more.dart';

class HomePage extends StatefulWidget {
  final bool isDarkMode;

  HomePage({Key key, this.isDarkMode}) : super(key : key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController;
  int pageIndex = 0;

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
      bottomNavigationBar: !Responsive.isDesktop(context)
          ? BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: netflixBlack,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search_outlined), label: 'Search'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.ondemand_video_outlined),
                    label: 'Coming Soon'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.download_outlined), label: 'Download'),
                BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'More'),
              ],
              currentIndex: pageIndex,
              selectedItemColor: netflixWhite,
              unselectedItemColor: Colors.grey,
              onTap: (index) {
                setState(() {
                  pageIndex = index;
                });
              },
            )
          : null,
      body: BlocProvider<AppBarCubit>(
        create: (_) => AppBarCubit(),
        child: PageView.builder(
          controller: pageController,
          itemCount: 5,
          itemBuilder: (context, index) {
            return AnimatedBuilder(
              animation: pageController,
              builder: (context, child) {
                double value = 1.0;

                if (pageController.position.haveDimensions) {
                  value = pageController.page - index;
                  value = (1 - (value.abs() * 0.2)).clamp(0.0, 1.0);
                } else {
                  value = index == 0 ? value : value * 0.8;
                }

                if (pageIndex == 0 && index == 0) {
                  return Home(
                    key: PageStorageKey('homeScreen'),
                    value: value,
                    isDarkMode: widget.isDarkMode,
                  );
                } else if (pageIndex == 1 && index == 1) {
                  return Search(
                    key: PageStorageKey('searchScreen'),
                    value: value,
                    isDarkMode: widget.isDarkMode,
                  );
                } else if (pageIndex == 2 && index == 2) {
                  return ComingSoon(
                    key: PageStorageKey('comingSoon'),
                    value: value,
                    isDarkMode: widget.isDarkMode,
                  );
                } else if (pageIndex == 3 && index == 3) {
                  return Downloads(
                    key: PageStorageKey('downloadScreen'),
                    value: value,
                    isDarkMode: widget.isDarkMode,
                  );
                } else {
                  return More(
                    key: PageStorageKey('more'),
                    value: value,
                    isDarkMode: widget.isDarkMode,
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
}

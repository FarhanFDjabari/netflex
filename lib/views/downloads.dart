import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/widgets/widgets.dart';

class Downloads extends StatelessWidget {
  final double value;
  final bool isDarkMode;
  bool smartDownload = true;

  Downloads({Key key, @required this.value, @required this.isDarkMode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: netflixBlack,
      appBar: AppBar(
        backgroundColor: netflixBlack,
        title: Row(
          children: [
            Icon(Icons.info_outlined),
            Container(
              padding: EdgeInsets.only(left: 3, right: 7),
              child: Text('Smart Downloads'),
            ),
            Container(
              child: Text(
                smartDownload ? 'ON' : 'OFF',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              ),
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.edit_outlined),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index) => Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.95,
                child: Column(
                  children: [
                    Container(
                      height: 20,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 5),
                            height: 15,
                            width: 15,
                            color: netflixMaroon,
                          ),
                          Text('Alex', style: TextStyle(color: netflixWhite),),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Center(
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: ListView.builder(
                            itemCount: 2,
                            itemBuilder: (context, index) => Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.25,
                                    height: 50,
                                    color: netflixWhite,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'YOU',
                                        style: TextStyle(
                                            color: netflixWhite,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '2 Episodes | 1.5GB',
                                        style: TextStyle(
                                            color: netflixWhite.withOpacity(0.5)),
                                      )
                                    ],
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.arrow_forward_ios),
                                    color: netflixWhite,
                                    iconSize: 15,
                                    onPressed: () {},
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

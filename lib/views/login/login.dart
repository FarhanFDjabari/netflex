import 'package:flutter/material.dart';
import 'package:netflix_clone/widgets/ui_color.dart';

import '../homepage.dart';

class LoginPage extends StatelessWidget {
  final bool isDarkMode;
  final _formKey = GlobalKey<FormState>();
  bool isObscure = true;
  bool haveAccount = true;

  LoginPage({Key key, @required this.isDarkMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg-login.png'),
                colorFilter:
                    ColorFilter.mode(netflixBlack, BlendMode.hardLight),
                fit: BoxFit.none,
              ),
            ),
          ),
          SafeArea(
            top: true,
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FlatButton(
                          onPressed: () {},
                          child: Text(
                            'EN',
                            style: TextStyle(
                              fontSize: 20,
                              color: netflixMaroon,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        haveAccount ? 'Hello!!' : 'Sign Up Here',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: netflixWhite,
                          fontSize: 40,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(35.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (haveAccount == false)
                              TextFormField(
                                style: TextStyle(color: netflixWhite),
                                cursorColor: netflixMaroon,
                                decoration: InputDecoration(
                                    labelText: "Username",
                                    labelStyle: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      color: netflixMaroon,
                                    ),
                                    hintText: "Enter your username",
                                    hintStyle: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 18,
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(color: netflixMaroon),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(25)),
                                    )),
                                keyboardType: TextInputType.name,
                                autofocus: haveAccount ? false : true,
                              ),
                            SizedBox(height: 8),
                            TextFormField(
                              style: TextStyle(color: netflixWhite),
                              cursorColor: netflixMaroon,
                              decoration: InputDecoration(
                                  labelText: "Email",
                                  labelStyle: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: netflixMaroon,
                                  ),
                                  hintText: "Enter your email",
                                  hintStyle: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: 18,
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: netflixMaroon),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25)),
                                  )),
                              keyboardType: TextInputType.emailAddress,
                              autofocus: true,
                            ),
                            SizedBox(height: 8),
                            TextFormField(
                              style: TextStyle(color: netflixWhite),
                              cursorColor: netflixMaroon,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      isObscure = !isObscure;
                                    },
                                    icon: Icon(isObscure
                                        ? Icons.lock_open
                                        : Icons.lock),
                                  ),
                                  labelText: "Password",
                                  labelStyle: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: netflixMaroon,
                                  ),
                                  hintText: "Enter your password",
                                  hintStyle: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: 18,
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: netflixMaroon),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25)),
                                  )),
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: isObscure,
                              autofocus: true,
                            ),
                            SizedBox(height: 8),
                            if (haveAccount == false)
                              TextFormField(
                                style: TextStyle(color: netflixWhite),
                                cursorColor: netflixMaroon,
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        isObscure = !isObscure;
                                      },
                                      icon: Icon(isObscure
                                          ? Icons.lock_open
                                          : Icons.lock),
                                    ),
                                    labelText: "Confirm Password",
                                    labelStyle: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      color: netflixMaroon,
                                    ),
                                    hintText: "Confirm your password",
                                    hintStyle: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 18,
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: netflixMaroon),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(25)),
                                    )),
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: isObscure,
                                autofocus: true,
                              ),
                            SizedBox(
                              height: 15,
                            ),
                            RaisedButton(
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage(
                                          key: PageStorageKey('homePage'),
                                          isDarkMode: isDarkMode,
                                        )),
                                        (route) => false);
                              },
                              color: netflixMaroon,
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25))),
                              child: Text(
                                haveAccount ? "LOGIN" : "SIGN UP",
                                style: TextStyle(
                                    color: netflixWhite, fontSize: 18),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                haveAccount = !haveAccount;
                              },
                              child: Text(
                                haveAccount ? 'Create new account' : 'Already have an account?',
                                style: TextStyle(
                                    color: netflixMaroon, fontSize: 16),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ui

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'dart:ui' as ui;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fyp_project/mechanisms_list.dart';

//screens

//services

class LoginPage extends StatefulWidget {
  // final Function changeView;
  LoginPage();

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPassword = false; //for password state maintenance
  String _email = '';
  String _password = '';
  String error = '';
  final _formKey = GlobalKey<FormState>();
  // final _auth = Authorization();

  //back button to go to previous context
  // var back_button = new Container(
  //   padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
  //   alignment: Alignment.centerLeft,
  //   child:
  //       // Adobe XD layer: 'back_shape' (shape)
  //       SvgPicture.string(
  //     arrow_back.Arrow_shape,
  //     allowDrawingOutsideViewBox: true,
  //   ),
  // );
  //login label displayed
  var login_text = SizedBox(
    child: Text(
      'Login',
      style: TextStyle(
        fontFamily: 'Segoe UI',
        fontSize: 30,
        color: const Color(0xff323232),
      ),
      textAlign: TextAlign.left,
    ),
  );

  //Wrapping up in Scaffold
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // resizeToAvoidBottomPadding: false,
      body: Builder(builder: (BuildContext context) {
        return Center(
          child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(36.0, 36.0, 36.0, 36.0),
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          // GestureDetector(
                          //   onTap: () {
                          //     setState(() {
                          //       widget.changeView();
                          //     });
                          //   },
                          //   child: back_button,
                          // ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
                            // child:
                            //     // Adobe XD layer: 'Login' (text)
                            //     login_text
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Mechanisms Visualizer",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Segoe UI',
                                fontSize: 32,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Center(
                            child: Image.asset(
                              'assets/ackerman_3dnobg.png',
                              width: 200,
                              height: 200,
                              fit: BoxFit.contain,
                            ),
                          ),

                          SizedBox(height: 10),
                          // Text(
                          //   'Email',
                          //   style: TextStyle(
                          //     fontFamily: 'Segoe UI',
                          //     fontSize: 14,
                          //     color: const Color(0xffa6a6a6),
                          //   ),
                          //   textAlign: TextAlign.left,
                          // ),
                          // TextFormField(
                          //   obscureText: false,
                          //   validator: (value) =>
                          //       value.isEmpty ? 'Enter your email' : null,
                          //   onChanged: (val) {
                          //     setState(() {
                          //       _email = val;
                          //     });
                          //   },
                          //   keyboardType: TextInputType.emailAddress,
                          //   decoration: InputDecoration(
                          //     labelText: 'Email',
                          //     labelStyle: TextStyle(
                          //         color: Colors.grey,
                          //         fontSize: 16,
                          //         fontWeight: FontWeight.w500),
                          //   ),
                          //   textAlign: TextAlign.left,
                          // ),
                          // SizedBox(
                          //   height: 10.0,
                          // ),
                          // // Text(
                          // //   'Password',
                          // //   style: TextStyle(
                          // //     fontFamily: 'Segoe UI',
                          // //     fontSize: 14,
                          // //     color: const Color(0xffa6a6a6),
                          // //   ),
                          // //   textAlign: TextAlign.left,
                          // // ),
                          // TextFormField(
                          //   obscureText: !this._showPassword,
                          //   validator: (value) =>
                          //       value.isEmpty ? 'Enter your password' : null,
                          //   onChanged: (value) {
                          //     setState(() {
                          //       _password = value;
                          //     });
                          //   },
                          //   decoration: InputDecoration(
                          //     labelText: 'Password',
                          //     labelStyle: TextStyle(
                          //         color: Colors.grey,
                          //         fontSize: 16,
                          //         fontWeight: FontWeight.w500),
                          //     suffixIcon: IconButton(
                          //       icon: Icon(
                          //         Icons.remove_red_eye,
                          //         color: this._showPassword
                          //             ? Colors.blue
                          //             : Colors.grey,
                          //       ),
                          //       onPressed: () {
                          //         setState(() =>
                          //             this._showPassword = !this._showPassword);
                          //       },
                          //     ),
                          //   ),
                          //   textAlign: TextAlign.left,
                          // ),
                          // SizedBox(
                          //   height: 50.0,
                          // ),

                          // SizedBox(
                          //   height: 30.0,
                          // ),
                          // SizedBox(
                          //   width: MediaQuery.of(context).size.width,
                          //   child: Padding(
                          //     padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          //     child: GestureDetector(
                          //       // onTap: () {
                          //       //   Navigator.of(context).push(new MaterialPageRoute(
                          //       //       builder: (context) => ResetPasswordPage()));
                          //       // },
                          //       child: Text.rich(
                          //         TextSpan(
                          //           style: TextStyle(
                          //             fontFamily: 'Segoe UI',
                          //             fontSize: 14,
                          //             color: const Color(0xffa3a3a3),
                          //           ),
                          //           children: [
                          //             TextSpan(
                          //               text: 'Forgot Password ? ',
                          //               // recognizer: new TapGestureRecognizer()
                          //               // ..onTap = () => ResetPasswordPage(),
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          SizedBox(
                            height: 50,
                          ),
                          Container(
                            height: 50.0,
                            width: double.maxFinite,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                side: BorderSide(color: Colors.blueAccent),
                              ),
                              // onPressed: () async {
                              //   dynamic user = await _auth.googleSignIn();
                              //   if (user == null) {
                              //     _toastSnackBar(context, 'something went wrong');

                              //   } else {
                              //     SchedulerBinding.instance
                              //         .addPostFrameCallback((_) async {
                              //       Navigator.pushNamedAndRemoveUntil(context, '/',
                              //           (Route<dynamic> route) => false);
                              //     });
                              //   }
                              // },
                              padding: EdgeInsets.all(0.0),
                              child: Ink(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  gradient: LinearGradient(
                                    colors: [Colors.white, Colors.white],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                ),
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Icon(
                                        FontAwesomeIcons.google,
                                        color: Colors.red[300],
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Continue with Google",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'Segoe UI',
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Container(
                            height: 50.0,
                            width: double.maxFinite,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(
                                    // MaterialPageRoute(builder: (BuildContext context) => ARScene(nameModel: modelNames[index] ?? 'glasses11.sfb',))
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            MechanismsList()));
                              },
                              padding: EdgeInsets.all(0.0),
                              child: Ink(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xff667eea),
                                      Color(0xff64b6ff)
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                ),
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Skip Login",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Segoe UI',
                                      fontSize: 16,
                                      color: const Color(0xffffffff),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          // FacebookSignInButton(
                          //   onPressed: () async {
                          //     dynamic user = await _auth.facebookSignin();
                          //     if (user == null) {
                          //         _toastSnackBar(context, 'something went wrong');

                          //       } else {
                          //         SchedulerBinding.instance
                          //             .addPostFrameCallback((_) async {
                          //           Navigator.pushAndRemoveUntil(context,
                          //           MaterialPageRoute(builder: (context) => Wrapper()),
                          //               (Route<dynamic> route) => false);
                          //         });
                          //       }
                          //   },
                          //   borderRadius: 28.0, //parameter type double not borderRadius
                          //   text: 'Continue with Facebook',
                          //   textStyle: TextStyle(
                          //                 fontFamily: 'Segoe UI',
                          //                 fontSize: 16,
                          //                 color: Colors.white,
                          //                 fontWeight: FontWeight.w600,
                          //               ),
                          // ),
                          SizedBox(
                            height: 50.0,
                          ),
                          // SizedBox(
                          //   width: MediaQuery.of(context).size.width,
                          //   child: GestureDetector(
                          //     onTap: () {
                          //       //navigate to register page or any other page, for this ->
                          //       //added a recognizer field in the textSpan widget with text 'Sign up' in bold
                          //     },
                          //     child: Text.rich(
                          //       TextSpan(
                          //         style: TextStyle(
                          //           fontFamily: 'Segoe UI',
                          //           fontSize: 14,
                          //           color: const Color(0xffa3a3a3),
                          //         ),
                          //         children: [
                          //           TextSpan(
                          //             text: 'Don’t have an acount ? ',
                          //           ),
                          //           TextSpan(
                          //             text: '  ',
                          //             style: TextStyle(
                          //               color: const Color(0xff404040),
                          //             ),
                          //           ),
                          //           TextSpan(
                          //             text: 'Sign Up',
                          //             style: TextStyle(
                          //               color: const Color(0xff3c3c3c),
                          //             ),
                          // //             recognizer: new TapGestureRecognizer()
                          // //               ..onTap = () => Navigator.of(context).push(
                          // // new MaterialPageRoute(builder: (context) => RegisterPage())),
                          //           ),
                          //         ],
                          //       ),
                          //       textAlign: TextAlign.center,
                          //     ),
                          //   ),
                          // ),

                          SizedBox(
                            height: 200.0,
                          ),

                          SizedBox(
                            width: 240.0,
                            child: GestureDetector(
                              onTap: () {
                                //navigate to register page or any other page, for this ->
                                //added a recognizer field in the textSpan widget with text 'skip sign in'
                              },
                              child: Text.rich(
                                TextSpan(
                                  style: TextStyle(
                                    fontFamily: 'Segoe UI',
                                    fontSize: 14,
                                    color: const Color(0xffa3a3a3),
                                  ),
                                  children: [
                                    TextSpan(
                                      text:
                                          "Input parameters and view in 3D the different mechanisms",
                                      // recognizer: new TapGestureRecognizer()
                                      //     ..onTap = () async {
                                      //       dynamic user = await _auth.anonSignIn();
                                      //       _toastSnackBar(
                                      //           context, "something went wrong");
                                      //       if (user == null) {
                                      //         setState(() {
                                      //           error = "something went wrong";
                                      //         });
                                      //       } else {
                                      //         Navigator.pushAndRemoveUntil(context,
                                      // MaterialPageRoute(builder: (context) => Wrapper()),
                                      //             (Route<dynamic> route) => false);
                                      //       }
                                      //     },
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          SizedBox(
                              height: 60,
                              child: Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Center(
                                      child: Text(
                                    error,
                                    style: const TextStyle(
                                        color: Colors.red, fontSize: 14),
                                  )))),
                        ],
                      ),
                    ),
                  ))),
        );
      }),
    );
  }

  void _toastSnackBar(BuildContext context, String message) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }
}

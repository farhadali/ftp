import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import "package:http/http.dart" as http;
import 'package:flutter/cupertino.dart';
import '../../models/user.dart';
import '../../userPreferances/user_preferences.dart';

import '../../constrant/api_connection.dart';
import '../../screens/authentication/register_screen.dart';
import '../../screens/main_home_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Text Editing Controller
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    setState(() {
      //userLoginNow();
    });
    super.initState();
  }

  userLoginNow() async {
    try {
      var res = await http.post(
        Uri.parse(API.apiLogin),
        body: {
          'email': emailController.text.trim(),
          'password': passwordController.text.trim(),
        },
      );
      if (res.statusCode == 200) {
        Map<String, dynamic> resBody = json.decode(res.body);

        print(resBody);

        User userInfo = User.fromJson(resBody["user"]);

        await RememberUserPrefs.storeUserInfo(userInfo);
        Fluttertoast.showToast(
          msg: resBody['message'].toString(),
          fontSize: 16.0,
        );
        Future.delayed(
          const Duration(
            milliseconds: 2000,
          ),
        );
        Navigator.of(context).pushReplacement(
          CupertinoPageRoute(
            builder: (ctx) => const MainHomePage(),
          ),
        );
      }
    } catch (errorMsg) {
      //if (kDebugMode) {
      print(errorMsg.toString());
      //}
      Fluttertoast.showToast(msg: errorMsg.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Some Space
                Image(
                  image: AssetImage('images/app_logo.png'),
                  width: 250,
                ),
                //Logo section
                const Icon(
                  Icons.lock,
                  size: 80,
                ),

                //Welcome back Message
                const Text(
                  "Welcome Back, you've been missed",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                //Some Spaces
                const SizedBox(
                  height: 25,
                ),
                Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter valid Email';
                            }
                            return null;
                          },
                          controller: emailController,
                          obscureText: false,
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            fillColor: Colors.grey.shade200,
                            filled: true,
                            hintText: "Email",
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter password';
                            }
                            return null;
                          },
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            fillColor: Colors.grey.shade200,
                            filled: true,
                            hintText: "Password",
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Material(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(30),
                          child: InkWell(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                userLoginNow();
                              }
                            },
                            borderRadius: BorderRadius.circular(30),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 28,
                              ),
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
                //password textfield

                //sign in button
                const SizedBox(
                  height: 20,
                ),
                //go to register page
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a Member ?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          CupertinoPageRoute(
                            builder: (ctx) => const RegisterScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Register Now",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../screens/authentication/login_screen.dart';
import '../../screens/main_home_page.dart';

import '../userPreferances/user_preferences.dart';

class GetAppBar extends StatefulWidget {
  @override
  _GetAppBarState createState() => _GetAppBarState();
}

class _GetAppBarState extends State<GetAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Saif Dashboard"),
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
            CupertinoPageRoute(
              builder: (ctx) => const MainHomePage(),
            ),
          );
        },
        icon: const Icon(Icons.home),
      ),
      backgroundColor: Colors.grey[200],
      actions: [
        PopupMenuButton(
          itemBuilder: (context) {
            return [
              const PopupMenuItem<int>(
                value: 1,
                child: Text("Dashboard"),
              ),
              const PopupMenuItem<int>(
                value: 3,
                child: Text("Profile"),
              ),
              const PopupMenuItem<int>(
                value: 2,
                child: Text("Logout"),
              ),
            ];
          },
          onSelected: (value) {
            if (value == 1) {
              Navigator.of(context).pushReplacement(
                CupertinoPageRoute(
                  builder: (ctx) => const MainHomePage(),
                ),
              );
            } else if (value == 2) {
              //Logout Button Action
              Fluttertoast.showToast(msg: "Log out Successfully");
              RememberUserPrefs.removeUserInfo().then((value) {
                Navigator.of(context).pushReplacement(
                  CupertinoPageRoute(
                    builder: (ctx) => const LoginScreen(),
                  ),
                );
              });
            } else if (value == 2) {
              //Logout Button Action
              Fluttertoast.showToast(msg: "Log out Successfully");
              RememberUserPrefs.removeUserInfo().then((value) {
                Navigator.of(context).pushReplacement(
                  CupertinoPageRoute(
                    builder: (ctx) => const LoginScreen(),
                  ),
                );
              });
            }
          },
        ),
      ],
    );
  }
}

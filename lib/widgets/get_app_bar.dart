import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ftp/screens/main_home_page.dart';
import 'package:get/get.dart';

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
        onPressed: () {},
        icon: Icon(Icons.home),
      ),
      backgroundColor: Colors.redAccent,
      actions: [
        PopupMenuButton(
          itemBuilder: (context) {
            return [
              const PopupMenuItem<int>(
                value: 1,
                child: Text("Dashboard"),
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
            }
          },
        ),
      ],
    );
  }
}

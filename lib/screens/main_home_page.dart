import 'package:flutter/material.dart';
import 'package:ftp/widgets/get_app_bar.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: GetAppBar(),
      ),
      body: Text(
        "main home page after login",
      ),
      bottomNavigationBar: (AboutDialog()),
    );
  }
}

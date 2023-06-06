import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTrap;
  final buttonText;

  const MyButton({
    super.key,
    required this.onTrap,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          buttonText,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

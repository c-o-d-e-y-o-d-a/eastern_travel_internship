import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;

  const MyButton({Key? key, this.onTap, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue, // Adjust color to your preference
          borderRadius: BorderRadius.circular(8), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Shadow color
              spreadRadius: 2, // Spread radius
              blurRadius: 5, // Blur radius
              offset: Offset(0, 3), // Shadow offset
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(
            vertical: 16, horizontal: 24), // Padding around text
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white, // Text color
              fontSize: 16, // Text size
              fontWeight: FontWeight.bold, // Text weight
            ),
          ),
        ),
      ),
    );
  }
}

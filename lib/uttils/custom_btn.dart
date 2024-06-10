import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? icon;
  final Color buttonColor;
  final Color textColor;
  final double buttonWidth; // Added buttonWidth property

  CustomButton({
    required this.text,
    required this.onPressed,
    this.icon,
    this.buttonColor = const Color.fromARGB(255, 0, 48, 96),
    this.textColor = Colors.white,
    this.buttonWidth = double.infinity, // Set default value
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        child: Container(
          height: height * 0.07,
          width: buttonWidth, // Use buttonWidth here
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(18.0),
            boxShadow: [],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  color: textColor,
                ),
                SizedBox(width: 8.0),
              ],
              Center(
                child: Text(
                  text,
                  style: TextStyle(
                    color: textColor,
                    fontSize: MediaQuery.of(context).size.width * 0.018,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ObsidianButton extends StatelessWidget {
  final Function()? onTap;

  const ObsidianButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Color(0xFF000113),
          borderRadius: BorderRadius.circular(4),
        ),
        child: const Center(
          child: Text(
            'Log In',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              height: 1.43,
            ),
          ),
        ),
      ),
    );
  }
}

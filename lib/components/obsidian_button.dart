import 'package:flutter/material.dart';

class ObsidianButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final Color color;

  const ObsidianButton({
    super.key,
    required this.onTap,
    required this.text,
    this.color = const Color(0xFF000113),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
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

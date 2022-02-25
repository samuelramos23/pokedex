import 'package:flutter/material.dart';

class TypeWidget extends StatelessWidget {
  const TypeWidget({Key? key, required this.name, this.firstScreen = true})
      : super(key: key);
  final String name;
  final bool firstScreen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: firstScreen
              ? const EdgeInsets.all(6)
              : const EdgeInsets.only(left: 15, top: 6, right: 15, bottom: 6),
          child: Text(
            name,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: firstScreen ? 12 : 15),
          ),
        ),
      ),
    );
  }
}

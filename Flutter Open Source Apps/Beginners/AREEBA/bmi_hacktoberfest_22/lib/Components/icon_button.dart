import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  final IconData icons;
  final VoidCallback onPressed;

  const RoundedIconButton({required this.icons, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 6.0,
      fillColor: Colors.white,
      shape: const CircleBorder(),
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      child: Icon(
        icons,
        color: const Color(0xFF111820),
      ),
    );
  }
}

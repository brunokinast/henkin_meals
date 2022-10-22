import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  final Icon icon;
  final String text;

  const IconText(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        const SizedBox(width: 10),
        Text(text),
      ],
    );
  }
}

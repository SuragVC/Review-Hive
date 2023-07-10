import 'package:flutter/material.dart';

class Dividers extends StatelessWidget {
  final double thicknes;
  final Color color;
  final bool horizontal;
  final double? width;
  const Dividers.vertical(
      {super.key,
      required this.thicknes,
      required this.color,
      required this.width,
      this.horizontal = false});

  const Dividers.horizontal(
      {super.key,
      required this.thicknes,
      required this.color,
      this.width,
      this.horizontal = true});

  @override
  Widget build(BuildContext context) {
    if (horizontal) {
      return Container(
        color: color,
        width: MediaQuery.of(context).size.width,
        height: thicknes,
      );
    } else {
      return Container(
        color: color,
        width: width,
        height: thicknes,
      );
    }
  }
}

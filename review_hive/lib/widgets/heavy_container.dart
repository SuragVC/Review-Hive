import 'package:flutter/material.dart';

Widget heavyContainer({
  required BuildContext context,
  required String textValue,
}) {
  return Container(
    padding: const EdgeInsets.all(20),
    height: 150,
    width: MediaQuery.of(context).size.width,
    child: SizedBox(
      child: Text(textValue,
          style: const TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          )),
    ),
  );
}

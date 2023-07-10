import 'package:flutter/material.dart';

Widget blueButton({
  required BuildContext context,
  required String textValue,
  required Function()? onPressed,
}) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 80,
    padding: const EdgeInsets.all(15),
    child: ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
      ),
      child: Text(
        textValue,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  );
}

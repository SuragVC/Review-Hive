import 'package:flutter/material.dart';

showMessage(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        clipBehavior: Clip.antiAlias,
        backgroundColor: const Color.fromARGB(132, 22, 34, 255),
        title: const Center(
          child: Text(
            "Oops!",
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        ),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Close"),
          )
        ],
      );
    },
  );
}

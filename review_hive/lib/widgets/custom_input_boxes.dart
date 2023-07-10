import 'package:flutter/material.dart';

class CustomInputBox extends StatefulWidget {
  final bool number;
  final String? hintText;
  final IconData? iconValue;
  final TextEditingController controller;

  const CustomInputBox.number(
      {super.key,
      this.number = true,
      required this.hintText,
      required this.iconValue,
      required this.controller});
  const CustomInputBox.text(
      {super.key,
      this.number = false,
      required this.hintText,
      required this.iconValue,
      required this.controller});
  @override
  State<CustomInputBox> createState() => _CustomInputBoxState();
}

class _CustomInputBoxState extends State<CustomInputBox> {
  TextInputType keyboardType() {
    if (widget.number) {
      return TextInputType.number;
    } else {
      return TextInputType.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 60,
      child: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: TextField(
            controller: widget.controller,
            keyboardAppearance: Brightness.dark,
            keyboardType: keyboardType(),
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusColor: const Color.fromARGB(108, 62, 62, 88),
              icon: Icon(
                widget.iconValue,
                color: Colors.white,
              ),
              hintText: widget.hintText,
              hintStyle: const TextStyle(
                color: Colors.white,
              ),
              contentPadding: const EdgeInsets.all(15),
              filled: true,
              fillColor: const Color.fromARGB(108, 62, 62, 88),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

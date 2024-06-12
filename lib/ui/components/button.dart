import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IPrimaryButton extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const IPrimaryButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: Text(text));
  }
}

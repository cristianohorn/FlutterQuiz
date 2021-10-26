import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  const Answer({Key? key, required this.content, required this.score, this.onPressed})
      : super(key: key);

  final String content;
  final String score;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(content),
        ));
  }
}

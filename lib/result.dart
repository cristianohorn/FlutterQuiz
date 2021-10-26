import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({Key? key, required this.totalScore, required this.reset})
      : super(key: key);

  final int totalScore;
  final void Function() reset;

  String get resultText {
    if (totalScore < 8) {
      return 'Parabéns!';
    } else if (totalScore < 15) {
      return 'Muito bom!';
    } else {
      return 'Excelente!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            resultText,
            style: const TextStyle(fontSize: 28),
          ),
        ),
        ElevatedButton(onPressed: reset, child: const Text('Reiniciar'))
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'answer.dart';
import 'question.dart';

class Questionary extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int selectedQuestion;
  final void Function(int) onPressed;

  Questionary({
    required this.questions,
    required this.selectedQuestion,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    var hasQuestionSelected = selectedQuestion < questions.length;

    final List<Map<String, Object>> respostas = hasQuestionSelected
        ? questions[selectedQuestion].cast()['respostas']
        : [];
    return Column(
      children: [
        Question(question: questions[selectedQuestion]['texto'].toString()),
        ...respostas
            .map((x) => Answer(
                content: x['texto'].toString(),
                score: x['nota'].toString(),
                onPressed: () =>
                    onPressed(int.parse(x['pontuacao'].toString()))))
            .toList(),
      ],
    );
  }
}

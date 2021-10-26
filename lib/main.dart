import 'package:flutter/material.dart';
import 'questionary.dart';
import 'result.dart';

void main() => runApp(FlutterQuizApp());

class _FlutterQuizAppState extends State<FlutterQuizApp> {
  var _selectedQuestion = 0;
  var _totalScore = 0;
  final _questions = const [
    {
      'texto': 'Qual é a sua comida favorita?',
      'respostas': [
        {'texto': 'Pizza', 'pontuacao': 1},
        {'texto': 'Churrasco', 'pontuacao': 4},
        {'texto': 'Lasanha', 'pontuacao': 7},
        {'texto': 'Strogonoff', 'pontuacao': 10},
      ]
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Cachorro', 'pontuacao': 2},
        {'texto': 'Gato', 'pontuacao': 4},
        {'texto': 'Quero-quero', 'pontuacao': 7},
        {'texto': 'Ornitorrinco', 'pontuacao': 10},
      ]
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': [
        {'texto': 'Maria', 'pontuacao': 3},
        {'texto': 'João', 'pontuacao': 4},
        {'texto': 'Léo', 'pontuacao': 7},
        {'texto': 'Pedro', 'pontuacao': 10}
      ]
    }
  ];
  void _onAnswer(int score) {
    if (hasQuestionSelected) {
      setState(() {
        _selectedQuestion++;
        _totalScore += score;
      });
    }
  }

  void _reset() {
    setState(() {
      _selectedQuestion = 0;
      _totalScore = 0;
    });
  }

  bool get hasQuestionSelected {
    return _selectedQuestion < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Quiz"),
        ),
        body: hasQuestionSelected
            ? Questionary(
                questions: _questions,
                selectedQuestion: _selectedQuestion,
                onPressed: _onAnswer,
              )
            : Result(totalScore: _totalScore, reset: _reset),
      ),
    );
  }
}

class FlutterQuizApp extends StatefulWidget {
  @override
  _FlutterQuizAppState createState() {
    return _FlutterQuizAppState();
  }
}

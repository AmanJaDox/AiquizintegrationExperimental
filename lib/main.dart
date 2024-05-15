import "package:flutter/material.dart";
import "package:hexcolor/hexcolor.dart";
import './quiz.dart';
import './result.dart';
import 'intro.dart';
import 'package:http/http.dart' as https;
import 'dart:convert';

class QuizData extends StatefulWidget {
  const QuizData({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _QuizDataState();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      home: IntroPage(), // Use IntroScreen as the home screen
    );
  }
}

void main() {
  runApp(MyApp());
}


class _QuizDataState extends State<QuizData>{
  static const _data = [
    {
      'questionText':
          'What is the primary goal of computer science?"',
      'answers': [
        {'text': 'to design user-friendly interfaces"', 'score': 0.00},
        {'text': 'to create efficient algorithms"', 'score': 0.00},
        {'text': 'to develop new technologies', 'score': 0.00},
        {'text': 'to understand the fundamental principles of computing', 'score': 10.00},
      ]
    },
    {
      'questionText':
          'What is the difference between a computer scientist and a software engineer?',
      'answers': [
        {'text': 'a computer scientist focuses on the theoretical aspects of computing, while a software engineer focuses on the practical applications', 'score': 10.00},
        {'text': 'a computer scientist develops new algorithms, while a software engineer writes code', 'score': 0.00},
        {'text': 'a computer scientist studies the behavior of computers, while a software engineer uses them', 'score': 0.00},
        {'text': 'a computer scientist designs computer systems, while a software engineer tests them', 'score': 0.00},
      ]
    },
    {
      'questionText': 'What is the purpose of a computers processor?',
      'answers': [
        {'text': 'to store data', 'score': 0.00},
        {'text': 'to execute instructions', 'score': 10.00},
        {'text': 'to display graphics', 'score': 0.00},
        {'text': 'to connect to the internet', 'score': 0.00}
      ]
    },
    {
      'questionText': 'What is the difference between a hardware and a software failure?',
      'answers': [
        {'text': 'a hardware failure is permanent, while a software failure can be fixed with a patch or update', 'score': 0.00},
        {'text': 'a hardware failure affects the entire system, while a software failure only affects a specific part of it', 'score': 10.00},
        {'text': 'a hardware failure occurs when a component fails, while a software failure occurs when there is an error in the code', 'score': 0.00},
        {'text': 'a hardware failure can be caused by a power surge, while a software failure can be caused by a virus', 'score': 0.00}
      ]
    },
    {
      'questionText': 'What is the purpose of a computers memory?',
      'answers': [
        {'text': 'to store data temporarily', 'score': 10.00},
        {'text': 'to execute instructions', 'score': 0.00},
        {'text': 'to display graphics', 'score': 0.00},
        {'text': 'to connect to the internet', 'score': 0.00}
      ]
    }
  ];

  var _indexQuestion = 0;
  double _totalScore = 0.00;

  void _answerQuestion(double score) {
    _totalScore += score;

    setState(() {
      _indexQuestion += 1;
    });
  }

  void _restart() {
    setState(() {
      _indexQuestion = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Color.fromARGB(255, 90, 90, 90),
          appBar: AppBar(
            title: Align(
              alignment: Alignment.center,
              child: Text(
                "QuizotAE",
                style: TextStyle(
                  color: HexColor("#F5FFF0"),
                ),
              ),
            ),
            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          ),
          body: Align(
              alignment: Alignment.center,
              child: (_indexQuestion <= 4 && _indexQuestion >= 0)
                  ? Quiz(
                      answerQuestion: _answerQuestion,
                      indexQuestion: _indexQuestion,
                      data: _data)
                  : Result(_totalScore, _restart))),
    );
  }
}

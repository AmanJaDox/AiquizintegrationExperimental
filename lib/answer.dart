import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;

  const Answer(this.selectHandler, this.answerText, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: SizedBox(
        width: 200,
        child: Text(
          answerText,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 255, 37, 37))),
      onPressed: selectHandler,
    );
  }
}
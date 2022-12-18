import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;

  const Answer(this.selectHandler, this.answerText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          // side: const BorderSide(color: Colors.orange),
        ),
        // style: ButtonStyle(
        //   backgroundColor: MaterialStateProperty.all(
        //     Colors.blue,
        //   ),
        //   foregroundColor: MaterialStateProperty.all(
        //     Colors.white,
        //   ),
        // ),
        onPressed: selectHandler,
        child: Text(answerText),
      ),
    );
  }
}

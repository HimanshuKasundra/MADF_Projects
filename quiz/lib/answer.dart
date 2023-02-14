import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;
  // ignore: type_init_formals
  const Answer(this.selectHandler, String this.answerText, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: const StadiumBorder(),
        ),
        onPressed: selectHandler,
        child: Text(answerText),
      ),
    );
  }
}

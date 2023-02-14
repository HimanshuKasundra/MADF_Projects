import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  const Result(this.resultScore, this.resetHandler, {super.key});

  String get resultPharse {
    var resultText = "You Did It!!!";
    if (resultScore <= 10) {
      resultText = "Not Bad !! Keep Improwing";
    } else if (resultScore <= 20) {
      resultText = "Good !! Imporove Little More";
    } else if (resultScore <= 30) {
      resultText = "Great !! You Are Awsome!! ";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.fromLTRB(0, 250, 0, 100),
            child: Text(
              resultPharse,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w800),
              textAlign: TextAlign.center,
            ),
          ),
          TextButton(
              style: TextButton.styleFrom(
                  textStyle: const TextStyle(color: Colors.black)),
              onPressed: resetHandler,
              // ignore: prefer_const_constructors
              child: Text("Restart Quiz",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                  )))
        ],
      ),
    );
  }
}


// style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
//             textAlign: TextAlign.center,
//           )
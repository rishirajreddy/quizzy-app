import 'package:flutter/material.dart';
import 'quizbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();
void main() {
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            'Quizzy-Game',
            style: TextStyle(
                fontFamily: 'SourceSansPro', fontWeight: FontWeight.bold),
          )),
          backgroundColor: Colors.grey,
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(100))),
        ),
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];

  void checkAnswer(bool userAnswer) {
    bool correctAnswer = quizBrain.getAnswers();
    setState(() {
      if (quizBrain.isFinished() == true) {
        Alert(
          context: context,
          type: AlertType.success,
          title: "Finished Buddy",
          desc: "You\'ve reached the end of the quiz.",
          buttons: [
            DialogButton(
              child: Text(
                "Play Again",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();

        quizBrain.reset();
        scoreKeeper = [];
      } else {
        if (correctAnswer == userAnswer) {
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
          quizBrain.scoreCounter();
        } else {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                quizBrain.getScore(),
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                    fontSize: 15),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                quizBrain.getQuestionCount(),
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                    fontSize: 15),
              )
            ],
          ),
        ),
        Expanded(
          //Questions
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionBank(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontFamily: 'SourceSansPro'),
              ),
            ),
          ),
        ),
        Expanded(
          //True Button
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  primary: Colors.white,
                  onSurface: Colors.grey,
                  elevation: 5,
                  shadowColor: Colors.white,
                  side: BorderSide(color: Colors.white, width: 2)),
              onPressed: () {
                checkAnswer(true);
                quizBrain.checkQuestionCount();
              },
              child: Text(
                'True',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Expanded(
          //False Button
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                  primary: Colors.white,
                  onSurface: Colors.grey,
                  elevation: 5,
                  shadowColor: Colors.white,
                  side: BorderSide(color: Colors.white)),
              onPressed: () {
                checkAnswer(false);
                quizBrain.checkQuestionCount();
              },
              child: Text(
                'False',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ),
        ),
        Row(
          //Checks and Cross
          children: scoreKeeper,
        )
      ],
    );
  }
}

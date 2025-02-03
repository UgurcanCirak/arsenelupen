import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutterproject/quiz_brain.dart';
import 'package:flutterproject/question.dart';

class ArseneLupinQuizPage extends StatefulWidget {
  @override
  _ArseneLupinQuizPageState createState() => _ArseneLupinQuizPageState();
}

class _ArseneLupinQuizPageState extends State<ArseneLupinQuizPage> {
  List<Widget> scoreKeeper = [];
  QuizBrain quizBrain = QuizBrain();

  @override
  void initState() {
    super.initState();


    ArseneLupinStory1 story1 = ArseneLupinStory1();
    ArseneLupinStory2 story2 = ArseneLupinStory2();
    quizBrain.setQuestions([...story1.questions, ...story2.questions]);
  }

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();

    setState(() {
      if (quizBrain.isFinished()) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the Arsène Lupin quiz.',
        ).show();

        quizBrain.reset();
        scoreKeeper = [];
      } else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(
            Icon(Icons.check, color: Colors.green, size: 18.0),
          );
        } else {
          scoreKeeper.add(
            Icon(Icons.close, color: Colors.red, size: 18.0),
          );
        }
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        title: Text('Arsène Lupin Quiz',
          style: TextStyle(
            color: Colors.white
          ),),
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  quizBrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(14.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.lightGreenAccent.shade700,
                  textStyle: TextStyle(fontSize: 18.0),
                ),
                onPressed: () {
                  checkAnswer(true);
                },
                child: Text('True'),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(14.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red.shade700,
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(fontSize: 18.0),
                ),
                onPressed: () {
                  checkAnswer(false);
                },
                child: Text('False'),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: scoreKeeper,
            ),
          ),
        ],
      ),
    );
  }
}

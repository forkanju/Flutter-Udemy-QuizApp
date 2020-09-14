import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/model/questions.dart';
// import 'package:quiz_app/util/hexcolor.dart';

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {

  int _currentQuestionIndex = 0;

  List questionBank = [
    Question.name(
        "The U.S. Declaration of Independence was adopted in 1776.", true),
    Question.name("Elephants walk as quietly as cats.", true),
    Question.name(
        "Elvis Presley's 'Hound Dog' (1956) catapulted rock music into mainstream culture worldwide.",
        false),
    Question.name("Coca-Cola originally contained cocaine.", true),
    Question.name(
        "Marathon was the name of a Greek messenger who ran cross country to report news of Persia's defeat in 490 BC.",
        false),
    Question.name(
        "Steak ordered 'au poivre' comes topped with chive butter.", false),
    Question.name(
        "Judaism, Christianity, and Islam can all be tied to the same individual.",
        true),
    Question.name(
        "The launch of Sputnik in 1957 inaugurated the space age", true),
    Question.name(
        "The first big Hollywood 'summer blockbuster' was Jaws.", true),
    Question.name(
        "The biceps muscle in the upper arm is the strongest muscle in the human body.",
        false),
    Question.name(
        "The 'Ring of Fire' - where most volcanoes are located and most earthquakes occur - encircles the Pacific Ocean.",
        true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("True Citizen"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.blueGrey,

      //We use [Builder] here to use a [context] that is a descendant of [Scaffold]
      //or else [Scaffold.of] will return null.
      body: Builder(
        builder: (BuildContext context) => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Image.asset(
                  "images/flag.png",
                  width: 250,
                  height: 180,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(14.5),
                      border: Border.all(
                          color: Colors.blueGrey.shade400,
                          style: BorderStyle.solid)),
                  height: 120.0,
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      questionBank[_currentQuestionIndex].questionText,
                      style: TextStyle(fontSize: 14.9, color: Colors.white),
                    ),
                  )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () => _checkAnswer(true, context),
                    color: Colors.blueGrey.shade900,
                    child: Text(
                      "TRUE",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => _checkAnswer(false, context),
                    color: Colors.blueGrey.shade900,
                    child: Text(
                      "FALSE",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => _nextQuestion(),
                    color: Colors.blueGrey.shade900,
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _checkAnswer(bool userChoice, BuildContext context) {
    if(userChoice == questionBank[_currentQuestionIndex].isCorrect){
      //Correct answer
       final snackbar = SnackBar(
         backgroundColor: Colors.green,
         duration: Duration(milliseconds: 500),
         content: Text("Correct!"),);
       Scaffold.of(context).showSnackBar(snackbar);

      debugPrint("Yes Correct!");

    }else{
      //Incorrect answer
      final snackbar = SnackBar(
        backgroundColor: Colors.redAccent,
        duration: Duration(milliseconds: 500),
        content: Text("Incorrect!"),);
      Scaffold.of(context).showSnackBar(snackbar);

      debugPrint("Incorrect!");

    }

  }

  _nextQuestion(){
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
    });

  }
}

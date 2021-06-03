import 'package:flutter/material.dart';
import 'package:quiz_app/model/question.dart';

class QuizApp extends StatefulWidget {

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _currentQuestionIndex = 0;
  List questionBank = [
    Question.name("Platillo Favorito de El Salvador son las pupusas.", true),
    Question.name("La bandera de El Salvador tiene 8 franjas.", false),
    Question.name("La bandera de El Salvador tiene 3 escudos.", false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('True Quiz'),
          centerTitle: true,
          //backgroundColor: Colors.blueGrey.shade700,
        ),
        //backgroundColor: Colors.blueGrey.shade500,
        body: Builder(
          builder: (BuildContext context) => Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(child: Image.asset("images/flag.png", width: 250, height: 180,)),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(14.4),
                      border: Border.all(
                        color: Colors.blueGrey.shade900,
                        style: BorderStyle.solid
                      )
                    ),
                    height: 120.0,
                    child: Center(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(questionBank[_currentQuestionIndex].questionStatement,
                        // style: TextStyle(
                        //   color: Colors.white,
                        //   fontSize: 17.0
                        // ),
                      ),
                    )
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                        onPressed: () => _prevQuestion(),
                        color: Colors.blue.shade700,
                        child: Icon(Icons.arrow_back, color: Colors.white,)
                    ),
                    RaisedButton(
                        onPressed: () => _checkAnswer(true, context),
                        color: Colors.green.shade700,
                        child: Text('Verdadero',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16
                        ),),
                    ),
                    RaisedButton(
                      onPressed: () => _checkAnswer(false, context),
                      color: Colors.red.shade700,
                      child: Text('Falso',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16
                      ),
                      ),
                    ),
                    RaisedButton(
                      onPressed: () => _nextQuestion(),
                      color: Colors.blue.shade700,
                      child: Icon(Icons.arrow_forward, color: Colors.white,)
                    ),
                  ],
                ),
                Spacer()
              ],
            ),
          ),
        ),
    );
  }
  _checkAnswer(bool userChoice, BuildContext context){
      String message;
      Color changeBannerColor;
      if(userChoice == questionBank[_currentQuestionIndex].isCorrect){
        message = 'Correcto';
        changeBannerColor = Colors.green;
        _updateQuestion();
      }else{
        message = 'Incorrecto';
        changeBannerColor = Colors.red;
        _updateQuestion();
      }
      final snackBar = SnackBar(content: Text(message, style: TextStyle(
          color: Colors.white,
          fontSize: 17,
          fontWeight: FontWeight.bold
        ),
      ), backgroundColor: changeBannerColor, duration: Duration(milliseconds: 1000),);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  _updateQuestion(){
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1 ) % questionBank.length;
    });
  }
  _prevQuestion(){
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex - 1 ) % questionBank.length;
    });
  }
  _nextQuestion(){
   _updateQuestion();
  }
}

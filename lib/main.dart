 import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/models/question.dart';

void main() {
  runApp(MaterialApp(
    title: "Quiz App",
      debugShowCheckedModeBanner: false,
      home:QuizApp()));
}


class QuizApp extends StatefulWidget {



  @override
  _QuizAppState createState() => _QuizAppState();


}

class _QuizAppState extends State<QuizApp> {

int _currentQuestion=0;

  List questions=[Question.name("Our country got indepedence in 1947?", true),Question.name("Mahatma Gandhi is the father  of your nation?", true)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("True Citizen"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        elevation: 9.0,
      ),
      backgroundColor: Colors.blueGrey,
      body: Builder(
        builder:(BuildContext context )=> Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Image.asset("images/indian Flag.png",height: 180,width: 250,)),
Container(
  height: 120,
decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(15.0),
  color: Colors.transparent,
  border: Border.all(style: BorderStyle.solid,width: 1.5)

),
  padding: EdgeInsets.all( 50),
  child: Text(questions[_currentQuestion].questionText,style: TextStyle(
    color: Colors.white,

  ),),
),
          Padding(
            padding: const EdgeInsets.only(top:38.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: ()=>_checkAnswer(true,context),
                  color: Colors.blueGrey.shade900,
                  child: Text("True",style: TextStyle(
                    color: Colors.white
                  ),),
                ),
                RaisedButton(
                  onPressed: ()=>_checkAnswer(false,context),
                  color: Colors.blueGrey.shade900,
                  child: Text("False",style: TextStyle(
                      color: Colors.white
                  ),),
                ),
                RaisedButton(
                  onPressed: (){_nextQuestion();},
                  color: Colors.blueGrey.shade900,
                  child: Icon(Icons.navigate_next,color: Colors.white,)
                )

              ],
            ),
          ),

             Spacer(),
//            Container()
            ],

          ),


        ),
      ),
    );
  }

  _checkAnswer(bool userchoice,BuildContext context) {
if(userchoice==questions[_currentQuestion].isCorrect){
debugPrint("Correct");


final snackbar=SnackBar(content: Text("correct"),backgroundColor: Colors.orangeAccent,);
Scaffold.of(context).showSnackBar(snackbar);
}else{


  debugPrint("Incorrect ");


  final snackbar=SnackBar(content: Text("Incorrect"),backgroundColor: Colors.blue,);
  Scaffold.of(context).showSnackBar(snackbar);
}




  }

  void _nextQuestion() {
setState(() {


  _currentQuestion=(_currentQuestion+1)%questions.length;

});

  }
}


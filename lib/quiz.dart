import 'package:flutter/material.dart';
import 'package:flutter_quiz_app_final/data/questions.dart';
import 'package:flutter_quiz_app_final/questions_screen.dart';
import 'package:flutter_quiz_app_final/start_screen.dart';
import 'package:flutter_quiz_app_final/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
// ternary screen selection:
    // final screenWidget = activeScreen == 'start-screen'
    //     ? StartingScreen(switchScreen)
    //     : const Questions();
//_________________________

// if conditional screen selection
    Widget screenWidget = StartingScreen(switchScreen);
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }
    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(chosenAnswers: selectedAnswers);
    }
//_________________________

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 34, 0, 56),
                Color.fromARGB(255, 115, 0, 187)
              ],
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}

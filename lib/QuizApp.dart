import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Quiz Application",
      home: QuizHomeScreen(),
    );
  }
}

// Home Screen
class QuizHomeScreen extends StatefulWidget {
  const QuizHomeScreen({super.key});

  @override
  State<QuizHomeScreen> createState() => QuizHomeScreenState();
}

class QuizHomeScreenState extends State<QuizHomeScreen> {
  String? selectedAnswer;
  final String correctAnswer = "Dart";

  Future<void> navigateToQuizScreen(BuildContext context) async {
    final answer = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const QuizScreen()),
    );

    if (answer != null) {
      setState(() {
        selectedAnswer = answer;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Your Answer: $answer | Correct Answer: $correctAnswer",
            style: const TextStyle(fontSize: 16),
          ),
          backgroundColor:
              (answer == correctAnswer) ? Colors.green : Colors.red,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz Application"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Press to Start the Quiz",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => navigateToQuizScreen(context),
              child: const Text("Start Quiz"),
            ),
          ],
        ),
      ),
    );
  }
}

// Quiz Screen
class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> options = ["Java", "PHP", "Dart", "C++"];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "which programming language used in flutter?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ...options.map((option) {
              return Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context, option);
                      },
                      child: Row(
                        children: [
                          Text(option,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                              )),
                        ],
                      ),
                    ),
                  ]);
            })
          ],
        ),
      ),
    );
  }
}

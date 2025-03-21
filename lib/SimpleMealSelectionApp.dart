import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  String? selectedMeal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[200],
        title: Text('Meal Selection App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MealSelectionScreen()),
                );
                setState(() {
                  selectedMeal = result;
                });
                final snackBar = SnackBar(
                  backgroundColor: (result != null)
                      ? const Color.fromARGB(255, 201, 46, 46)
                      : Colors.blueGrey,
                  content: Text(result != null
                      ? 'Selected Meal: $result'
                      : 'No meal selected'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Text('Select a Meal'),
            ),
          ],
        ),
      ),
    );
  }
}

class MealSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Your Meal'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MealButton(context, 'Pizza', Icons.local_pizza),
            MealButton(context, 'Burger', Icons.fastfood),
            MealButton(context, 'Sushi', Icons.ramen_dining),
          ],
        ),
      ),
    );
  }

  Widget MealButton(BuildContext context, String meal, IconData icon) {
    return ElevatedButton.icon(
      style: ButtonStyle(minimumSize: WidgetStatePropertyAll(Size(100, 40))),
      onPressed: () {
        Navigator.pop(context, meal);
      },
      onLongPress: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Meal Description'),
            content: Text('satisfy your midnight cravings with $meal !'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      },
      icon: Icon(icon),
      label: Text(meal),
    );
  }
}

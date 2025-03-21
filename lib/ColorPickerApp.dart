import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Background Color Changer",
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color backgroundColor = Colors.white;
  String selectedColorName = "White";

  Future<void> _navigateToColorPicker(BuildContext context) async {
    final selectedColor = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => const colorPickerScreen()));

    if (selectedColor != null) {
      setState(() {
        backgroundColor = selectedColor["color"];
        selectedColorName = selectedColor["name"];
      });

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Selected Color: $selectedColorName")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Color Picker App",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blueGrey,
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: backgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.only(right: 400)),
              Text(
                "Click this button to choose the Colors!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                child: const Text("Pick a Color!"),
                onPressed: () => _navigateToColorPicker(context),
              ),
            ],
          ),
        ));
  }
}

class colorPickerScreen extends StatelessWidget {
  const colorPickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Pick a Color..."),
            backgroundColor: Colors.blueGrey,
            foregroundColor: Colors.white),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _colorButton(context, Colors.red, "Red"),
              SizedBox(width: 20),
              _colorButton(context, Colors.blue, "Blue"),
              SizedBox(width: 20),
              _colorButton(context, Colors.green, "Green"),
            ],
          ),
        ));
  }

  Widget _colorButton(BuildContext context, Color color, String name) {
    return Row(
      children: [
        TextButton(
            style: TextButton.styleFrom(
                backgroundColor: color,
                foregroundColor: Colors.blueGrey,
                padding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0)),
            onPressed: () {
              Navigator.pop(context, {"color": color, "name": name});
            },
            child: Text(name, style: const TextStyle(color: Colors.white)))
      ],
    );
  }
}

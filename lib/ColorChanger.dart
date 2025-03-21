import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool changecolor = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple[100],
          title: Text("Background Color Changer"),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: changecolor ? Colors.red : Colors.yellow,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Touch this icon to see the magic",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      changecolor = !changecolor;
                    });
                  },
                  icon: const Icon(
                    Icons.favorite,
                    size: 60,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

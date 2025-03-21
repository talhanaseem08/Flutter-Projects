import 'package:flutter/material.dart';

void main(List<String> args) {
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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "App with multiple Screen",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal[300],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.pink[50],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: Text(
                "Home Screen",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AboutScreen()),
                    );
                  },
                  icon: const Icon(Icons.info_outline),
                  iconSize: 50,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Contacts()),
                    );
                  },
                  icon: const Icon(Icons.contacts),
                  iconSize: 50,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Settings()),
                      );
                    },
                    icon: const Icon(Icons.settings),
                    iconSize: 50),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 35,
                ),
                Text("About"),
                SizedBox(
                  width: 20,
                ),
                Text("Contact"),
                SizedBox(
                  width: 19,
                ),
                Text("Settings"),
                SizedBox(
                  width: 24,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(null))
          ],
          title:
              const Text("About Screen", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.teal[300]),
      body: Center(
        child: Text("welcome to About section",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
      ),
    );
  }
}

class Contacts extends StatelessWidget {
  const Contacts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(null))
            ],
            title:
                const Text("Contacts", style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.teal[300]),
        body: Center(
          child: Text("welcome to Contacts section",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        ));
  }
}

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(null))
            ],
            title:
                const Text("Settings", style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.teal[300]),
        body: Center(
          child: Text("welcome to Settings section",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        ));
  }
}

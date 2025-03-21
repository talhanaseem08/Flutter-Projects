import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ContactScreen(),
    );
  }
}

class ContactScreen extends StatelessWidget {
  ContactScreen({super.key});

  final List<String> contacts = [
    "Yoush Ali",
    "Sara Zulfiqar",
    "Malik Zain",
    "Ayesha Naeem",
    "Ahad Akram",
    "Hanzala Khan",
    "Zeeshan Ali",
    "Umer Ayaz",
    "Bilal Naseem",
    "Salik Sheikh",
    "Faraz ismael",
    "Laiba Khurram",
    "Roman ahmed",
    "Furqan Ahmed",
    "Hashim Samana",
    "Shahzaib Shahid",
    "Huda Ali",
    "Saniya Shah",
    "Anuf jain",
    "Qasim Hassan"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[300],
        title: Text("CONTACTS", style: TextStyle(color: Colors.white)),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 90, 187, 177),
              child: Text(
                contacts[index][0],
                style: TextStyle(color: Colors.white),
              ),
            ),
            title: Text(contacts[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetailScreen(contacts: contacts, index: index),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final List<String> contacts;
  final int index;
  final List<String> numbers = [
    "0320",
    "10501",
    "2802",
    "3253",
    "64542",
    "6541",
    "45121",
    "52421",
    "458451",
    "587454",
    "545894",
    "785121",
    "48541545",
    "23214116",
    "897946130",
    "8512154",
    "7841121",
    "89262162",
    "87465341",
    "54454152",
    "4521545"
  ];

  DetailScreen({required this.contacts, super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[300],
        title: Text(contacts[index]),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(null))
        ],
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: Column(children: [
            Text(contacts[index],
                style: TextStyle(color: Colors.black, fontSize: 30)),
            Text("Number: ${numbers[index]}"),
            Text("Email: Your email")
          ]),
        ),
        const SizedBox(
          height: 40,
        )
      ]),
    );
  }
}

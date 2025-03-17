import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String calculation = "";
  String answer = "";

  void concate(String cal_button) {
    calculation += cal_button;
    setState(() {});
  }

  void on_press(value) {
    if (value == "C") {
      calculation = "";
      answer = "";
    } else if (value == "=") {
      operations();
    } else if (value == "x") {
      removeNum();
    }
  }

  void operations() {
    if (calculation.contains("+")) {
      List stringBreak = calculation.split("+");
      int num1 = int.parse(stringBreak[0]);
      int num2 = int.parse(stringBreak[1]);
      answer = (num1 + num2).toString();
    } else if (calculation.contains("-")) {
      List stringBreak = calculation.split("-");
      int num1 = int.parse(stringBreak[0]);
      int num2 = int.parse(stringBreak[1]);
      answer = (num1 - num2).toString();
    } else if (calculation.contains("*")) {
      List stringBreak = calculation.split("*");
      int num1 = int.parse(stringBreak[0]);
      int num2 = int.parse(stringBreak[1]);
      answer = (num1 * num2).toString();
    } else if (calculation.contains("/")) {
      List stringBreak = calculation.split("/");
      int num1 = int.parse(stringBreak[0]);
      int num2 = int.parse(stringBreak[1]);
      answer = (num1 / num2).toString();
    }
  }

  void removeNum() {
    calculation = calculation.substring(0, calculation.length - 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text("Calculator"),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.centerRight,
              width: double.infinity,
              height: 300,
              color: Colors.white,
              child: Column(
                children: [
                  Text(
                    "$calculation",
                    style: const TextStyle(
                        fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "$answer",
                    style: const TextStyle(
                        fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        concate("7");
                        setState(() {});
                      },
                      child: const Text("7"),
                      style: ButtonStyle(
                        shape: const WidgetStatePropertyAll<OutlinedBorder>(
                            CircleBorder(eccentricity: 0.0)),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          concate("8");
                          setState(() {});
                        },
                        child: const Text("8"),
                        style: const ButtonStyle(
                          shape: const WidgetStatePropertyAll<OutlinedBorder>(
                              CircleBorder(eccentricity: 0.0)),
                        )),
                    ElevatedButton(
                      onPressed: () {
                        concate("9");
                        setState(() {});
                      },
                      child: const Text("9"),
                      style: const ButtonStyle(
                        shape: const WidgetStatePropertyAll<OutlinedBorder>(
                            CircleBorder(eccentricity: 0.0)),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        concate("4");
                        setState(() {});
                      },
                      child: const Text("4"),
                      style: const ButtonStyle(
                        shape: const WidgetStatePropertyAll<OutlinedBorder>(
                            CircleBorder(eccentricity: 0.0)),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        concate("5");
                        setState(() {});
                      },
                      child: const Text("5"),
                      style: const ButtonStyle(
                        shape: const WidgetStatePropertyAll<OutlinedBorder>(
                            CircleBorder(eccentricity: 0.0)),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        concate("6");
                        setState(() {});
                      },
                      child: const Text("6"),
                      style: const ButtonStyle(
                        shape: const WidgetStatePropertyAll<OutlinedBorder>(
                            CircleBorder(eccentricity: 0.0)),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        concate("1");
                        setState(() {});
                      },
                      child: const Text("1"),
                      style: const ButtonStyle(
                        shape: const WidgetStatePropertyAll<OutlinedBorder>(
                            CircleBorder(eccentricity: 0.0)),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        concate("2");
                        setState(() {});
                      },
                      child: const Text("2"),
                      style: const ButtonStyle(
                        shape: const WidgetStatePropertyAll<OutlinedBorder>(
                            CircleBorder(eccentricity: 0.0)),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        concate("3");
                        setState(() {});
                      },
                      child: const Text("3"),
                      style: const ButtonStyle(
                        shape: const WidgetStatePropertyAll<OutlinedBorder>(
                            CircleBorder(eccentricity: 0.0)),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        concate("+");
                        setState(() {});
                      },
                      child: const Text("+"),
                      style: const ButtonStyle(
                        shape: const WidgetStatePropertyAll<OutlinedBorder>(
                            CircleBorder(eccentricity: 0.0)),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        concate("-");
                        setState(() {});
                      },
                      child: const Text("-"),
                      style: const ButtonStyle(
                        shape: const WidgetStatePropertyAll<OutlinedBorder>(
                            CircleBorder(eccentricity: 0.0)),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        concate("/");
                        setState(() {});
                      },
                      child: const Text("/"),
                      style: const ButtonStyle(
                        shape: const WidgetStatePropertyAll<OutlinedBorder>(
                            CircleBorder(eccentricity: 0.0)),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        on_press("C");
                        setState(() {});
                      },
                      child: const Text("C"),
                      style: const ButtonStyle(
                        shape: const WidgetStatePropertyAll<OutlinedBorder>(
                            CircleBorder(eccentricity: 0.0)),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        on_press("=");
                        ;
                        setState(() {});
                      },
                      child: const Text("="),
                      style: const ButtonStyle(
                        shape: const WidgetStatePropertyAll<OutlinedBorder>(
                            CircleBorder(eccentricity: 0.0)),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        on_press("x");

                        setState(() {});
                      },
                      child: const Text("X"),
                      style: const ButtonStyle(
                        shape: const WidgetStatePropertyAll<OutlinedBorder>(
                            CircleBorder(eccentricity: 0.0)),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ));
  }
}

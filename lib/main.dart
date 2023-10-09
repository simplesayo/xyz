import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = '0';

  double num1 = 0.0;

  double num2 = 0.0;

  String operand = '';

  late String buttonText;

  // ignore: non_constant_identifier_names
  buttonPressed(String ButtonText) {
    if (ButtonText == 'CLEAR') {
      output = '0';

      num1 = 0.0;

      num2 = 0.0;

      operand = '';
    } else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == 'X' ||
        buttonText == '/') {
      num1 = double.parse(output);

      operand = buttonText;

      output = '0';
    } else if (buttonText == '.') {
      if (output.contains('.')) {
        // ignore: avoid_print
        print('there is a decimal alredy');
        return;
      } else {
        output = output + buttonText;
      }
    } else if (buttonText == '=') {
      num2 = double.parse(output);

      if (operand == '+') {
        output = (num1 + num2).toString();
      }
      if (operand == '-') {
        output = (num1 - num2).toString();
      }
      if (operand == 'X') {
        output = (num1 * num2).toString();
      }
      if (operand == '/') {
        output = (num1 / num2).toString();
      }
      num1 = 0.0;

      num2 = 0.0;

      operand = '';
    } else {
      output = output + buttonText;
    }
    {
      // ignore: avoid_print
      print(output);
    }

    setState(() {
      output = double.parse(output).toStringAsFixed(2);
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
        child: MaterialButton(
      onPressed: () => buttonText,
      color: Colors.blueGrey,
      textColor: Colors.white,
      child: const Text('1'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Column(
          children: <Widget>[
            Text(output),
            const Expanded(
              child: Divider(),
            ),
            Column(
              children: [
                Row(
                  children: [
                    buildButton('7'),
                    buildButton('8'),
                    buildButton('9'),
                    buildButton('/'),
                    Row(children: [
                      buildButton('4'),
                      buildButton('5'),
                      buildButton('6'),
                      buildButton('X'),
                      Row(
                        children: [
                          buildButton('1'),
                          buildButton('2'),
                          buildButton('3'),
                          buildButton('-'),
                          Row(children: [
                            buildButton('.'),
                            buildButton('0'),
                            buildButton('00'),
                            buildButton('+'),
                            Row(
                              children: [
                                buildButton('CLEAR'),
                                buildButton('='),
                              ],
                            )
                          ])
                        ],
                      )
                    ])
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

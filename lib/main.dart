import 'package:flutter/material.dart';
import 'dart:math';

ButtonStyle selectedOperationBtn = TextButton.styleFrom(
  backgroundColor: Colors.blue,
  textStyle: TextStyle(color: Colors.white),
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Simple Calculator'),
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
  String display = '0';
  String firstNum = '';
  String secondNum = '';
  String operation = '';

  getDigit(digit) {
    if (operation.isEmpty) {
      if (display.contains('='))
        firstNum = digit;
      else
        firstNum += digit;
      setState(() => display = firstNum);
    } else {
      secondNum += digit;
      setState(() => display = '$firstNum $operation $secondNum');
    }
  }

  getOperation(newOperation) {
    if (operation.isEmpty) {
      operation = newOperation;
      firstNum = firstNum.isEmpty ? '0' : firstNum;
      setState(() => display = '$firstNum $operation');
    } else if (operation == newOperation) {
      operation = '';
      setState(() => display = firstNum);
    } else {
      operation = newOperation;
      setState(() => display = '$firstNum $operation');
    }
  }

  getResult() {
    if (firstNum.isEmpty || secondNum.isEmpty || operation.isEmpty) {
      return;
    }
    int n1 = int.parse(firstNum);
    int n2 = int.parse(secondNum);
    int result = 0;

    switch (operation) {
      case '+':
        result = n1 + n2;
        break;
      case '-':
        result = n1 - n2;
        break;
      case '*':
        result = n1 * n2;
        break;
      case '/':
        result = (n1 / n2).round();
        break;
    }

    secondNum = '';
    operation = '';
    firstNum = result.toString();
    setState(() => display = '= $result');
  }

  clearDisplay() {
    firstNum = '';
    secondNum = '';
    operation = '';
    setState(() => display = '0');
  }

  backspace() {
    if (operation.isEmpty) {
      firstNum = firstNum.substring(0, max(0, firstNum.length - 1));
      if (firstNum.isEmpty) setState(() => display = '0');
      else setState(() => display = firstNum);
    } else {
      secondNum = secondNum.substring(0, max(0, secondNum.length - 1));
      if (secondNum.isEmpty) setState(() => display = '$firstNum $operation');
      else setState(() => display = '$firstNum $operation $secondNum');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                  ),
                  BoxShadow(
                    color: Colors.white,
                    spreadRadius: -2.0,
                    blurRadius: 6.0,
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              margin: EdgeInsets.symmetric(vertical: 18),
              alignment: Alignment.center,
              width: 300,
              child: Text(
                display,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () => getDigit('7'),
                          child: Text('7'),
                        ),
                        TextButton(
                          onPressed: () => getDigit('8'),
                          child: Text('8'),
                        ),
                        TextButton(
                          onPressed: () => getDigit('9'),
                          child: Text('9'),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () => getDigit('4'),
                          child: Text('4'),
                        ),
                        TextButton(
                          onPressed: () => getDigit('5'),
                          child: Text('5'),
                        ),
                        TextButton(
                          onPressed: () => getDigit('6'),
                          child: Text('6'),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () => getDigit('1'),
                          child: Text('1'),
                        ),
                        TextButton(
                          onPressed: () => getDigit('2'),
                          child: Text('2'),
                        ),
                        TextButton(
                          onPressed: () => getDigit('3'),
                          child: Text('3'),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () => getDigit('0'),
                          child: Text('0'),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    TextButton(
                      onPressed: () => getOperation('+'),
                      child: Text('+'),
                      // style: operation == '+' ? selectedOperationBtn : null,
                    ),
                    TextButton(
                      onPressed: () => getOperation('-'),
                      child: Text('-'),
                    ),
                    TextButton(
                      onPressed: () => getOperation('*'),
                      child: Text('*'),
                    ),
                    TextButton(
                      onPressed: () => getOperation('/'),
                      child: Text('/'),
                    ),
                  ],
                ),
                Column(
                  children: [
                    TextButton(
                      onPressed: () => clearDisplay(),
                      child: Text('CE'),
                    ),
                    TextButton(
                      onPressed: () => backspace(),
                      child: Icon(Icons.backspace),
                    ),
                    TextButton(
                      onPressed: () => getResult(),
                      child: Text('='),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

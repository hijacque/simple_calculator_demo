import 'package:flutter/material.dart';
import 'dart:math';

ButtonStyle keyBtnStyle = TextButton.styleFrom(
  fixedSize: Size(32.0, 32.0),
  side: BorderSide(color: Colors.teal, width: 1.5),
);

ButtonStyle selectedKeyBtnStyle = TextButton.styleFrom(
  backgroundColor: Colors.teal
);

TextStyle keyTextStyle = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.w700,
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
        primarySwatch: Colors.teal,
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
  int opIndex = -1;
  List<String> operations = ['+', '-', '×', '÷'];

  getDigit(digit) {
    if (opIndex < 0) {
      if (firstNum == '0' && digit == '0') {
        return;
      } else if (display.contains('=') || firstNum == '0') {
        firstNum = digit;
      } else {
        firstNum += digit;
      }
      print('first number: $firstNum');
      setState(() => display = firstNum);
    } else {
      if (secondNum == '0' && digit == '0') {
        return;
      } else if (secondNum == '0') {
        secondNum = digit;
      } else {
        secondNum += digit;
      }

      print('second number: $secondNum');
      setState(() => display = '$firstNum ${operations[opIndex]} $secondNum');
    }
  }

  getOperation(newOperation) {
    if (opIndex < 0) {
      opIndex = newOperation;
      firstNum = firstNum.isEmpty ? '0' : firstNum;
      setState(() => display = '$firstNum ${operations[opIndex]}');
    } else if (opIndex == newOperation) {
      opIndex = -1;
      setState(() => display = firstNum);
    } else {
      opIndex = newOperation;
      setState(() => display = '$firstNum ${operations[opIndex]}');
    }
  }

  getResult() {
    if (firstNum.isEmpty || secondNum.isEmpty || opIndex < 0) {
      return;
    }
    int n1 = int.parse(firstNum);
    int n2 = int.parse(secondNum);
    int result = 0;

    switch (opIndex) {
      case 0:
        result = n1 + n2;
        break;
      case 1:
        result = n1 - n2;
        break;
      case 2:
        result = n1 * n2;
        break;
      case 3:
        result = (n1 / n2).round();
        break;
    }

    secondNum = '';
    opIndex = -1;
    firstNum = result.toString();
    setState(() => display = '= $result');
  }

  clearDisplay() {
    firstNum = '';
    secondNum = '';
    opIndex = -1;
    setState(() => display = '0');
  }

  backspace() {
    if (opIndex < 0) {
      firstNum = firstNum.substring(0, max(0, firstNum.length - 1));
      if (firstNum.isEmpty)
        setState(() => display = '0');
      else
        setState(() => display = firstNum);
    } else {
      secondNum = secondNum.substring(0, max(0, secondNum.length - 1));
      if (secondNum.isEmpty)
        setState(() => display = '$firstNum $operations[opIndex]');
      else
        setState(() => display = '$firstNum $operations[opIndex] $secondNum');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          width: 310,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                      spreadRadius: 0,
                      blurRadius: 4.0,
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
                      fontFamily: 'DM_Mono'),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 105,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          style: keyBtnStyle,
                          onPressed: () => getDigit('7'),
                          child: Text(
                            '7',
                            style: keyTextStyle,
                          ),
                        ),
                        TextButton(
                          style: keyBtnStyle,
                          onPressed: () => getDigit('4'),
                          child: Text(
                            '4',
                            style: keyTextStyle,
                          ),
                        ),
                        TextButton(
                          style: keyBtnStyle,
                          onPressed: () => getDigit('1'),
                          child: Text(
                            '1',
                            style: keyTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 140,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          style: keyBtnStyle,
                          onPressed: () => getDigit('8'),
                          child: Text(
                            '8',
                            style: keyTextStyle,
                          ),
                        ),
                        TextButton(
                          style: keyBtnStyle,
                          onPressed: () => getDigit('5'),
                          child: Text(
                            '5',
                            style: keyTextStyle,
                          ),
                        ),
                        TextButton(
                          style: keyBtnStyle,
                          onPressed: () => getDigit('2'),
                          child: Text(
                            '2',
                            style: keyTextStyle,
                          ),
                        ),
                        TextButton(
                          style: keyBtnStyle,
                          onPressed: () => getDigit('0'),
                          child: Text(
                            '0',
                            style: keyTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 105,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          style: keyBtnStyle,
                          onPressed: () => getDigit('9'),
                          child: Text(
                            '9',
                            style: keyTextStyle,
                          ),
                        ),
                        TextButton(
                          style: keyBtnStyle,
                          onPressed: () => getDigit('6'),
                          child: Text(
                            '6',
                            style: keyTextStyle,
                          ),
                        ),
                        TextButton(
                          style: keyBtnStyle,
                          onPressed: () => getDigit('3'),
                          child: Text(
                            '3',
                            style: keyTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 140,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          style: opIndex == 0 ? selectedKeyBtnStyle : keyBtnStyle,
                          onPressed: () => getOperation(0),
                          child: Text(
                            '+',
                            style: opIndex == 0 ? keyTextStyle.copyWith(color: Colors.white) : keyTextStyle,
                          ),
                        ),
                        TextButton(
                          style: opIndex == 1 ? selectedKeyBtnStyle : keyBtnStyle,
                          onPressed: () => getOperation(1),
                          child: Text(
                            '-',
                            style: opIndex == 1 ? keyTextStyle.copyWith(color: Colors.white) : keyTextStyle,
                          ),
                        ),
                        TextButton(
                          style: opIndex == 2 ? selectedKeyBtnStyle : keyBtnStyle,
                          onPressed: () => getOperation(2),
                          child: Text(
                            '×',
                            style: opIndex == 2 ? keyTextStyle.copyWith(color: Colors.white) : keyTextStyle,
                          ),
                        ),
                        TextButton(
                          style: opIndex == 3 ? selectedKeyBtnStyle : keyBtnStyle,
                          onPressed: () => getOperation(3),
                          child: Text(
                            '÷',
                            style: opIndex == 3 ? keyTextStyle.copyWith(color: Colors.white) : keyTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 105,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          style: keyBtnStyle,
                          onPressed: () => clearDisplay(),
                          child: Text(
                            'CE',
                            style: keyTextStyle,
                          ),
                        ),
                        TextButton(
                          style: keyBtnStyle,
                          onPressed: () => backspace(),
                          child: Icon(Icons.backspace),
                        ),
                        TextButton(
                          style: keyBtnStyle,
                          onPressed: () => getResult(),
                          child: Text(
                            '=',
                            style: keyTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

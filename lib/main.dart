import 'package:flutter/material.dart';
import 'dart:math';

final ButtonStyle keyBtnStyle = TextButton.styleFrom(
  backgroundColor: Color.fromARGB(255, 235, 235, 235),
  fixedSize: Size(50, 45),
  side: BorderSide(color: Colors.teal, width: 1.5),
);

const TextStyle keyTextStyle = TextStyle(
  fontSize: 18.0,
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
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
                    spreadRadius: 0,
                    blurRadius: 4.0,
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              margin: EdgeInsets.symmetric(vertical: 32, horizontal: 12.0),
              alignment: Alignment.center,
              width: 300,
              child: Text(
                '0',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: 360,
              margin: EdgeInsets.symmetric(horizontal: 12.0),
              child: Flex(
                direction: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        TextButton(
                          style: keyBtnStyle,
                          onPressed: () {},
                          child: Text('7', style: keyTextStyle,),
                        ),
                        SizedBox(height: 4.0),
                        TextButton(
                          style: keyBtnStyle,
                          onPressed: () {},
                          child: Text('4', style: keyTextStyle,),
                        ),
                        SizedBox(height: 4.0),
                        TextButton(
                          style: keyBtnStyle,
                          onPressed: () {},
                          child: Text('1', style: keyTextStyle,),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 4.0),
                  Expanded(
                    child: Column(
                      children: [
                        TextButton(
                          style: keyBtnStyle,
                          onPressed: () {},
                          child: Text('8', style: keyTextStyle,),
                        ),
                        SizedBox(height: 4.0),
                        TextButton(
                          style: keyBtnStyle,
                          onPressed: () {},
                          child: Text('5', style: keyTextStyle,),
                        ),
                        SizedBox(height: 4.0),
                        TextButton(
                          style: keyBtnStyle,
                          onPressed: () {},
                          child: Text('2', style: keyTextStyle,),
                        ),
                        SizedBox(height: 4.0),
                        TextButton(
                          style: keyBtnStyle,
                          onPressed: () {},
                          child: Text('0', style: keyTextStyle,),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 4.0),
                  Expanded(
                    child: Column(
                      children: [
                        TextButton(
                          style: keyBtnStyle,
                          onPressed: () {},
                          child: Text('9', style: keyTextStyle,),
                        ),
                        SizedBox(height: 4.0),
                        TextButton(
                          style: keyBtnStyle,
                          onPressed: () {},
                          child: Text('6', style: keyTextStyle,),
                        ),
                        SizedBox(height: 4.0),
                        TextButton(
                          style: keyBtnStyle,
                          onPressed: () {},
                          child: Text('3', style: keyTextStyle,),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 4.0),
                  Expanded(
                    child: Column(
                      children: [
                        TextButton(
                          style: keyBtnStyle,
                          onPressed: () {},
                          child: Text('+', style: keyTextStyle,),
                        ),
                        SizedBox(height: 4.0),
                        TextButton(
                          style: keyBtnStyle,
                          onPressed: () {},
                          child: Text('-', style: keyTextStyle,),
                        ),
                        SizedBox(height: 4.0),
                        TextButton(
                          style: keyBtnStyle,
                          onPressed: () {},
                          child: Text('×', style: keyTextStyle,),
                        ),
                        SizedBox(height: 4.0),
                        TextButton(
                          style: keyBtnStyle,
                          onPressed: () {},
                          child: Text('÷', style: keyTextStyle,),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 4.0),
                  Expanded(
                    child: Column(
                      children: [
                        TextButton(
                          style: keyBtnStyle,
                          onPressed: () {},
                          child: Text('CE', style: keyTextStyle,),
                        ),
                        SizedBox(height: 4.0),
                        TextButton(
                          style: keyBtnStyle,
                          onPressed: () {},
                          child: Icon(Icons.backspace),
                        ),
                        SizedBox(height: 4.0),
                        TextButton(
                          style: keyBtnStyle,
                          onPressed: () {},
                          child: Text('=', style: keyTextStyle,),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Center(
//   child: Container(
//     width: 300,
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.all(Radius.circular(4)),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey,
//               ),
//               BoxShadow(
//                 color: Colors.white,
//                 spreadRadius: 0,
//                 blurRadius: 4.0,
//               ),
//             ],
//           ),
//           padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
//           margin: EdgeInsets.symmetric(vertical: 32),
//           alignment: Alignment.center,
//           width: 300,
//           child: Text(
//             '0',
//             style: TextStyle(
//               fontSize: 20.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         Flex(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           direction: Axis.horizontal,
//           children: [
//             Flex(
//               direction: Axis.vertical,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 TextButton(
//                   style: keyBtnStyle,
//                   onPressed: () => {},
//                   child: Text(
//                     '7',
//                     style: keyTextStyle,
//                   ),
//                 ),
//                 SizedBox(height: 4),
//                 TextButton(
//                   style: keyBtnStyle,
//                   onPressed: () => {},
//                   child: Text(
//                     '4',
//                     style: keyTextStyle,
//                   ),
//                 ),
//                 SizedBox(height: 4),
//                 TextButton(
//                   style: keyBtnStyle,
//                   onPressed: () => {},
//                   child: Text(
//                     '1',
//                     style: keyTextStyle,
//                   ),
//                 ),
//               ],
//             ),
//             Flex(
//               direction: Axis.vertical,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 TextButton(
//                   style: keyBtnStyle,
//                   onPressed: () => {},
//                   child: Text(
//                     '8',
//                     style: keyTextStyle,
//                   ),
//                 ),
//                 SizedBox(height: 4),
//                 TextButton(
//                   style: keyBtnStyle,
//                   onPressed: () => {},
//                   child: Text(
//                     '5',
//                     style: keyTextStyle,
//                   ),
//                 ),
//                 SizedBox(height: 4),
//                 TextButton(
//                   style: keyBtnStyle,
//                   onPressed: () => {},
//                   child: Text(
//                     '2',
//                     style: keyTextStyle,
//                   ),
//                 ),
//                 SizedBox(height: 4),
//                 TextButton(
//                   style: keyBtnStyle,
//                   onPressed: () => {},
//                   child: Text(
//                     '0',
//                     style: keyTextStyle,
//                   ),
//                 ),
//               ],
//             ),
//             Flex(
//               direction: Axis.vertical,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 TextButton(
//                   style: keyBtnStyle,
//                   onPressed: () => {},
//                   child: Text(
//                     '9',
//                     style: keyTextStyle,
//                   ),
//                 ),
//                 SizedBox(height: 4),
//                 TextButton(
//                   style: keyBtnStyle,
//                   onPressed: () => {},
//                   child: Text(
//                     '6',
//                     style: keyTextStyle,
//                   ),
//                 ),
//                 SizedBox(height: 4),
//                 TextButton(
//                   style: keyBtnStyle,
//                   onPressed: () => {},
//                   child: Text(
//                     '3',
//                     style: keyTextStyle,
//                   ),
//                 ),
//               ],
//             ),
//             Flex(
//               direction: Axis.vertical,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 TextButton(
//                   style: keyBtnStyle,
//                   onPressed: () => {},
//                   child: Text(
//                     '+',
//                     style: keyTextStyle,
//                   ),
//                 ),
//                 SizedBox(height: 4),
//                 TextButton(
//                   style: keyBtnStyle,
//                   onPressed: () => {},
//                   child: Text(
//                     '-',
//                     style: keyTextStyle,
//                   ),
//                 ),
//                 SizedBox(height: 4),
//                 TextButton(
//                   style: keyBtnStyle,
//                   onPressed: () => {},
//                   child: Text(
//                     '×',
//                     style: keyTextStyle,
//                   ),
//                 ),
//                 SizedBox(height: 4),
//                 TextButton(
//                   style: keyBtnStyle,
//                   onPressed: () => {},
//                   child: Text(
//                     '÷',
//                     style: keyTextStyle,
//                   ),
//                 ),
//               ],
//             ),
//             Flex(
//               direction: Axis.vertical,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 TextButton(
//                   style: keyBtnStyle,
//                   onPressed: () => {},
//                   child: Text(
//                     'CE',
//                     style: keyTextStyle,
//                   ),
//                 ),
//                 SizedBox(height: 4),
//                 TextButton(
//                   style: keyBtnStyle,
//                   onPressed: () => {},
//                   child: Icon(Icons.backspace),
//                 ),
//                 SizedBox(height: 4),
//                 TextButton(
//                   style: keyBtnStyle,
//                   onPressed: () => {},
//                   child: Text(
//                     '=',
//                     style: keyTextStyle,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ],
//     ),
//   ),
// ), // This trailing comma makes auto-formatting nicer for build methods.

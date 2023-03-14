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
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    textEditingController.text = "0";
    super.initState();
  }

  _adddata(int no) {
    setState(() {
      if (textEditingController.text.isEmpty) {
        textEditingController.text = "0";
      }
      textEditingController.text =
          (double.parse(textEditingController.text) * 10 + no).toString();
    });
  }

  double data = 0.0;
  _add() {
    data = double.parse(textEditingController.text);
    textEditingController.clear();
  }

  _equ(double no) {
    data += no;
    textEditingController.text = data.toString();
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 6,
            color: Colors.brown[400],
            child: SizedBox.expand(
              child: TextFormField(
                controller: textEditingController,
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Row(
            children: [
              CalcButton(
                onTap: () {
                  textEditingController.clear();
                },
                text: "AC",
                color: Colors.brown[700],
              ),
              CalcButton(
                onTap: () {},
                text: "+/-",
                color: Colors.brown[700],
              ),
              CalcButton(
                onTap: () {},
                text: "%",
                color: Colors.brown[700],
              ),
              CalcButton(
                onTap: () {},
                text: "/",
                color: Colors.yellow[800],
              ),
            ],
          ),
          Row(
            children: [
              CalcButton(
                onTap: () {
                  _adddata(7);
                },
                text: "7",
              ),
              CalcButton(
                onTap: () {
                  _adddata(8);
                },
                text: "8",
              ),
              CalcButton(
                onTap: () {
                  _adddata(9);
                },
                text: "9",
              ),
              CalcButton(
                onTap: () {},
                text: "X",
                color: Colors.yellow[800],
              ),
            ],
          ),
          Row(
            children: [
              CalcButton(
                onTap: () {
                  _adddata(4);
                },
                text: "4",
              ),
              CalcButton(
                onTap: () {
                  _adddata(5);
                },
                text: "5",
              ),
              CalcButton(
                onTap: () {
                  _adddata(6);
                },
                text: "6",
              ),
              CalcButton(
                onTap: () {},
                text: "/",
                color: Colors.yellow[800],
              ),
            ],
          ),
          Row(
            children: [
              CalcButton(
                onTap: () {
                  _adddata(1);
                },
                text: "1",
              ),
              CalcButton(
                onTap: () {
                  _adddata(2);
                },
                text: "2",
              ),
              CalcButton(
                onTap: () {
                  _adddata(3);
                },
                text: "3",
              ),
              CalcButton(
                onTap: () {
                  _add();
                },
                text: "+",
                color: Colors.yellow[800],
              ),
            ],
          ),
          Row(
            children: [
              CalcButton(
                onTap: () {},
                text: "0",
                isExpanded: true,
              ),
              CalcButton(
                onTap: () {},
                text: ".",
              ),
              CalcButton(
                onTap: () {
                  _equ(double.parse(textEditingController.text));
                },
                text: "=",
                color: Colors.yellow[800],
              ),
            ],
          )
        ],
      ),
    ));
  }
}

class CalcButton extends StatelessWidget {
  const CalcButton({
    super.key,
    required this.text,
    this.color = Colors.brown,
    required this.onTap,
    this.isExpanded = false,
  });
  final String text;
  final Color? color;
  final Function onTap;
  final bool isExpanded;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        height: MediaQuery.of(context).size.height / 6,
        width: isExpanded
            ? MediaQuery.of(context).size.width / 2
            : MediaQuery.of(context).size.width / 4,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: Colors.black,
            width: 0.5,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

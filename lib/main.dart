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
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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

  double data = 0;
  void _addNo(double no) {
    textEditingController.text =
        (double.parse(textEditingController.text.toString()) * 10 + no)
            .toString();
    setState(() {});
  }

  void _opeation() {}

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 6,
              color: Colors.brown[400],
              child: SizedBox.expand(
                child: TextFormField(
                  textAlign: TextAlign.right,
                  controller: textEditingController,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ),
            ),
            Row(
              children: [
                Button(
                  text: "AC",
                  onTap: () {
                    textEditingController.text = "0";
                  },
                  color: Colors.brown,
                ),
                Button(
                  text: "-/+",
                  onTap: () {},
                  color: Colors.brown,
                ),
                Button(
                  text: "%",
                  onTap: () {},
                  color: Colors.brown,
                ),
                Button(
                  text: "/",
                  onTap: () {},
                  color: Colors.yellow[800],
                ),
              ],
            ),
            Row(
              children: [
                Button(
                  text: "7",
                  onTap: () {
                    _addNo(7);
                  },
                ),
                Button(
                  text: "8",
                  onTap: () {
                    _addNo(8);
                  },
                ),
                Button(
                  text: "9",
                  onTap: () {
                    _addNo(9);
                  },
                ),
                Button(
                  text: "X",
                  onTap: () {},
                  color: Colors.yellow[800],
                ),
              ],
            ),
            Row(
              children: [
                Button(
                  text: "4",
                  onTap: () {
                    _addNo(4);
                  },
                ),
                Button(
                  text: "5",
                  onTap: () {
                    _addNo(5);
                  },
                ),
                Button(
                  text: "6",
                  onTap: () {
                    _addNo(6);
                  },
                ),
                Button(
                  text: "-",
                  onTap: () {},
                  color: Colors.yellow[800],
                ),
              ],
            ),
            Row(
              children: [
                Button(
                  text: "1",
                  onTap: () {
                    _addNo(1);
                  },
                ),
                Button(
                  text: "2",
                  onTap: () {
                    _addNo(2);
                  },
                ),
                Button(
                  text: "3",
                  onTap: () {
                    _addNo(3);
                  },
                ),
                Button(
                  text: "+",
                  onTap: () {},
                  color: Colors.yellow[800],
                ),
              ],
            ),
            Row(
              children: [
                Button(
                  text: "0",
                  onTap: () {
                    _addNo(0);
                  },
                  width: MediaQuery.of(context).size.width / 2,
                ),
                Button(
                  text: ".",
                  onTap: () {},
                ),
                Button(
                  text: "=",
                  onTap: () {},
                  color: Colors.yellow[800],
                ),
              ],
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.text,
    required this.onTap,
    this.color = Colors.brown,
    this.width = 0.0,
  });
  final String text;
  final Function onTap;
  final Color? color;
  final double width;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: width == 0 ? MediaQuery.of(context).size.width / 4 : width,
        height: MediaQuery.of(context).size.height / 6,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 0.5),
          color: color,
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}

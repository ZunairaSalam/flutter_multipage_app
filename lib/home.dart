import 'package:pattern_formatter/pattern_formatter.dart';
import 'package:flutter/material.dart';
import 'calculation.dart';

class Home extends StatelessWidget {
  final String userName;
  Home({Key key, @required this.userName}) : super(key: key);

  TextEditingController firstNumController = new TextEditingController();
  TextEditingController secNumController = new TextEditingController();

  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(userName),
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: TextField(
              controller: firstNumController,
              //Only allow to enter numbers
              inputFormatters: [ThousandsFormatter()],
              //controller: textFieldController,
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: TextField(
              controller: secNumController,
              keyboardType: TextInputType.number,
              inputFormatters: [ThousandsFormatter()],
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (firstNumController.text == '' ||
                  secNumController.text == '') {
                showDialog(
                    context: ctxt,
                    builder: (ctxt) => new AlertDialog(
                          title: Text("Empty Field!"),
                          content: Text('Please fill all fields!'),
                        ));
              } else {
                Navigator.push(
                  ctxt,
                  new MaterialPageRoute(
                      builder: (ctxt) => new CalculationView(
                            firstNum: int.parse(firstNumController.text),
                            secondNum: int.parse(secNumController.text),
                          )),
                );
              }
            },
            child: Text(
              'Proceed',
              style: TextStyle(fontSize: 24),
            ),
          )
        ]));
  }
}

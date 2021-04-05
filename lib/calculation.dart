import 'package:flutter/material.dart';

class CalculationView extends StatefulWidget {
  final int firstNum;
  final int secondNum;
  CalculationView({Key key, @required this.firstNum, @required this.secondNum})
      : super(key: key);
  @override
  _CalculationViewState createState() =>
      _CalculationViewState(firstNum, secondNum);
}

class _CalculationViewState extends State<CalculationView> {
  var firstNum;
  var secondNum;
  _CalculationViewState(this.firstNum, this.secondNum); //constructor
  int sum1 = 0, sum2 = 0, sum3 = 0, sum4 = 0, sumNum = 0, total = 0;
//sum1=1+firstNum;
  @override
  Widget build(BuildContext ctxt) {
    sum1 = 1 + firstNum;
    sum2 = 2 + secondNum;
    sumNum = firstNum + secondNum;
    sum3 = 3 + firstNum;
    sum4 = 4 + secondNum;
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Back'),
        ),
        body: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              color: Colors.grey[350],
              width: double.infinity,
              child: Text(
                'Section: ${sum1 + sum2}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              child: Text(
                '1 + $firstNum  = $sum1',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              child: Text(
                '2 + $secondNum  = $sum2',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              child: Text(
                'Total:  3 + $sumNum = ${sum1 + sum2}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            //second section
            Container(
              color: Colors.grey[350],
              width: double.infinity,
              child: Text(
                'Section: ${sum3 + sum4}',
                style: TextStyle(
                    fontSize: 20,
                    backgroundColor: Colors.grey[350],
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              child: Text(
                '3 + $firstNum  = $sum3',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              child: Text(
                '4 + $secondNum  = $sum4',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              child: Text(
                'Total:  7 + $sumNum = ${sum3 + sum4}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ));
  }
}

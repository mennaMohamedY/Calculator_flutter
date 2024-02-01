

import 'dart:math';

import 'package:flutter/cupertino.dart';

import 'btns.dart';

class CalculatorDesign extends StatefulWidget{
  @override
  State<CalculatorDesign> createState() => _CalculatorDesignState();
}

class _CalculatorDesignState extends State<CalculatorDesign> {
  String ScreenResult = ' ';

  String Operator = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(child: Row(
          crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text("$ScreenResult", style: TextStyle(fontSize: 22),)
        ],),),
        Expanded(
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SingleBtn(symbol: "7", OnBtnClicked: OnBtnClicked),
                SingleBtn(symbol: "8", OnBtnClicked: OnBtnClicked),
                SingleBtn(symbol: "9", OnBtnClicked: OnBtnClicked),
                SingleBtn(symbol: "x", OnBtnClicked: OnOperationClicked)
              ]),
        ),
        Expanded(
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SingleBtn(symbol: "4", OnBtnClicked: OnBtnClicked),
                SingleBtn(symbol: "6", OnBtnClicked: OnBtnClicked),
                SingleBtn(symbol: "5", OnBtnClicked: OnBtnClicked),
                SingleBtn(symbol: "+", OnBtnClicked: OnOperationClicked)
              ]),
        ),
        Expanded(
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SingleBtn(symbol: "1", OnBtnClicked: OnBtnClicked),
                SingleBtn(symbol: "2", OnBtnClicked: OnBtnClicked),
                SingleBtn(symbol: "3", OnBtnClicked: OnBtnClicked),
                SingleBtn(symbol: "-", OnBtnClicked: OnOperationClicked)
              ]),
        ),
        Expanded(
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SingleBtn(symbol: ".", OnBtnClicked: OnBtnClicked),
                SingleBtn(symbol: "0", OnBtnClicked: OnBtnClicked),
                SingleBtn(symbol: "/", OnBtnClicked: OnOperationClicked),
                SingleBtn(symbol: "=", OnBtnClicked: OnEqualClicked)
              ]),
        ),
        Expanded(
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SingleBtn(symbol: "ClR", OnBtnClicked: OnClearClicked),
                SingleBtn(symbol: "%", OnBtnClicked: OnOperationClicked),
                SingleBtn(symbol: "del", OnBtnClicked: OnDelClicked),
                SingleBtn(symbol: "sqrt", OnBtnClicked: OnSQRTClicked)
              ]),
        )

      ],);
  }

  void OnClearClicked(String symbol){
    setState(() {
      ScreenResult='';
    });
    ScreenResult='';
    Operator='';
    rightHandSide=0;
    leftHandSide=0;
    troubleShooting();
  }

  void OnDelClicked(String symbol){
    var del=double.parse(ScreenResult);
    del =del/10;
    var newResult=del.toInt();
    setState(() {
      ScreenResult=newResult.toString();
    });
    troubleShooting();
  }

  void troubleShooting(){
    print("==============================================================");
    print("Screen Result $ScreenResult");
    print("Operator {$Operator}");
    print("Rigt handside ${rightHandSide}");
    print("left handside ${leftHandSide}");
  }

  void OnSQRTClicked(String symbol){
    var sqrtt=double.parse(ScreenResult);
    var newResult=sqrt(sqrtt);
    setState(() {
      ScreenResult=newResult.toString();
    });
    troubleShooting();
  }

  void OnBtnClicked(String symbol) {
    ScreenResult += symbol;
    setState(() {
      troubleShooting();
      if (Operator.isNotEmpty) {
        rightHandSide = double.parse(ScreenResult);
      }
    });
  }

  double leftHandSide = 0.0;

  double rightHandSide = 0.0;

  //55+3
  void OnOperationClicked(String symbol) {
    Operator = symbol;
    leftHandSide=double.parse(ScreenResult);
    ScreenResult='';
    troubleShooting();
  }

  void OnEqualClicked(String symbol){
    rightHandSide=double.parse(ScreenResult);
    troubleShooting();
    Calculate(Operator,leftHandSide,rightHandSide);
  }

  void Calculate(String Operator,double leftHandSide, double rightHandSide){
    troubleShooting();

    setState(() {
      if (Operator == "x") {
        ScreenResult = (leftHandSide * rightHandSide).toString();
        leftHandSide=double.parse(ScreenResult);
      } else if (Operator == "/") {
        ScreenResult = (leftHandSide / rightHandSide).toString();
        leftHandSide=double.parse(ScreenResult);

      } else if (Operator == "-") {
        ScreenResult = (leftHandSide - rightHandSide).toString();
        leftHandSide=double.parse(ScreenResult);

      } else if (Operator == "+") {
        ScreenResult = (leftHandSide + rightHandSide).toString();
        leftHandSide=double.parse(ScreenResult);

      } else if (Operator == "%") {
        ScreenResult = (leftHandSide % rightHandSide).toString();
        leftHandSide=double.parse(ScreenResult);

      }
    });
  }
}
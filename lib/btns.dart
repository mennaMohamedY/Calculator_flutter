

import 'package:flutter/material.dart';


class SingleBtn extends StatelessWidget{
  String symbol;
  Function OnBtnClicked;
  SingleBtn({required this.symbol, required this.OnBtnClicked});
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(margin: EdgeInsets.all(2),
        child: ElevatedButton(onPressed: (){OnBtnClicked(symbol);
    },
        child: Text("${symbol}",style: TextStyle(fontSize: 24),))))
    ;
  }

}
import 'package:flutter/material.dart';

class Todocard extends StatelessWidget {
 final String cardtitle;
  final bool doneorno;

  const Todocard({ super.key,required this.cardtitle,required this.doneorno});
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,

      child: Container(
        width: 333,
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color.fromRGBO(209, 209, 224, 0.2),
          borderRadius: BorderRadius.circular(33),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(cardtitle), Icon(
            doneorno? Icons.check
             :Icons.close,
             size: 33,
             color: doneorno?Colors.green:Colors.red,
          )],
        ),
      ),
    );
  }
}
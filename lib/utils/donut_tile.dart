import 'package:flutter/material.dart';

class DonutTile extends StatelessWidget {
  final String donutFlavor;
  final String donutPrice;
  //Tipo de color  
  final dynamic donutColor;
  final String imageName;

  const DonutTile({super.key, required this.donutFlavor, required this.donutPrice, required this.donutColor, required this.imageName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: donutColor[100],
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(children: [
          //PriceTag
          Row(
            //Aliena a la derecha
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: donutColor[200],
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(24), 
                    bottomLeft: Radius.circular(24))
                ),
                  padding: 
                      const EdgeInsets.symmetric(vertical: 8, horizontal:  18),
                  child: Text('\$$donutPrice', 
                  style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: donutColor[800])),
              )
            ],
          ),
          //Donut Picture
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 34),
            child: Image.asset(imageName))
          //Donut Text

          //Love icon + add button
        ],),
      ),
    );
  }
}
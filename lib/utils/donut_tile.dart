import 'package:flutter/material.dart';

class DonutTile extends StatelessWidget {
  final String donutFlavor;
  final String donutPrice;
  //Tipo de color  
  final dynamic donutColor;
  final String imageName;
  
  final String donutMark;

  const DonutTile({super.key, required this.donutFlavor, required this.donutMark, required this.donutPrice, required this.donutColor, required this.imageName});

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
                  fontSize: 14,
                  color: donutColor[800])),
              )
            ],
          ),
          //Donut Picture
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 34),
            child: Image.asset(imageName)),
          //Donut Text
          Text(donutFlavor,
              style: 
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              //Texto con espacio
              const SizedBox(
                height: 4,
              ),
              //Agregar todo el Texto
          Text(donutMark,
              style: 
                const TextStyle(fontWeight: FontWeight.normal, fontSize: 10),),
              //Texto con espacio
              const SizedBox(
                height: 4,
              ),
          //Love icon + add button
              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16), // Espaciado lateral
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Elementos en las esquinas
                children: [
                  Icon(Icons.favorite_border, color: Colors.grey.shade700), // Corazón a la izquierda
                  const Text(
                    'Add',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                  ), // "Add" a la derecha
                ],
              ),
            ),

            const SizedBox(height: 12), // Espaciado final
          ],
        ),
      ),
    );
  }
}
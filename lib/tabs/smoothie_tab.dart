
import 'package:donut_app_2b_acosta/models/product.dart';
import 'package:donut_app_2b_acosta/utils/donut_tile.dart';
import 'package:flutter/material.dart';

class SmoothieTab extends StatelessWidget {
  final Function(Product) addToCart;
//listas de donas
  final List burgersOnSale = [
    [
      "Watermelon",
      "FrutaViva 🍓🥭",
      "45",
      Colors.orange,
      "lib/images/Smoothie1.png"
    ],
    [
      "Blueberry",
      "SmoothieFlow 🌀🍍",
      "55",
      Colors.red,
      "lib/images/Smoothie2.png"
    ],
    [
      "Kiwi",
      "Tropical Bliss 🌴🍌",
      "65",
      Colors.yellow,
      "lib/images/Smoothie3.png"
    ],
    [
      "Orange",
      "VitaShake 🥝🍓",
      "50",
      Colors.green,
      "lib/images/Smoothie4.png"
    ],
    [
      "Watermelon",
      "ZumoZen 🍊🧘‍♂️",
      "60",
      Colors.brown,
      "lib/images/Smoothie1.png"
    ],
    [
      "Blueberry",
      "GreenVibes 🥬🍏",
      "40",
      Colors.cyan,
      "lib/images/Smoothie2.png"
    ],
    [
      "Kiwi",
      "FruityRush 🍉⚡",
      "58",
      Colors.deepOrange,
      "lib/images/Smoothie3.png"
    ],
    [
      "Orange",
      "BerryBoom 🍓💥",
      "48",
      Colors.green,
      "lib/images/Smoothie4.png"
    ],
  ];

  SmoothieTab({super.key, required this.addToCart});

  @override
  Widget build(BuildContext context) {
    //widget para usar cuadricula
    return GridView.builder(
      //Cuantos elementos hay en una cuadricula
      itemCount: burgersOnSale.length,
      padding: EdgeInsets.all(12),
      //Organizan como se veran/distribuiran los elmentos
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //Cuántas colu mnas usare
        crossAxisCount: 2,
        //Relación de aspecto (proporción)
        childAspectRatio: 1 / 1.5,
      ),
      itemBuilder: (context, index) {
        //cada elemento individual
        return DonutTile(
            donutFlavor: burgersOnSale[index][0],
            donutMark: burgersOnSale[index][1],
            donutPrice: burgersOnSale[index][2].toString(),
            donutColor: burgersOnSale[index][3],
            imageName: burgersOnSale[index][4],
            onAddToCart: () {
              double price = double.parse(burgersOnSale[index][2]);
              addToCart(Product(
                name: burgersOnSale[index][0],
                price: price,
                id: index,
                stock: 1
              ));
            });
      },
    );
  }
}

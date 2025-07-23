
import 'package:donut_app_2b_acosta/models/product.dart';
import 'package:donut_app_2b_acosta/utils/donut_tile.dart';
import 'package:flutter/material.dart';

class PancakesTab extends StatelessWidget {
  final Function(Product) addToCart;
//listas de donas
  final List burgersOnSale = [
    [
      "Classic",
      "Fluffy Stack 🥞",
      "45",
      Colors.orange,
      "lib/images/Pancakes1.png"
    ],
    [
      "Red Velvet",
      "Maple Heaven 🍁",
      "55",
      Colors.red,
      "lib/images/Pancakes2.png"
    ],
    [
      "Cherry",
      "Pancake Bliss ✨",
      "65",
      Colors.yellow,
      "lib/images/Pancakes3.png"
    ],
    [
      "Banana Caramel",
      "The Golden Griddle 🔥",
      "50",
      Colors.green,
      "lib/images/Pancakes4.png"
    ],
    [
      "Classic",
      "Berry Pancakes 🫐",
      "60",
      Colors.brown,
      "lib/images/Pancakes1.png"
    ],
    [
      "Red Velvet",
      "Syrup & Butter 🍯🧈",
      "40",
      Colors.cyan,
      "lib/images/Pancakes2.png"
    ],
    [
      "Cherry",
      "Morning Stacks ☀️",
      "58",
      Colors.deepOrange,
      "lib/images/Pancakes3.png"
    ],
    [
      "Banana Caramel",
      "Sweet Flapjacks 🍓",
      "48",
      Colors.green,
      "lib/images/Pancakes4.png"
    ],
  ];

  PancakesTab({super.key, required this.addToCart});

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

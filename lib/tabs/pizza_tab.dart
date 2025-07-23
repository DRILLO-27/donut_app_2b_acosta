
import 'package:donut_app_2b_acosta/models/product.dart';
import 'package:donut_app_2b_acosta/utils/donut_tile.dart';
import 'package:flutter/material.dart';

class PizzaTab extends StatelessWidget {
  final Function(Product) addToCart;
//listas de donas
  final List burgersOnSale = [
    [
      "Simple",
      "Pizza Nova 🍕",
      "45",
      Colors.orange,
      "lib/images/Pizza1.png"
    ],
    [
      "Spicy Honey Pepperoni",
      "Molto Bene Pizzería",
      "55",
      Colors.red,
      "lib/images/Pizza2.png"
    ],
    [
      "Truffle & Mushroom",
      "Slice & Dice 🎲",
      "65",
      Colors.yellow,
      "lib/images/Pizza3.png"
    ],
    [
      "Mediterranean Delight",
      "La Forchetta 🍴",
      "50",
      Colors.green,
      "lib/images/Pizza4.png"
    ],
    [
      "Fries Burger",
      "Urban Crust 🌆",
      "60",
      Colors.brown,
      "lib/images/Pizza1.png"
    ],
    [
      "Spicy Honey Pepperoni",
      "Forno Mágico 🔥",
      "40",
      Colors.cyan,
      "lib/images/Pizza2.png"
    ],
    [
      "Truffle & Mushroom",
      "Cheesy Bites 🧀",
      "58",
      Colors.deepOrange,
      "lib/images/Pizza3.png"
    ],
    [
      "Mediterranean Delight",
      "Rustic Dough 🌿",
      "48",
      Colors.green,
      "lib/images/Pizza4.png"
    ],
  ];

  PizzaTab({super.key, required this.addToCart});

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

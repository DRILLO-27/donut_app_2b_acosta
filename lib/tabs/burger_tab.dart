
import 'package:donut_app_2b_acosta/models/product.dart';
import 'package:donut_app_2b_acosta/utils/donut_tile.dart';
import 'package:flutter/material.dart';

class BurgerTab extends StatelessWidget {
  final Function(Product) addToCart;
//listas de donas
  final List burgersOnSale = [
    [
      "Classic Burger",
      "Burger House",
      "45",
      Colors.orange,
      "lib/images/Burger1.png"
    ],
    [
      "Bacon Cheeseburger",
      "Grill Masters",
      "55",
      Colors.red,
      "lib/images/Burger2.png"
    ],
    [
      "Double Cheeseburger",
      "Cheesy Bites",
      "65",
      Colors.yellow,
      "lib/images/Burger3.png"
    ],
    [
      "Egg Burger",
      "Morning Bites",
      "50",
      Colors.green,
      "lib/images/Burger4.png"
    ],
    [
      "Fries Burger",
      "Crispy Corner",
      "60",
      Colors.brown,
      "lib/images/Burger1.png"
    ],
    [
      "Simple Burger",
      "Minimalist Grill",
      "40",
      Colors.cyan,
      "lib/images/Burger2.png"
    ],
    [
      "Spicy Burger",
      "Hot & Spicy",
      "58",
      Colors.deepOrange,
      "lib/images/Burger3.png"
    ],
    [
      "Veggie Burger",
      "Green Bites",
      "48",
      Colors.green,
      "lib/images/Burger4.png"
    ],
  ];

  BurgerTab({super.key, required this.addToCart});

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

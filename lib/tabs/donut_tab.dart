
import 'package:donut_app_2b_acosta/models/product.dart';
import 'package:donut_app_2b_acosta/utils/donut_tile.dart';
import 'package:flutter/material.dart';

class DonutTab extends StatelessWidget {
  final Function(Product) addToCart;
//listas de donas
  final List burgersOnSale = [
    [
      "Matcha Bliss",
      "Sweet Rings 🍩",
      "45",
      Colors.orange,
      "lib/images/Donut1.png"
    ],
    [
      "Caramelo Salado",
      "DonaLandia 🎡",
      "55",
      Colors.red,
      "lib/images/Donut2.png"
    ],
    [
      "Mango-Chile ",
      "Glaze & Glory ✨",
      "65",
      Colors.yellow,
      "lib/images/Donut3.png"
    ],
    [
      "Cookies & Cream",
      "Sugar Loop 🔄",
      "50",
      Colors.green,
      "lib/images/Donut4.png"
    ],
    [
      "Matcha Bliss",
      "Doughlicious 😋",
      "60",
      Colors.brown,
      "lib/images/Donut1.png"
    ],
    [
      "Caramelo Salado",
      "La Casa de la Dona 🏡",
      "40",
      Colors.cyan,
      "lib/images/Donut2.png"
    ],
    [
      "Mango Chile",
      "Donut Factory 🏭",
      "58",
      Colors.deepOrange,
      "lib/images/Donut3.png"
    ],
    [
      "Cookies & Cream",
      "Golden Bite 🌟",
      "48",
      Colors.green,
      "lib/images/Donut4.png"
    ],
  ];

  DonutTab({super.key, required this.addToCart});

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
              ));
            });
      },
    );
  }
}

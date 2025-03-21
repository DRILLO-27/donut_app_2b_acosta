import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final String productFlavor;
  final String productMark;
  final String productPrice;
  //Dynamic porque será de tipo COLOR
  final dynamic productColor;
  final dynamic imageName;
  final VoidCallback onAddToCart;

  const ProductTile({
    super.key,
    required this.productFlavor,
    required this.productMark,
    required this.productPrice,
    this.productColor,
    this.imageName,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
            color: productColor[50], borderRadius: BorderRadius.circular(24)),
        child: Column(
          children: [
            //PriceTag

            Row(
              //Alinea a la derecha
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: productColor[100],
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(24),
                          topRight: Radius.circular(24))),
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: Text(
                    '\$$productPrice',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: productColor[800]),
                  ),
                )
              ],
            ),
            //product Picture
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Image.asset(imageName),
            ),

            //product Flavor Text
            Text(
              productFlavor,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            //Espacio entre texto
            SizedBox(
              height: 4,
            ),
            Text(
              productMark,
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
            ),

            //Iconos
            Padding(
              padding: const EdgeInsets.only(bottom: 15, right: 25, left: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Lógica para favoritos
                    },
                    child: Icon(
                      Icons.favorite_border,
                      size: 24,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: onAddToCart,
                    child: Text(
                      "Add",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            )

            //todo:
            //buttons
          ],
        ),
      ),
    );
  }
}

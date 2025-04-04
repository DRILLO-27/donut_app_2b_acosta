import 'package:flutter/material.dart';

class DonutTile extends StatefulWidget {
  final String donutFlavor;
  final String donutMark;
  final String donutPrice;
  final dynamic donutColor;
  final dynamic imageName;
  final VoidCallback onAddToCart;

  const DonutTile({
    super.key,
    required this.donutFlavor,
    required this.donutMark,
    required this.donutPrice,
    this.donutColor,
    this.imageName,
    required this.onAddToCart,
  });

  @override
  _DonutTileState createState() => _DonutTileState();
}

class _DonutTileState extends State<DonutTile> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
            color: widget.donutColor[50], borderRadius: BorderRadius.circular(24)),
        child: Column(
          children: [
            // Price Tag
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: widget.donutColor[100],
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(24),
                          topRight: Radius.circular(24))),
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: Text(
                    '\$${widget.donutPrice}',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: widget.donutColor[800]),
                  ),
                )
              ],
            ),
            // Donut Picture
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Image.asset(widget.imageName),
            ),
            // Donut Flavor Text
            Text(
              widget.donutFlavor,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            SizedBox(height: 4),
            Text(
              widget.donutMark,
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 10),
            ),
            // Icons
            Padding(
              padding: const EdgeInsets.only(bottom: 15, right: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: toggleFavorite,
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      size: 20,
                      color: isFavorite ? Colors.red : Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.onAddToCart,
                    child: Text(
                      "Add",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

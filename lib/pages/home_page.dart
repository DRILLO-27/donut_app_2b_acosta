import 'package:donut_app_2b_acosta/models/product.dart';
import 'package:donut_app_2b_acosta/tabs/burger_tab.dart';
import 'package:donut_app_2b_acosta/tabs/donut_tab.dart';
import 'package:donut_app_2b_acosta/tabs/pancakes_tab.dart';
import 'package:donut_app_2b_acosta/tabs/pizza_tab.dart';
import 'package:donut_app_2b_acosta/tabs/smoothie_tab.dart';
import 'package:donut_app_2b_acosta/utils/my_tab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> myTabs = [
    const MyTab(iconPath: 'lib/icons/donut.png'),
    const MyTab(iconPath: 'lib/icons/burger.png'),
    const MyTab(iconPath: 'lib/icons/smoothie.png'),
    const MyTab(iconPath: 'lib/icons/pancakes.png'),
    const MyTab(iconPath: 'lib/icons/pizza.png')
  ];
  // Estado del carrito
  List<Product> cartItems = [];
  double totalPrice = 0.0;

  // Método para agregar un producto al carrito
  void addToCart(Product product) {
    setState(() {
      cartItems.add(product);
      totalPrice += product.price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: Icon(Icons.menu, color: Colors.grey[800]),
            //Ícono derecho
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 24),
                child: Icon(Icons.person),
              )
            ],
          ),
          body: Column(
            children: [
              //Texto principal
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 36, vertical: 18),
                child: Row(
                  children: [
                    Text("I want to ", style: TextStyle(fontSize: 32)),
                    Text("Eat",
                        style: TextStyle(
                            //Tamaño de letra
                            fontSize: 32,
                            //Negritas
                            fontWeight: FontWeight.bold,
                            //Subrayado
                            decoration: TextDecoration.underline))
                  ],
                ),
              ),

              //Pestañas (TapBar)
              TabBar(tabs: myTabs),
              //Contenido de pestañas (TabBarView)
              Expanded(
                child: TabBarView(
                  children: [
                    DonutTab(addToCart: addToCart),
                    BurgerTab(addToCart: addToCart),
                    SmoothieTab(addToCart: addToCart),
                    PancakesTab(addToCart: addToCart),
                    PizzaTab(addToCart: addToCart)
                  ],
                ),
              ),
              //Carrito (Cart)
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(16),
                child: Row(
                  //Alinear los elementos a los extremos
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        //Alinear horizontalmente una columna
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "${cartItems.length} items | \$${totalPrice.toStringAsFixed(2)}",
                              style: TextStyle(
                                //tamaño de letra
                                fontSize: 18,
                                //negritas
                                fontWeight: FontWeight.bold,
                              )),
                          Text("Delivery Charges Included"),
                        ],
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink,
                            padding: EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12)),
                        child: Row(
                          children: [
                            Icon(Icons.shopping_cart, color: Colors.white),
                            SizedBox(width: 10),
                            Text(
                              'View  Cart',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ))
                  ],
                ),
              )
            ],
          )),
    );
  }
}

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
  //Lista de Tabs
  List<Widget> myTabs = [
    //Donut Tab
    MyTab(iconPath: 'lib/icons/donut.png'),
    //Burger Tab
    MyTab(iconPath: 'lib/icons/burger.png'),
    //Smoothie Tab
    MyTab(iconPath: 'lib/icons/smoothie.png'),
    //Pancake Tab
    MyTab(iconPath: 'lib/icons/pancakes.png'),
    //Pizza Tab
    MyTab(iconPath: 'lib/icons/pizza.png')
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length:  5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          //Icono Izquierdo
          leading: Icon(Icons.menu, 
          color: Colors.greenAccent[800],),
          //Iconone Derecho
          actions: const[
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Icon(Icons.person),
            )
          ],
        ),
        body: Column(children: [
          //Texto principal
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 18),
            child: Row(
              children: [
                Text("I want to ", style: TextStyle(fontSize: 32)),
                Text("Eat", style: TextStyle(
                  //Tamaño de Letra
                  fontSize: 32, 
                  //Negrita
                  fontWeight: FontWeight.bold, 
                  //Subrayado
                  decoration: TextDecoration.underline))
              ],
            ),
          ),
          //TabBar
          TabBar(tabs: myTabs),
          //TabBarView
          Expanded(
            child: TabBarView(children: [
              DonutTab(),
              BurgerTab(),
              SmoothieTab(),
              PancakesTab(),
              PizzaTab()
            ]),
          ),

          //Carrito
        ],)
      ),
    );
  }
}
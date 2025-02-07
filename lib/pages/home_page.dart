import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        //Icono Izquierdo
        leading: Icon(Icons.menu, 
        color: Colors.greenAccent[800],),
        //Iconone Derecho
        actions: [
          Icon(Icons.person)
        ],
      ),
    );
  }
}
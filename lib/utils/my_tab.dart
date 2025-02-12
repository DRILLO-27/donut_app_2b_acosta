import 'package:flutter/material.dart';

class MyTab extends StatelessWidget {
  final String iconPath;
  const MyTab({super.key, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 50,
      child: Container(
       padding: EdgeInsets.all(8),
       //Bordes redondeados
       decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey[200]
       ),
        child: Image.asset(iconPath, color: Colors.grey[600]),
      ),
    );
  }
}
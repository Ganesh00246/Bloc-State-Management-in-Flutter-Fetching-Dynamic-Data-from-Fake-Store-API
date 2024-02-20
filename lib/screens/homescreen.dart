import 'package:flutter/material.dart';
import 'package:untitled8/screens/product_screen.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Center(
        child: TextButton(
          child: Text('Click to Move on'),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductsScreen()));
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled8/products_bloc.dart';
import 'package:untitled8/repo/products_repo.dart';
import 'package:untitled8/screens/homescreen.dart';

void main() {
  runApp(RepositoryProvider(
    create: (context) => ProductsRepo(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => ProductsBloc(ProductsRepo()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:untitled8/products_bloc.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}


class _ProductsScreenState extends State<ProductsScreen> {
  @override
  initState() {
    context.read<ProductsBloc>().add(ProductsLoadeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: BlocBuilder<ProductsBloc, ProductsState>(
      //   builder: (context, state) {
      //     if(state is ProductsLoadingState){
      //       return Center(child: CircularProgressIndicator.adaptive());
      //     } else if(state is ProductsLoadedState){
      //       return ListView.builder(itemBuilder: (context,index){
      //         return ListTile(
      //           title: Text(state.productsModel[index].category.toString()),
      //         );
      //       },itemCount: state.productsModel.length,);
      //     } else if(state is ProductsErrorState){
      //       return Text(state.errorState);
      //     }
      //     return SizedBox();
      //   },
      // ),

      //
      // body: BlocListener<ProductsBloc, ProductsState>(
      //
      //   child: Center(
      //     child: Text("Block Listnear"),
      //   ),
      // ),


      body: BlocConsumer<ProductsBloc, ProductsState>(
        listener: (context, state) {
         if(state is ProductsLoadedState){
           Get.snackbar('thdd', 'sucessfull');
         }else{
           Get.snackbar('thdd', 'Failed data');
         }
        },
        builder: (context, state) {
              if(state is ProductsLoadingState){
                return Center(child: CircularProgressIndicator.adaptive());
              } else if(state is ProductsLoadedState){
                return ListView.builder(itemBuilder: (context,index){
                  return ListTile(
                    title: Text(state.productsModel[index].category.toString()),
                  );
                },itemCount: state.productsModel.length,);
              } else if(state is ProductsErrorState){
                return Text(state.errorState);
              }
              return SizedBox();
            },

      ),
    );
  }
}

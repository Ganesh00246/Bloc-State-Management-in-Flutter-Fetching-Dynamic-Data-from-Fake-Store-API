import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart'as http;
import 'package:untitled8/repo/products_repo.dart';

import 'models/products_model.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsLoadeEvent, ProductsState> {
  final ProductsRepo  productsRepo;
  ProductsBloc(this.productsRepo) : super(ProductsLoadingState()) {
    on<ProductsLoadeEvent>((event, emit) async{
      try{
        emit(ProductsLoadingState());
        var data = await productsRepo.getProducts();
        emit(ProductsLoadedState(data));

        
      }catch(e){
        emit(ProductsErrorState(e.toString()));
      }
    });
  }
}

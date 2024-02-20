part of 'products_bloc.dart';

@immutable
abstract class ProductsState extends Equatable{
  List<Object?> get props => [];
}

class ProductsInitial extends ProductsState {}

class ProductsLoadingState extends ProductsState {}
class ProductsLoadedState extends ProductsState {
  @override
  final List<ProductsModel> productsModel;

  ProductsLoadedState(this.productsModel);
  List<Object?> get props => [productsModel];
}
class ProductsErrorState extends ProductsState {
  final String errorState;

  ProductsErrorState(this.errorState);
  @override
  List<Object?> get props => [errorState];
}
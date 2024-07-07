part of 'product_list_bloc.dart';

sealed class ProductListEvent extends Equatable {
  const ProductListEvent();

  @override
  List<Object> get props => [];
}

class ProductListInit extends ProductListEvent{
  //این میتونه ایدی باشه یا کلید سرچ باشه یا هرچی این قرار هست یک پارامتر باشه
  final param;
  ProductListInit({required this.param});
   @override
  List<Object> get props => [param];

}

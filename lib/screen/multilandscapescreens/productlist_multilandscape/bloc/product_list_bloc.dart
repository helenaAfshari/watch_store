import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watch_store_app/data/model/product.dart';
import 'package:watch_store_app/data/repository/product_repo.dart';
import 'package:watch_store_app/data/src/product_data_src.dart';

part 'product_list_event.dart';
part 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final InterfaceProductRepo _iproductRepo;
  ProductListBloc(this._iproductRepo) : super(ProductListLoading()) {
    on<ProductListEvent>((event, emit) async {
   if (event is ProductListInit) {
      try{
        emit(ProductListLoading());
        final list = await _iproductRepo.getAllByCategory(event.param);
        emit(ProductListLoaded(list));
      }catch(e){
   emit(ProductListError());
      }
   }
    });
  }
}

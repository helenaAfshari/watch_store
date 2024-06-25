import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watch_store_app/data/model/product_details.dart';
import 'package:watch_store_app/data/repository/product_repo.dart';

part 'product_single_event.dart';
part 'product_single_state.dart';

class ProductSingleBloc extends Bloc<ProductSingleEvent, ProductSingleState> {
  final InterfaceProductRepo _iproductRepo;
  ProductSingleBloc(this._iproductRepo) : super(ProductSingleLoading()) {
    on<ProductSingleEvent>((event, emit) async {
    if(event is ProductSingleInit){
      try{
         emit(ProductSingleLoading());
         final productDetail = await _iproductRepo.getProductDetails(event.id);
         emit(ProductSingleLoaded(productDetail));
         
      }catch(e){
        emit(ProductSingleError());
      }
    }
    });
  }
}

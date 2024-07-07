import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watch_store_app/data/model/cart.dart';
import 'package:watch_store_app/data/repository/cart_repo.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final ICartRepository _cartRepository;
  CartBloc(this._cartRepository) : super(CartInitialState()) {
    on<CartEvent>((event, emit) async {
      try {
         if(event is CartInitEvent){
          emit(CartLoadingState());
          final cartList = await _cartRepository.getUserCart();
          emit(CartLoadedState(cartList));
         }else if(event is RemoveFromCartEvent){
           await _cartRepository.removeFromCart(productId: event.productId).then((value) =>
            emit(CartItemRemovedState(value)),
            );
         }else if(event is DeleteFromCartEvent){
            await _cartRepository.deleteFromCart(productId: event.productId).then((value) =>
            emit(CartItemDeletedState(value)));
         }else if(event is AddToCartEvent){
        
            await _cartRepository.addToCart(productId: event.productId).then((value) =>
            emit(CartItemAddedState(value)));
         }else if(event is CartItemCountEvent){
            await _cartRepository.countCartItems().then((value) =>
            emit(CartCountState()));
         }else if(event is PayEvent){
            await _cartRepository.payCart().then((value) =>
            emit(RecivedPayLinkState(url: value)));
         }
      } catch (e) {
        emit(CartErrorState());
      }
    });
  }
}

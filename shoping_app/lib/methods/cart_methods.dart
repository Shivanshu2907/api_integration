import 'package:shoping_app/modals/product_modat.dart';

class CartMethods {
  List<ProductModal> _cartItems = [];

  void addToCart(ProductModal product) {
    _cartItems.add(product);
  }

  List<ProductModal> returnCartItems() {
    return _cartItems;
  }

  bool deleteCartItem(ProductModal product) {
    _cartItems.remove(product);
    return true;
  }
}

import 'package:flutter/material.dart';
import 'package:shoping_app/methods/cart_methods.dart';
import 'package:shoping_app/modals/product_modat.dart';
import 'package:cool_alert/cool_alert.dart';
import '../globals.dart' as globals;

class Cart extends StatefulWidget {
  Cart({
    Key? key,
  }) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> with SingleTickerProviderStateMixin {
  final CartMethods _cartMethods = CartMethods();
  String url =
      "https://www.ifbappliances.com/media/catalog/product/cache/1/image/550x629/9df78eab33525d08d6e5fb8d27136e95/m/a/maxidry-550-side-angle-clothes-dryer_1.jpg";
  String okURL =
      "https://thumbs.dreamstime.com/b/placeholder-rgb-color-icon-image-gallery-photo-thumbnail-available-album-digital-media-multimedia-file-visual-content-snapshot-187369540.jpg";
  @override
  void initState() {
    super.initState();
  }

  _del(ProductModal product) {
    globals.cartItems.forEach(
      (element) {
        if (element.prodId == product.prodId) {
          globals.cartItems.remove(element);
          CoolAlert.show(
            context: context,
            type: CoolAlertType.success,
            text: 'Deleted',
            autoCloseDuration: const Duration(seconds: 2),
          );
          setState(() {});
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return globals.cartItems.isNotEmpty
        ? ListView.builder(
            itemCount: globals.cartItems.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                child: Card(
                  elevation: 7,
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                        child: FadeInImage.assetNetwork(
                          image:
                              globals.cartItems[index].prodImage.toString() ==
                                      url
                                  ? okURL
                                  : globals.cartItems[index].prodImage,
                          placeholder: 'assets/p.jpeg',
                          fit: BoxFit.contain,
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.shop_sharp),
                        title: Text(globals.cartItems[index].prodName),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Product MRP : ',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.6),
                                  ),
                                ),
                                Text(
                                  globals.cartItems[index].prodBuy,
                                  style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.black.withOpacity(0.6),
                                  ),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Selling Price : ',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6)),
                                ),
                                Text(
                                  globals.cartItems[index].prodSell,
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.6),
                                  ),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                            ButtonBar(
                              alignment: MainAxisAlignment.start,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    _del(globals.cartItems[index]);
                                  },
                                  child: const Text('Remove'),
                                ),
                              ],
                            ),
                          ],
                        ),
                        isThreeLine: true,
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        : const Center(
            child: Text("Your cart is empty !!!"),
          );
  }

  Icon starIcon(Color color) {
    return Icon(
      Icons.star,
      size: 10.0,
      color: color,
    );
  }
}

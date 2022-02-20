import 'package:flutter/material.dart';
import 'package:shoping_app/methods/cart_methods.dart';
import 'package:shoping_app/modals/product_modat.dart';
import 'package:cool_alert/cool_alert.dart';
import '../globals.dart' as globals;

class Product extends StatefulWidget {
  String imgurl;
  String buyCost;
  String sellcost;
  String productName;
  ProductModal product;

  Product({
    Key? key,
    required this.buyCost,
    required this.imgurl,
    required this.sellcost,
    required this.productName,
    required this.product,
  }) : super(key: key);

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  final CartMethods _cartMethods = CartMethods();

  bool _doesExist(ProductModal product) {
    bool doesExist = false;
    globals.cartItems.forEach(
      (element) {
        if (element.prodId == product.prodId) {
          doesExist = true;
        }
      },
    );
    return doesExist;
  }

  String url =
      "https://www.ifbappliances.com/media/catalog/product/cache/1/image/550x629/9df78eab33525d08d6e5fb8d27136e95/m/a/maxidry-550-side-angle-clothes-dryer_1.jpg";
  String okURL =
      "https://thumbs.dreamstime.com/b/placeholder-rgb-color-icon-image-gallery-photo-thumbnail-available-album-digital-media-multimedia-file-visual-content-snapshot-187369540.jpg";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
      child: Card(
        elevation: 7,
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: FadeInImage.assetNetwork(
                image: widget.imgurl == url ? okURL : widget.imgurl,
                placeholder: 'assets/p.jpeg',
                fit: BoxFit.contain,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.shop_sharp),
              title: Text(widget.productName),
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
                        widget.buyCost,
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
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                      Text(
                        widget.sellcost,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ],
              ),
              isThreeLine: true,
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (_doesExist(widget.product)) {
                      CoolAlert.show(
                          context: context,
                          type: CoolAlertType.warning,
                          text: 'Already exist in cart',
                          autoCloseDuration: const Duration(seconds: 2));
                    } else {
                      globals.cartItems.add(widget.product);
                      CoolAlert.show(
                          context: context,
                          type: CoolAlertType.success,
                          text: 'Item added to cart',
                          autoCloseDuration: const Duration(seconds: 2));
                    }
                  },
                  child: const Text('Add to Cart'),
                ),
              ],
            ),
          ],
        ),
      ),
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

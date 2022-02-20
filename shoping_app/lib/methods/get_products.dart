import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:shoping_app/modals/product_modat.dart';

class GetProducts {
  Future<List<ProductModal>> getProductsList() async {
    print("getting data");
    var url = Uri.parse('https://jsonkeeper.com/b/YIDG');

    var response = await Client().get(url);

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body)['data']['products'];

      List<ProductModal> products =
          body.map((e) => ProductModal.fromJSON(e)).toList();

      products.forEach((element) {
        print(element.prodName);
      });

      return products;
    } else {
      throw 'unnable to get data';
    }
  }
}

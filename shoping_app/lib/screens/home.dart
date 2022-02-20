import 'package:flutter/material.dart';
import 'package:shoping_app/methods/get_products.dart';
import 'package:shoping_app/modals/product_modat.dart';
import 'package:shoping_app/screens/cart.dart';
import 'package:shoping_app/screens/product.dart';
import '../globals.dart' as globals;

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    products_list(),
    Cart(),
  ];

  static final List<Widget> _titles = <Widget>[
    const Text("Product Page"),
    const Text("Cart Page"),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _titles.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
            backgroundColor: Colors.green,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      // ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}

class products_list extends StatelessWidget {
  products_list({Key? key}) : super(key: key);

  GetProducts getProducts = GetProducts();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getProducts.getProductsList(),
      builder:
          (BuildContext context, AsyncSnapshot<List<ProductModal>> snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  return Product(
                    buyCost: snapshot.data![index].prodBuy,
                    imgurl: snapshot.data![index].prodImage,
                    sellcost: snapshot.data![index].prodSell,
                    productName: snapshot.data![index].prodName,
                    product: snapshot.data![index],
                  );
                },
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}

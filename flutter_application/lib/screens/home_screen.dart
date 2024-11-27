import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
      id: 'p1',
      title: 'GRAND COURT 2.0 SHOES',
      description: 'Comfortable running shoes for daily use.',
      price: 99.99,
      imageUrl: 'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/384993c9818c48dfa66dae8901806bd2_9366/GRAND_COURT_2.0_SHOES_Black_GW9196_04_standard.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Run 70s Lifestyle Running Shoes',
      description: 'Comfortable running shoes for daily use.',
      price: 99.99,
      imageUrl: 'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/95d90912503f4738b029797b482d3d38_9366/Run_70s_Lifestyle_Running_Shoes_White_IF8764_04_standard.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Run Falcon 2.0 Shoes',
      description: 'Comfortable running shoes for daily use.',
      price: 99.99,
      imageUrl: 'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/85dc72457cac49a7afcaae8301341787_9366/Run_Falcon_2.0_Shoes_White_GV9571_04_standard.jpg',
    ),
    Product(
      id: 'p4',
      title: 'Busenitz Pro Shoes',
      description: 'Comfortable running shoes for daily use.',
      price: 99.99,
      imageUrl: 'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/dfb2593201f8422280c7a7fa00e4768a_9366/Busenitz_Pro_Shoes_Black_G48060_04_standard.jpg',
    ),
    Product(
      id: 'p5',
      title: 'Galaxy 6 Shoes',
      description: 'Comfortable running shoes for daily use.',
      price: 99.99,
      imageUrl: 'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/fbabdaf2b83c4e08bd0bae89000922d1_9366/Galaxy_6_Shoes_Blue_GW4139_04_standard.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shop ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: products.length,
        itemBuilder: (ctx, i) => ProductCard(product: products[i]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurpleAccent,
        onPressed: () {
          // Navigate to cart screen
        },
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}

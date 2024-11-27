import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
      id: 'p1',
      title: 'Running Shoes',
      description: 'Comfortable running shoes for daily use.',
      price: 59.99,
      imageUrl: 'https://via.placeholder.com/300/0000FF/FFFFFF?Text=Shoes',
    ),
    Product(
      id: 'p2',
      title: 'T-Shirt',
      description: 'Casual cotton t-shirt in multiple colors.',
      price: 19.99,
      imageUrl: 'https://via.placeholder.com/300/FF0000/FFFFFF?Text=T-Shirt',
    ),
    Product(
      id: 'p3',
      title: 'Wristwatch',
      description: 'Stylish wristwatch with leather strap.',
      price: 99.99,
      imageUrl: 'https://via.placeholder.com/300/FFFF00/000000?Text=Watch',
    ),
    Product(
      id: 'p4',
      title: 'Backpack',
      description: 'Durable backpack for daily commute.',
      price: 49.99,
      imageUrl: 'https://via.placeholder.com/300/00FF00/000000?Text=Backpack',
    ),
    Product(
      id: 'p5',
      title: 'Sunglasses',
      description: 'Polarized sunglasses for sunny days.',
      price: 29.99,
      imageUrl: 'https://via.placeholder.com/300/FF00FF/FFFFFF?Text=Sunglasses',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'E-Commerce',
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

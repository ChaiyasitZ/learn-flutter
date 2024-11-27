import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const routeName = '/product-details';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;

    // Replace this with actual product data fetching.
    final product = {
      'id': productId,
      'title': 'Running Shoes',
      'description': 'Comfortable running shoes for daily use. Stylish and lightweight.',
      'price': 59.99,
      'imageUrl': 'https://via.placeholder.com/600/0000FF/FFFFFF?Text=Shoes',
    };

    return Scaffold(
      appBar: AppBar(
        title: Text(product['title'] as String),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(product['imageUrl'] as String),
            SizedBox(height: 20),
            Text(
              '\$${(product['price'] as double).toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 24,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                product['description'] as String,
                style: TextStyle(fontSize: 16, height: 1.5),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // Add to cart logic
              },
              icon: Icon(Icons.add_shopping_cart),
              label: Text('Add to Cart'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

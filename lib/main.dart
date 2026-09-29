import 'package:flutter/material.dart';

import 'models/product.dart';
import 'services/product_service.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: QuickShopPage()));
}

class QuickShopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _service = ProductService();
    final products = _service.filterByMaxPrice(100);

    return Scaffold(
      appBar: AppBar(title: Text('Quick Shop - Sản phẩm giá rẻ (< 100\$)')),
      body: ListView(
        children: products
            .map(
              (product) => Card(
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  leading: const Icon(Icons.shopping_bag),
                  title: Text(product.name),
                  subtitle: Text('\$${product.price}'),
                  trailing: const Icon(Icons.add_shopping_cart),
                  onTap: () => _service.handleAddToCart(product),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
import '../data/data_source.dart';
import '../models/product.dart';

class ProductService {
  List<Product> getAllProducts() => rawProducts;

  List<Product> filterByMaxPrice(double maxPrice) =>
      rawProducts.where((p) => p.price < maxPrice).toList();

  void handleAddToCart(Product product) {
    print('Đã chọn mua: ${product.name}');
    print('Giá tiền: \$${product.price}');
  }
}
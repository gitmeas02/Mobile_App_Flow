import '../entities/product.dart';

abstract class ProductRepository {
  Future<Product?> getProductById(String id);
  Future<List<Product>> getAllProducts();
  Future<List<Product>> searchProducts(String query);
  Future<bool> toggleFavorite(String productId);
  Future<bool> addToCart(String productId, int quantity);
}

import '../entities/product.dart';
import '../repositories/product_repository.dart';

class GetProductByIdUseCase {
  final ProductRepository repository;

  GetProductByIdUseCase(this.repository);

  Future<Product?> call(String productId) async {
    try {
      return await repository.getProductById(productId);
    } catch (e) {
      // Handle error appropriately
      throw Exception('Failed to get product: $e');
    }
  }
}

class Product {
  final int id;
  final String title;
  final String description;
  final String assetPath; // Dosya yolu burası
  final double price;
  final String category;

  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.assetPath,
    required this.price,
    required this.category,
  });
}
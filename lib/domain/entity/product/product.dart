class Product {
  int id;
  String name;
  String description;
  String sku;
  int stock;
  String categoryId;
  int price;
  int userId;
  String image;
  int active;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.sku,
    required this.stock,
    required this.categoryId,
    required this.price,
    required this.userId,
    required this.image,
    required this.active
  });
}
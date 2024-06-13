class Product {
  final int id;
  final String code;
  final String name;
  final String description;
  final double price;
  final int stock;
  final String image;

  Product({
    required this.id,
    required this.code,
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      code: json['code'],
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      stock: json['stock'],
      image: json['image'],
    );
  }
}

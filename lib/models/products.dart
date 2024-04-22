class Products {
  const Products({
    required this.id,
    required this.productName,
    required this.productMainImage,
    required this.productImage,
    required this.productPrice,
  });

  final String id;
  final String productName;
  final String productMainImage;
  final List productImage;
  final double productPrice;
}

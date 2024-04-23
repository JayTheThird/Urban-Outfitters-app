class Products {
  const Products({
    required this.id,
    required this.productName,
    required this.productMainImage,
    required this.productImage,
    required this.productPrice,
    required this.productSize,
    required this.productFabric,
    required this.productDetails,
  });

  final String id;
  final String productName;
  final String productMainImage;
  final List productImage;
  final double productPrice;
  final List productSize;
  final String productFabric;
  final String productDetails;
}

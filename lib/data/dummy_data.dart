import 'package:ecommerce/models/categories.dart';
import 'package:ecommerce/models/products.dart';

// dummy data for category
final dummyCategories = [
  Categories(id: "c1", Category_Image: "assets/products/f1.jpg"),
  Categories(id: "c2", Category_Image: "assets/products/f2.jpg"),
  Categories(id: "c3", Category_Image: "assets/products/f3.jpg"),
  Categories(id: "c4", Category_Image: "assets/products/f4.jpg"),
  Categories(id: "c5", Category_Image: "assets/products/f5.jpg"),
  Categories(id: "c6", Category_Image: "assets/products/f5.jpg"),
  Categories(id: "c7", Category_Image: "assets/products/f5.jpg"),
  Categories(id: "c8", Category_Image: "assets/products/f5.jpg"),
  Categories(id: "c9", Category_Image: "assets/products/f5.jpg"),
  Categories(id: "c10", Category_Image: "assets/products/f5.jpg"),
  Categories(id: "c11", Category_Image: "assets/products/f5.jpg"),
  Categories(id: "c12", Category_Image: "assets/products/f5.jpg"),
];

final dummyProducts = [
  Products(
    id: "p1",
    productName: "Double Pocket Lycra shirt Premium",
    productMainImage: "assets/products/double-pocket/dp_lycra_blue.jpg",
    productImage: [
      {"image_Path": "assets/products/double-pocket/dp_lycra_blue.jpg"},
      {"image_Path": "assets/products/double-pocket/dp_lycra_all_colors.jpg"},
    ],
    productPrice: 700,
  ),
  Products(
    id: "p2",
    productName: "Chex Double Pocket Shirt",
    productMainImage: "assets/products/double-pocket/dp_chex_front.jpg",
    productImage: [
      {"image_Path": "assets/products/double-pocket/dp_chex_front.jpg"},
      {"image_Path": "assets/products/double-pocket/dp_chex_back.jpg"},
    ],
    productPrice: 999,
  ),
  // Products(
  //   id: "p2",
  //   productName: "Product 2",
  //   productImage: "assets/products/f1.jpg",
  //   productPrice: 500,
  // ),
  // Products(
  //   id: "p3",
  //   productName: "Product 3",
  //   productImage: "assets/products/n2.jpg",
  //   productPrice: 1000,
  // ),
  // Products(
  //   id: "p4",
  //   productName: "Product 4",
  //   productImage: "assets/products/f2.jpg",
  //   productPrice: 1290,
  // ),
  // Products(
  //   id: "p5",
  //   productName: "Product 5",
  //   productImage: "assets/products/n3.jpg",
  //   productPrice: 1500,
  // ),
  // Products(
  //   id: "p5",
  //   productName: "Product 6",
  //   productImage: "assets/products/f3.jpg",
  //   productPrice: 1100,
  // ),
];

// created list of banner
List banner = [
  {
    "id": 1,
    "image_path": 'assets/banner/Urban Outfitters Banner 1.png',
  },
  {
    "id": 2,
    "image_path": 'assets/banner/Urban Outfitters Banner 2.png',
  },
  {
    "id": 3,
    "image_path": 'assets/banner/Urban Outfitters Banner 3.png',
  },
  {
    "id": 4,
    "image_path": 'assets/banner/Urban Outfitters Banner 4.png',
  },
];

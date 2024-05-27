import 'package:ecommerce/models/categories.dart';
import 'package:ecommerce/models/products.dart';

// dummy data for category
final dummyCategories = [
  Categories(
    id: "c1",
    image: "assets/products/n1.jpg",
    categoryType: "upper-wear",
    categoryName: "Shirts",
  ),
  Categories(
    id: "c2",
    image: "assets/products/f1.jpg",
    categoryType: "upper-wear",
    categoryName: "half Shirts",
  ),
  Categories(
    id: "c3",
    image: "assets/products/double-pocket/denim_jeans.jpg",
    categoryType: "bottom-wear",
    categoryName: "denim jeans",
  ),
  Categories(
    id: "c4",
    image: "assets/products/double-pocket/cotton_jeans.jpg",
    categoryType: "bottom-wear",
    categoryName: "cotton jeans",
  ),
];

// dummy data for products
final dummyProducts = [
  Products(
    id: "p1",
    categories: ["c1"],
    productName: "Double Pocket Lycra shirt Premium",
    productMainImage: "assets/products/double-pocket/dp_lycra_blue.jpg",
    productImage: [
      {"image_Path": "assets/products/double-pocket/dp_lycra_blue.jpg"},
      {"image_Path": "assets/products/double-pocket/dp_lycra_all_colors.jpg"},
    ],
    productSize: ["S", "M", "L"],
    productPrice: 700,
    productFabric: "Lycra",
    productDetails:
        "A Double pocket Casual Shirt made with Lycra material and top left side have beautiful Design, Best To wear in Winters",
  ),
  Products(
    id: "p2",
    categories: ["c1"],
    productName: "Chex Double Pocket Shirt",
    productMainImage: "assets/products/double-pocket/dp_chex_front.jpg",
    productImage: [
      {"image_Path": "assets/products/double-pocket/dp_chex_front.jpg"},
      {"image_Path": "assets/products/double-pocket/dp_chex_back.jpg"},
    ],
    productSize: ["M", "L"],
    productPrice: 999,
    productFabric: "Cotton",
    productDetails: "A Double pocket Casual Shirt made with Cotton material, Best To wear in All Seasons.",
  ),
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

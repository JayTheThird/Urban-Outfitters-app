// main files
import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  // The entry point for accessing a FirebaseFirestore
  final db = FirebaseFirestore.instance;

  // add user and details
  Future addUserDetails(Map<String, dynamic> userInfo, String id) async {
    return await db.collection("users").doc(id).set(userInfo);
  }

  // add products form admin side
  Future addProducts(Map<String, dynamic> productDetails, String id) async {
    return await db.collection("products").doc(id).set(productDetails);
  }

  // add categories from admin side
  Future addCategory(Map<String, dynamic> categories, String id) async {
    return await db.collection("categories").doc(id).set(categories);
  }


}

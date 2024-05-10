// main files
import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  Future addUserDetails(Map<String, dynamic> userInfo, String id) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .set(userInfo);
  }
}

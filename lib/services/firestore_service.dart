import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final _db = FirebaseFirestore.instance;

  // Example: Get restaurants (active)
  Stream<List<Map<String, dynamic>>> getRestaurants() {
    return _db
        .collection('restaurants')
        .where('active', isEqualTo: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }

  // Add more methods here for menus, orders, etc.
}
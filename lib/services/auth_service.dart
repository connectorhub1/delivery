import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/app_user.dart';

class AuthService extends ChangeNotifier {
  final fb.FirebaseAuth _auth = fb.FirebaseAuth.instance;
  final _users = FirebaseFirestore.instance.collection('users');
  AppUser? _currentUser;
  StreamController<AppUser?> _userController = StreamController<AppUser?>.broadcast();

  AuthService() {
    _auth.authStateChanges().listen(_onAuthChanged);
  }

  AppUser? get currentUser => _currentUser;
  Stream<AppUser?> get userStream => _userController.stream;

  Future<void> _onAuthChanged(fb.User? user) async {
    if (user == null) {
      _currentUser = null;
      _userController.add(null);
      notifyListeners();
      return;
    }
    final doc = await _users.doc(user.uid).get();
    if (doc.exists) {
      _currentUser = AppUser.fromMap(doc.data()!);
      _userController.add(_currentUser);
    } else {
      _currentUser = AppUser(
        uid: user.uid,
        name: user.displayName ?? '',
        email: user.email ?? '',
        role: 'customer',
        photoUrl: user.photoURL,
      );
      await _users.doc(user.uid).set({
        'uid': user.uid,
        'name': _currentUser!.name,
        'email': _currentUser!.email,
        'role': 'customer',
        'photoUrl': _currentUser!.photoUrl,
      });
      _userController.add(_currentUser);
    }
    notifyListeners();
  }

  Future<void> signOut() async {
    await _auth.signOut();
    notifyListeners();
  }
}
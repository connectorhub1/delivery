import 'package:flutter/material.dart';
import '../../models/app_user.dart';
import 'customer_home.dart';
import 'rider_home.dart';
import 'admin_home.dart';

class HomeScreen extends StatelessWidget {
  final AppUser user;

  HomeScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    switch (user.role) {
      case 'rider':
        return RiderHome(user: user);
      case 'admin':
        return AdminHome(user: user);
      default:
        return CustomerHome(user: user);
    }
  }
}
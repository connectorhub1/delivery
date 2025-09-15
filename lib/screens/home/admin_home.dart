import 'package:flutter/material.dart';
import '../../models/app_user.dart';

class AdminHome extends StatelessWidget {
  final AppUser user;

  AdminHome({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Home')),
      body: Center(child: Text('Hello, ${user.name}! (Admin role)')),
      // TODO: Implement restaurant management, order verification, rider management
    );
  }
}
import 'package:flutter/material.dart';
import '../../models/app_user.dart';

class CustomerHome extends StatelessWidget {
  final AppUser user;

  CustomerHome({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Customer Home')),
      body: Center(child: Text('Hello, ${user.name}! (Customer role)')),
      // TODO: Implement restaurant list, cart, checkout, order tracking
    );
  }
}
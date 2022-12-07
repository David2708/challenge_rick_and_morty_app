

import 'package:flutter/material.dart';

class EmptyContainer extends StatelessWidget {
  
  const EmptyContainer({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Icon(icon, color: Colors.grey, size: 100), 
    );
  }
}
import 'package:flutter/material.dart';


class LoadingData extends StatelessWidget {
  const LoadingData({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: (size.width / 2) - 50,
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 50,
        width: 50,
        decoration: const BoxDecoration(
          color: Colors.black54,
          shape: BoxShape.circle
        ),
        child: const CircularProgressIndicator( color: Colors.grey ),
      ),
    );
  }
}
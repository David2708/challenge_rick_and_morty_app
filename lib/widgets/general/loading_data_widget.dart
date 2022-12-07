import 'package:flutter/material.dart';


class LoadingData extends StatelessWidget {
  const LoadingData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Positioned(
      bottom: 20,
      left: (size.width / 2) - 25,
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
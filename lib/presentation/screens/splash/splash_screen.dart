import 'package:flutter/material.dart';
import 'package:spotify/core/configs/assets/app_images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          AppImages.logoPng,
          width: MediaQuery.of(context).size.width * (3 / 5),
        ),
      ),
    );
  }
}

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/core/configs/assets/app_images.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/presentation/view_models/choose_mode_cubit.dart';
import 'package:spotify/presentation/widgets/basic_app_button.dart';
import 'package:spotify/presentation/widgets/safe_area_bottom_space.dart';
import 'package:spotify/presentation/widgets/svg_asset.dart';

class ChooseModeScreen extends StatelessWidget {
  const ChooseModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.chooseModeBg),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: Colors.black.withValues(alpha: 0.25),
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildLogo(context),
              Spacer(),
              _buildTitle(),
              const SizedBox(height: 21),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildThemeIcon(context, AppImages.moon, "Dark Mode"),
                  const SizedBox(width: 50),
                  _buildThemeIcon(context, AppImages.sun, "Light Mode"),
                ],
              ),
              const SizedBox(height: 50),
              _buildBasicButton(context),
              SafeAreaBottomSpace(bottom: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo(BuildContext context) {
    return Image.asset(
      AppImages.logoPng,
      width: MediaQuery.of(context).size.width * (3 / 5),
      height: MediaQuery.of(context).size.width * (3 / 5),
      fit: BoxFit.contain,
    );
  }

  Widget _buildTitle() {
    return Text(
      "Choose Mode",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Widget _buildThemeIcon(BuildContext context, String icon, String title) {
    final ThemeMode mode = title == "Light Mode" ? ThemeMode.light : ThemeMode.dark;
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            context.read<ChooseModeCubit>().updateTheme(mode);
          },
          child: ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                width: 75,
                height: 75,
                decoration: BoxDecoration(
                  color: Color(0xff30393c).withValues(alpha: 0.5),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: SvgAsset(
                  path: icon,
                  width: 30,
                  height: 30,
                  fit: BoxFit.contain,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 17,
            color: AppColors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildBasicButton(BuildContext context) {
    return BasicAppButton(onPressed: () {}, title: "Continue");
  }
}

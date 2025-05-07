import 'package:flutter/material.dart';
import 'package:spotify/core/configs/assets/app_images.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/presentation/widgets/app_bar.dart';
import 'package:spotify/presentation/widgets/basic_app_button.dart';
import 'package:spotify/presentation/widgets/safe_area_bottom_space.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: Image(
          image: AssetImage(AppImages.logoPng),
          height: 35,
          fit: BoxFit.contain,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            _buildRegisterText(),
            const SizedBox(height: 50),
            _buildFullNameField(context),
            const SizedBox(height: 20),
            _buildEMailField(context),
            const SizedBox(height: 20),
            _buildPasswordField(context),
            const SizedBox(height: 20),
            BasicAppButton(onPressed: () {}, title: "Create Account"),
            Spacer(flex: 2),
            _buildSignInText(),
            SafeAreaBottomSpace(bottom: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildRegisterText() {
    return Text(
      "Register",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildFullNameField(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Full Name",
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _buildEMailField(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Enter Email",
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _buildPasswordField(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Password",
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _buildSignInText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Do you have an account?",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "Sign In!",
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

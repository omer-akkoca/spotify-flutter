import 'package:flutter/material.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/core/configs/assets/app_images.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/presentation/screens/auth/sign_in_screen.dart';
import 'package:spotify/presentation/screens/auth/sign_up_screen.dart';
import 'package:spotify/presentation/widgets/app_bar.dart';
import 'package:spotify/presentation/widgets/basic_app_button.dart';
import 'package:spotify/presentation/widgets/svg_asset.dart';

class SignupOrSigninScreen extends StatelessWidget {
  const SignupOrSigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BasicAppBar(),
          Align(
            alignment: Alignment.topRight,
            child: SvgAsset(path: AppImages.topPattern),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgAsset(path: AppImages.bottomPattern),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(AppImages.authBg),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildLogo(context),
                  const SizedBox(height: 55),
                  _buildTitle(),
                  const SizedBox(height: 11),
                  _buildSubTitle(),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(
                        child: BasicAppButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpScreen(),
                              ),
                            );
                          },
                          title: "Register",
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignInScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color:
                                  context.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogo(BuildContext context) {
    return Image.asset(
      AppImages.logoPng,
      width: MediaQuery.of(context).size.width * (3 / 5),
      fit: BoxFit.contain,
    );
  }

  Widget _buildTitle() {
    return Text(
      "Enjoy Listening To Music",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildSubTitle() {
    return Text(
      "Spotify is a proprietary Swedish audio streaming and media services provider",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w500,
        color: AppColors.grey,
      ),
    );
  }
}

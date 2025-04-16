import 'package:flutter/material.dart';
import 'package:weather_app/common/helper/app_navigation.dart';
import 'package:weather_app/common/widgets/button/basic_button.dart';
import 'package:weather_app/core/configs/assets/app_images.dart';
import 'package:weather_app/core/configs/theme/app_colors.dart';
import 'package:weather_app/core/constants/string_app.dart';
import 'package:weather_app/presentation/auth/views/login_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xffCBCDCC),
                Color.fromARGB(255, 198, 201, 200),
                Color(0xffE7EAE9),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 32,
              horizontal: 40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () =>
                      AppNavigator.pushReplacement(context, LoginView()),
                  child: Container(
                    width: width * 0.2,
                    height: height * 0.05,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Color.fromARGB(255, 193, 201, 205),
                    ),
                    child: Center(
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.1),
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: height * 0.275,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 2.0,
                            blurRadius: 10.0,
                            offset: Offset(6, 8),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: AssetImage(
                            AppImages.splashVector,
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.035),
                    SizedBox(
                      width: width * 0.5,
                      height: height * 0.1,
                      child: Text(
                        StringApp.nameApp,
                        style: TextStyle(
                          height: 1.1,
                          fontSize: 32,
                          fontWeight: FontWeight.w800,
                          color: AppColors.primary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: height * 0.0085),
                    SizedBox(
                      width: double.infinity,
                      height: height * 0.115,
                      child: Text(
                        StringApp.titleSplash,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: height * 0.035),
                    GestureDetector(
                      onTap: () => AppNavigator.pushReplacement(
                        context,
                        LoginView(),
                      ),
                      child: BasicButton(title: 'Get Started'),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

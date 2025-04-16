import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/common/helper/app_navigation.dart';
import 'package:weather_app/presentation/home/views/home_view.dart';
import '../../../common/widgets/button/basic_button.dart';
import '../../../core/configs/assets/app_images.dart';
import '../../../core/configs/theme/app_colors.dart';
import '../../../core/constants/string_app.dart';
import '../bloc/password_cubit.dart';
import '../widgets/text_field_auth.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final TextEditingController emailC = TextEditingController();
  final TextEditingController passC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: BlocProvider(
        create: (context) => PasswordCubit(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
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
                children: [
                  Container(
                    width: width * 0.7,
                    height: height * 0.235,
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
                  SizedBox(height: height * 0.03),
                  SizedBox(
                    width: width * 0.75,
                    height: height * 0.085,
                    child: Text(
                      StringApp.openingText,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        color: AppColors.primary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  TextFieldAuth(controller: emailC, hintext: 'Email:'),
                  SizedBox(height: height * 0.02),
                  BlocBuilder<PasswordCubit, bool>(
                    builder: (context, isPasswordHidden) {
                      return SizedBox(
                        width: width * 0.85,
                        height: height * 0.085,
                        child: TextField(
                          obscureText: isPasswordHidden,
                          controller: passC,
                          autocorrect: false,
                          decoration: InputDecoration(
                            hintText: 'Password:',
                            suffixIcon: IconButton(
                              onPressed: () {
                                context
                                    .read<PasswordCubit>()
                                    .togglePasswordVisibility();
                              },
                              icon: Icon(
                                isPasswordHidden
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: height * 0.03),
                  GestureDetector(
                    onTap: () => AppNavigator.push(context, HomeView()),
                    child: BasicButton(title: 'Login'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

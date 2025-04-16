import 'package:flutter/material.dart';

import '../../../core/configs/theme/app_colors.dart';

class TextFieldAuth extends StatelessWidget {
  final TextEditingController controller;
  final String hintext;
  const TextFieldAuth({
    super.key,
    required this.controller,
    required this.hintext,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width * 0.85,
      height: height * 0.085,
      child: TextField(
        style: TextStyle(
          color: AppColors.inversePrimary,
        ),
        controller: controller,
        autocorrect: false,
        decoration: InputDecoration(
          hintText: hintext,
        ),
      ),
    );
  }
}

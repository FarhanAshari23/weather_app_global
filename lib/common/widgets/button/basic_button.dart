import 'package:flutter/material.dart';

import '../../../core/configs/theme/app_colors.dart';

class BasicButton extends StatelessWidget {
  final String title;
  const BasicButton({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.65,
      height: height * 0.1,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 5.0,
            blurRadius: 8.0,
            offset: Offset(0, 6),
          ),
        ],
        borderRadius: BorderRadius.circular(24),
        color: AppColors.secondary,
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            color: AppColors.inversePrimary,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

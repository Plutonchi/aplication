import 'package:aplication/app/constans/app_colors.dart';
import 'package:aplication/app/constans/app_text_styles.dart';
import 'package:flutter/material.dart';

class LogSignWidget extends StatelessWidget {
  const LogSignWidget({
    super.key,
    required this.title,
    required this.onTap,
  });
  final String title;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.black53,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 7),
          child: Text(
            title,
            style: AppTextStyle.whiteBlod20,
          ),
        ),
      ),
    );
  }
}
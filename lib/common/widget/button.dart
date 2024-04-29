import 'package:elearning/common/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double? width;
  final double? height;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textColor;
  final Color gradientStartColor;
  final Color gradientEndColor;
  final VoidCallback onPressed;
  final Border? border;
  final Widget? imageWidget;

  const CustomButton({
    super.key,
    required this.text,
    this.width,
    this.imageWidget,
    this.height,
    this.fontSize = 20,
    this.fontWeight = FontWeight.w700,
    this.textColor = AppColors.primaryElementText,
    this.gradientStartColor = AppColors.primaryButtonElement,
    this.gradientEndColor = AppColors.primaryButtonElement,
    this.border,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width ?? MediaQuery.of(context).size.width,
        height: height ?? 60,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 10),
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: border,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [gradientStartColor, gradientEndColor],
          ),
          boxShadow: const [
            BoxShadow(
              color: AppColors.primaryThreeElementText,
              spreadRadius: 1.0,
              blurRadius: 2.0,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imageWidget != null) ...[
              imageWidget!,
              const SizedBox(width: 8),
            ],
            Text(
              text,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: fontWeight,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

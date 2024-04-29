import 'package:elearning/common/values.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final String prefixImage;
  final Color hintColor;
  final Color borderColor;
  final double fontSize;
  final double contentHorizontalPadding;
  final double contentVerticalPadding;
  final bool isPassword;
  final TextEditingController controller;
  const CustomTextField({
    super.key,
    this.hintText = "Enter details",
    this.prefixImage = "",
    this.hintColor = AppColors.primaryThreeElementText,
    this.borderColor = AppColors.primaryThreeElementText,
    this.fontSize = 18,
    this.contentHorizontalPadding = 10,
    this.contentVerticalPadding = 12,
    this.isPassword = false,
    required this.controller,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isPassword ? _isObscure : false,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: widget.fontSize,
        color: widget.hintColor,
      ),
      cursorColor: AppColors.primaryThreeElementText,
      controller: widget.controller,
      decoration: InputDecoration(
        prefixIcon: Image.asset(widget.prefixImage),
        contentPadding: EdgeInsets.symmetric(
          horizontal: widget.contentHorizontalPadding,
          vertical: widget.contentVerticalPadding,
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _isObscure ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.primaryThreeElementText,
                ),
                onPressed: () {
                  setState(
                    () {
                      _isObscure = !_isObscure;
                    },
                  );
                },
              )
            : null,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: widget.fontSize,
          color: widget.hintColor,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(
            width: 2,
            color: AppColors.primaryThreeElementText,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(
            width: 2,
            color: widget.borderColor,
          ),
        ),
      ),
    );
  }
}

import 'package:elearning/common/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar() {
  return AppBar(
    elevation: 0,
    bottom: const PreferredSize(
      preferredSize: Size.fromHeight(1.0),
      child: Divider(
        thickness: 1.0,
        color: AppColors.primaryThreeElementText,
      ),
    ),
    title: Text(
      "Log In",
      style: TextStyle(
        color: AppColors.primaryText,
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}

Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 30.h),
    margin: EdgeInsets.only(top: 20.h, bottom: 20.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _reusableIcons('google', () {}),
        _reusableIcons('apple', () {}),
        _reusableIcons('facebook', () {}),
      ],
    ),
  );
}

Widget _reusableIcons(String imageName, Function()? onTap) {
  return GestureDetector(
    onTap: onTap,
    child: SizedBox(
      height: 40.h,
      width: 40.h,
      child: Image.asset(
        'assets/icons/$imageName.png',
        fit: BoxFit.contain,
      ),
    ),
  );
}

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(
      bottom: 5.h,
    ),
    child: Text(
      text,
      style: TextStyle(
        color: AppColors.primaryThreeElementText,
        fontWeight: FontWeight.normal,
        fontSize: 14.sp,
      ),
    ),
  );
}

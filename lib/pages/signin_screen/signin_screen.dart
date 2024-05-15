import 'dart:developer';

import 'package:elearning/common/values.dart';
import 'package:elearning/common/widget/button.dart';
import 'package:elearning/common/widget/text_field.dart';
import 'package:elearning/pages/signin_screen/widget/sign_in_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            buildThirdPartyLogin(context),
            reusableText("Or use your email account to login"),
            SizedBox(
              height: 36.h,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: reusableText(
                "Email",
              ),
            ),
            CustomTextField(
              controller: TextEditingController(),
              prefixImage: "assets/icons/user.png",
              hintText: "Enter Your Email Address",
              borderColor: Colors.grey.withOpacity(0.5),
              contentHorizontalPadding: 10,
              contentVerticalPadding: 15,
            ),
            SizedBox(
              height: 20.h,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: reusableText(
                "Password",
              ),
            ),
            CustomTextField(
              controller: TextEditingController(),
              prefixImage: "assets/icons/lock.png",
              hintText: "Enter Your Password",
              isPassword: true,
              borderColor: Colors.grey.withOpacity(0.5),
              contentHorizontalPadding: 10,
              contentVerticalPadding: 15,
            ),
            SizedBox(
              height: 15.h,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Forget password ?",
                style: TextStyle(
                  color: AppColors.primaryText,
                  decoration: TextDecoration.underline,
                  fontSize: 12.sp,
                  decorationColor: Colors.grey,
                ),
              ),
            ),
            const Spacer(),
            CustomButton(
              onPressed: () {
                log("Login button");
              },
              text: 'Login',
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomButton(
              onPressed: () {
                log("Sign up button");
              },
              text: 'Sign Up',
              gradientStartColor: AppColors.primaryElementText,
              gradientEndColor: AppColors.primaryElementText,
              border: Border.all(
                color: AppColors.primaryThreeElementText,
              ),
              textColor: Colors.black,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

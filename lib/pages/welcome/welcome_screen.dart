import 'package:dots_indicator/dots_indicator.dart';
import 'package:elearning/common/values.dart';
import 'package:elearning/common/widget/button.dart';
import 'package:elearning/pages/signin_screen/signin_screen.dart';
import 'package:elearning/pages/welcome/bloc/welcome_bloc.dart';
import 'package:elearning/pages/welcome/bloc/welcome_event.dart';
import 'package:elearning/pages/welcome/bloc/welcome_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WelcomeBloc, WelcomeState>(
        builder: (BuildContext context, WelcomeState state) {
          return Container(
            width: 375.w,
            margin: EdgeInsets.only(top: 34.0.h),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SignInScreen(),
                        ),
                      );
                    },
                    child: Container(
                      height: 30.h,
                      width: 60.w,
                      margin: EdgeInsets.only(right: 20.w, top: 50.h),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.r),
                        border: Border.all(
                          color: AppColors.primaryThreeElementText,
                        ),
                      ),
                      child: const Text("Skip"),
                    ),
                  ),
                ),
                PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    state.page = index;
                    BlocProvider.of<WelcomeBloc>(context).add(
                      WelcomeEvents(),
                    );
                  },
                  children: [
                    _pages(
                      1,
                      context,
                      'assets/images/reading.png',
                      'First See Learning',
                      'Forget about a for of paper all knowledge in on learning',
                      'Next',
                    ),
                    _pages(
                      2,
                      context,
                      'assets/images/boy.png',
                      'Connect With Everyone',
                      'Always keep in touch with your tutor & friend. Lets get connected!',
                      'Next',
                    ),
                    _pages(
                      3,
                      context,
                      'assets/images/man.png',
                      'Always Fascinated Learning',
                      'Anywhere, anytime. The time is at your discretion so study wherever you want.',
                      'Get Started',
                    ),
                  ],
                ),
                Positioned(
                  bottom: 90.h,
                  child: DotsIndicator(
                    dotsCount: 3,
                    position: state.page.toInt(),
                    decorator: DotsDecorator(
                      activeColor: AppColors.primaryButtonElement,
                      activeSize: const Size(20, 10),
                      size: const Size.square(8.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0.r),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _pages(int index, BuildContext context, String imagePath, String title,
      String subTitle, String buttonName) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 80.h),
          Container(
            height: 245.h,
            width: 245.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  imagePath,
                ),
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 24.sp,
              color: AppColors.primaryText,
              fontWeight: FontWeight.normal,
            ),
          ),
          Container(
            width: 375.w,
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
            child: Text(
              subTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.primaryThreeElementText,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomButton(
            text: buttonName,
            onPressed: () {
              if (index < 3) {
                pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.easeIn,
                );
              } else {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  "signInScreen",
                  (route) => false,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

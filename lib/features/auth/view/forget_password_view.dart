import 'package:carwashing/features/auth/widgets/custom_forgot_password_form.dart';
import 'package:carwashing/features/auth/widgets/forgot_password_image.dart';
import 'package:carwashing/features/auth/widgets/forgot_password_sub_title.dart';
import 'package:carwashing/features/auth/widgets/welcome_text_widget.dart';
import 'package:flutter/material.dart';

class ForgetPasswordView
 extends StatelessWidget {
  const ForgetPasswordView
  ({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 108)),
          SliverToBoxAdapter(
              child: WelcomeTextWidget(text: 'ForgotPassword')),
          SliverToBoxAdapter(child: SizedBox(height: 40)),
          SliverToBoxAdapter(child: ForgotPasswrodImage()),
          SliverToBoxAdapter(child: SizedBox(height: 24)),
          SliverToBoxAdapter(child: ForgotPasswordSubTitle()),
          SliverToBoxAdapter(child: CustomForgotPasswrodForm()),
        ],
      ),
    );;
  }
}
// ignore_for_file: unused_local_variable

import 'dart:ui';
import 'package:bd_railway/src/utils/asset_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../routes/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image Positioned at the Bottom Right
          Positioned(
            bottom: 0,
            right: 0,
            child: SvgPicture.asset(
              AssetManager.LOGIN_SCREEN_BG, // Replace with your image path
              height: 250,
              width: 250,
              fit: BoxFit.contain,
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10.0,
              sigmaY: 10.0,
            ),
            child: Container(),
          ),

          // Login Form
          LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32.0, vertical: 40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: constraints.maxHeight * 0.1),
                        Image.asset(
                          AssetManager.APP_ICON,
                          height: 100,
                        ),
                        SizedBox(height: constraints.maxHeight * 0.05),
                        Text(
                          "Bangladesh Railway",
                          textAlign: TextAlign.center,
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontFamily: "Roboto",
                            color: const Color(0xFFda924e),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "নিরাপদ",
                              style: theme.textTheme.bodySmall!.copyWith(
                                fontFamily: "Roboto",
                                color: Color(0xFF006747),
                              ),
                            ),
                            Gap(5),
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFF006747),
                              ),
                            ),
                            Gap(5),
                            Text(
                              "আরামদায়ক",
                              style: theme.textTheme.bodySmall!.copyWith(
                                fontFamily: "Roboto",
                                color: Color(0xFF006747),
                              ),
                            ),
                            Gap(5),
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFF006747),
                              ),
                            ),
                            Gap(5),
                            Text(
                              "সাশ্রয়ী",
                              style: theme.textTheme.bodySmall!.copyWith(
                                fontFamily: "Roboto",
                                color: Color(0xFF006747),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: constraints.maxHeight * 0.05),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: const InputDecoration(
                                  hintText: 'Enter your mobile number',
                                  hintStyle: TextStyle(
                                    fontFamily: "Roboto",
                                    color: Colors.grey,
                                  ),
                                  filled: true,
                                  fillColor: Color(0xFFF5FCF9),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 16.0 * 1.5, vertical: 16.0),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                ),
                                keyboardType: TextInputType.phone,
                                onSaved: (phone) {
                                  // Save it
                                },
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                child: TextFormField(
                                  obscureText: _obscureText,
                                  decoration: InputDecoration(
                                    hintText: 'Enter your Password',
                                    hintStyle: TextStyle(
                                      fontFamily: "Roboto",
                                      color: Colors.grey,
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFFF5FCF9),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 16.0 * 1.5, vertical: 16.0),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _obscureText = !_obscureText;
                                        });
                                      },
                                      icon: Icon(
                                       _obscureText ? Icons.visibility_off : Icons.remove_red_eye,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  onSaved: (passaword) {
                                    // Save it
                                  },
                                ),
                              ),
                              Material(
                                color: Theme.of(context).colorScheme.primary,
                                borderRadius: BorderRadius.circular(8),
                                child: InkWell(
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      context.goNamed(Routes.HOME_SCREEN_ROUTE.name);
                                      // Navigate to the main screen
                                    }
                                  },
                                  borderRadius: BorderRadius.circular(8),
                                  splashColor: Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.5),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 24.0, vertical: 12.0),
                                    child: Center(
                                      child: Text(
                                        "Login",
                                        style: theme.textTheme.titleLarge
                                            ?.copyWith(
                                          color: Colors.white,
                                          fontFamily: "Roboto",
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16.0),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Forgot Password?',
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .color!
                                        .withOpacity(0.64),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  context.pushNamed(
                                      Routes.REGISTER_SCREEN_ROUTE.name);
                                },
                                child: Text.rich(
                                  TextSpan(
                                    text: "Don’t have an account? ",
                                    children: [
                                      TextSpan(
                                        text: "Register",
                                        style: TextStyle(
                                          color: Color(0xFF00BF6D),
                                        ),
                                      ),
                                    ],
                                  ),
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                    fontFamily: "Roboto",
                                    color: theme.textTheme.bodyLarge!.color!
                                        .withOpacity(0.64),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

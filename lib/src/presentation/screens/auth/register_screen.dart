// ignore_for_file: must_be_immutable, unused_local_variable

import 'dart:ui';

import 'package:bd_railway/src/routes/routes.dart';
import 'package:bd_railway/src/utils/asset_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController datePicker = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
        Positioned(
          right: 0,
          bottom: 0,
          child: SvgPicture.asset(
            AssetManager.LOGIN_SCREEN_BG,
            width: 250,
            height: 250,
          ),
        ),
        BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10.0,
              sigmaY: 10.0,
            ),
            child: Container(),
          ),
        LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    SizedBox(height: constraints.maxHeight * 0.1),
                    Image.asset(
                      AssetManager.APP_ICON,
                      height: 100,
                    ),
                    SizedBox(height: constraints.maxHeight * 0.05),
                    Text(
                      "Bangladesh Railway",
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontFamily: "Roboto",
                        color: const Color(0xFFda924e),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
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
                              hintText: 'Enter Mobile Number',
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
                          Gap(16),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Enter NID Number',
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
                          Gap(16),
                          TextFormField(
                            readOnly: false,
                            controller: datePicker,
                            decoration: const InputDecoration(
                              hintText: 'Select Date of Birth',
                              hintStyle: TextStyle(
                                fontFamily: "Roboto",
                                color: Colors.grey,
                              ),
                              suffixIcon: Icon(
                                Icons.calendar_month,
                                color: Color(0xFF00BF6D),
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
                            onTap: () async {
                              DateTime? dateTime = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1950),
                                lastDate: DateTime(2100),
                              );
                              if (dateTime != null) {
                                String formattedDate =
                                    DateFormat('yyyy-MM-dd').format(dateTime);
                                setState(() {
                                  datePicker.text = formattedDate;
                                });
                              }
                            },
                          ),
                          Gap(16),
                          TextFormField(
                            obscureText: _obscureText,
                            controller: passwordController,
                            decoration: InputDecoration(
                              hintText: 'Enter your Password',
                              hintStyle: const TextStyle(
                                fontFamily: "Roboto",
                                color: Colors.grey,
                              ),
                              filled: true,
                              fillColor: const Color(0xFFF5FCF9),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16.0 * 1.5, vertical: 16.0),
                              border: const OutlineInputBorder(
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
                                  _obscureText
                                      ? Icons.visibility_off
                                      : Icons.remove_red_eye,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            onSaved: (passaword) {
                              // Save it
                            },
                          ),
                          Gap(16),
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
                                    "Register",
                                    style: theme.textTheme.titleLarge?.copyWith(
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
                            onPressed: () {
                              context.pushNamed(Routes.LOGIN_SCREEN_ROUTE.name);
                            },
                            child: Text.rich(
                              TextSpan(
                                text: "Already Registered? ",
                                children: [
                                  TextSpan(
                                    text: "Login",
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
            );
          },
        ),
      ],
    ));
  }
}

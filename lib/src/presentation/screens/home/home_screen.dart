// ignore_for_file: unused_field

import 'package:bd_railway/src/utils/asset_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      drawerEnableOpenDragGesture: false,
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primary,
        elevation: 5,
        shadowColor: Color(0xFF252525),
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5.0, bottom: 5.0),
              child: Image.asset(
                AssetManager.APP_ICON,
                width: 50,
              ),
            ),
            Text(
              "Bangladesh Railway",
              style: theme.textTheme.titleLarge?.copyWith(
                  fontFamily: "Roboto", color: theme.colorScheme.surface),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 30.0,
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    child: Column(
                      children: [
                        CustomSelectButton(
                            theme: theme,
                            title: "FROM",
                            subTitle: "Select Station",
                            onTap: () {}),
                        Gap(20),
                        CustomSelectButton(
                            theme: theme,
                            title: "to",
                            subTitle: "Select Station",
                            onTap: () {}),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 38,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.black.withOpacity(0.2), // Shadow color
                            blurRadius: 3, // Blur radius
                            spreadRadius: 0, // Spread radius
                            offset:
                                Offset(0.0, 0.0), // Offset in x and y direction
                          ),
                        ], // Use your theme color
                      ),
                      child: Icon(
                        Icons.route_rounded,
                        color: const Color(0xFFda924e),
                      ),
                    ),
                  ),
                ],
              ),
              Gap(20),
              CustomSelectButton(
                theme: theme,
                onTap: () {},
                title: "CLASS",
                subTitle: "Select Class",
              ),
              Gap(20),
              CustomSelectButton(
                theme: theme,
                onTap: () {},
                title: "Journey Date",
                subTitle: "Select Date",
              ),
              Gap(20),
              FullWidthButton(
                theme: theme,
                title: "Search Train",
                onTap: () {},
              ),
              Gap(20),
              BannerPaymentMethod(theme: theme),
              Gap(20),
              Introduction(theme: theme),
              Gap(50),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: "My Account"),
        ],
      ),
    );
  }
}

class Introduction extends StatelessWidget {
  const Introduction({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "Instructions to Purchase\nTickets",
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontFamily: "Roboto",
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gap(20),
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: const Color(0xFFda924e),
                      ),
                      Gap(5),
                      Text(
                        "Read more".toUpperCase(),
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontFamily: "Roboto",
                          color: const Color(0xFFda924e),
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: SvgPicture.asset(
                AssetManager.FORGET_PASSWORD_IMAGE,
                fit: BoxFit.contain,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BannerPaymentMethod extends StatelessWidget {
  const BannerPaymentMethod({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
          child: Image.asset(
            AssetManager.BD_RAILWAY_BG,
            width: double.infinity,
            fit: BoxFit.contain,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Text.rich(
                  TextSpan(
                    text: "Easy ",
                    children: [
                      TextSpan(
                        text: "purchase ",
                        style: TextStyle(
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      TextSpan(
                        text: "of ",
                        style: TextStyle(),
                      ),
                      TextSpan(
                        text: "tickets ",
                        style: TextStyle(
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      TextSpan(
                        text: "using \n online payment method",
                        style: TextStyle(),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.end,
                  style: theme.textTheme.titleMedium!.copyWith(
                    fontFamily: "Roboto",
                    color: theme.textTheme.titleMedium!.color!,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Gap(10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    AssetManager.BKASH_ICON_PNG,
                    width: 50,
                  ),
                  Gap(5),
                  Image.asset(
                    AssetManager.NAGAD_ICON_PNG,
                    width: 50,
                  ),
                  Gap(5),
                  Image.asset(
                    AssetManager.ROCKET_ICON_PNG,
                    width: 30,
                  ),
                  Gap(5),
                  SvgPicture.asset(
                    AssetManager.UPAY_ICON_SVG,
                    width: 20,
                  ),
                  Gap(5),
                  Image.asset(
                    AssetManager.MASTERCARD_ICON_PNG,
                    width: 25,
                  ),
                  Gap(5),
                  Image.asset(
                    AssetManager.VISA_ICON_PNG,
                    width: 40,
                  ),
                  Gap(5),
                  SvgPicture.asset(
                    AssetManager.NEXUS_ICON_SVG,
                    width: 30,
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

class FullWidthButton extends StatelessWidget {
  const FullWidthButton({
    super.key,
    required this.theme,
    required this.title,
    required this.onTap,
  });

  final ThemeData theme;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(100),
      color: theme.colorScheme.primary,
      child: InkWell(
        onTap: onTap,
        splashColor: theme.colorScheme.primary.withOpacity(0.5),
        borderRadius: BorderRadius.circular(100),
        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.search,
                color: Colors.white,
              ),
              Gap(5),
              Text(
                title.toUpperCase(),
                style: theme.textTheme.titleMedium?.copyWith(
                  fontFamily: "Roboto",
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomSelectButton extends StatelessWidget {
  const CustomSelectButton({
    super.key,
    required this.theme,
    required this.title,
    required this.subTitle,
    required this.onTap,
  });

  final ThemeData theme;
  final String title;
  final String subTitle;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2.0,
      borderRadius: BorderRadius.circular(8),
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8),
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title.toUpperCase(),
                  style: theme.textTheme.labelSmall?.copyWith(
                    fontFamily: "Roboto",
                    color: Colors.grey,
                  ),
                ),
                Text(
                  subTitle,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontFamily: "Roboto",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:bd_railway/src/bloc/splash_cubit/splash_screen_cubit.dart';
import 'package:bd_railway/src/utils/asset_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../routes/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<SplashScreenCubit, SplashScreenState>(
      listener: (context, state) {
        if (state is EndSplashScreen) {
          context.goNamed(Routes.ONBOARDING_SCREEN_ROUTE.name);
        }
      },
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AssetManager.APP_ICON),
                const Gap(10),
                Text(
                  "BANGLADESH RAILWAY",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontFamily: "Roboto",
                        color: const Color(0xFFda924e),
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Gap(50),
                const CircularProgressIndicator(),
              ],
            ),
          )
        ],
      ),
    ));
  }
}

import 'package:bd_railway/src/bloc/onboarding/onboarding_bloc.dart';
import 'package:bd_railway/src/bloc/splash_cubit/splash_screen_cubit.dart';
import 'package:bd_railway/src/routes/app_routes.dart';
import 'package:bd_railway/src/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BdRailway extends StatelessWidget {
  const BdRailway({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context)=> SplashScreenCubit()..StartSplashScreen()),
          BlocProvider(create: (context)=> OnboardingBloc()),
        ],
        child: MaterialApp.router(
          themeMode: ThemeMode.light,
          theme: AppTheme.APP_THEME_LIGHT,
          darkTheme: AppTheme.APP_THEME_DARK,
          routerConfig: AppRoutes.routes,
        ));
  }
}

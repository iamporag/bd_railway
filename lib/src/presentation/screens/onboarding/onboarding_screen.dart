// import 'package:bd_railway/src/utils/asset_manager.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:gap/gap.dart';

// class OnboardingScreen extends StatelessWidget {
//   const OnboardingScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           SliverFillRemaining(
//             hasScrollBody: false,
//             child: Column(
//               children: [
//                 Stack(
//                   children: [
//                     Container(
//                       width: double.infinity,
//                       height: 450,
//                       decoration: BoxDecoration(
//                           color: Theme.of(context).colorScheme.primary,
//                           borderRadius: BorderRadius.only(
//                               bottomRight: Radius.circular(500))),
//                     ),
//                     Positioned(
//                       left: 0,
//                       right: 0,
//                       bottom: 0,
//                       child: SvgPicture.asset(
//                         AssetManager.ONBOARDING_IMAGE,
//                         width: 280,
//                       ),
//                     )
//                   ],
//                 ),
//                 Spacer(),
//                 ListTile(
//                   title: Text(
//                     "Search",
//                     style: Theme.of(context).textTheme.displayMedium?.copyWith(
//                           fontFamily: "Roboto",
//                           fontWeight: FontWeight.bold,
//                         ),
//                   ),
//                   subtitle: Text(
//                     "Choose your origin, destination, journey dates and search for trains",
//                     style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                           fontFamily: "Roboto",
//                         ),
//                   ),
//                 ),
//                 Spacer(),
//                 Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Container(
//                       width: 10,
//                       height: 10,
//                       decoration: BoxDecoration(
//                           shape: BoxShape.circle, color: Colors.green),
//                     ),
//                     Gap(10),
//                     Container(
//                       width: 10,
//                       height: 10,
//                       decoration: BoxDecoration(
//                           shape: BoxShape.circle, color: Colors.green),
//                     ),
//                     Gap(10),
//                     Container(
//                       width: 10,
//                       height: 10,
//                       decoration: BoxDecoration(
//                           shape: BoxShape.circle, color: Colors.green),
//                     ),
//                   ],
//                 ),
//                 Spacer(),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                   child: Container(
//                     width: double.infinity,
//                     height: 50,
//                     decoration: BoxDecoration(
//                       color: Theme.of(context).colorScheme.primary,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Center(
//                       child: Text(
//                         "Next",
//                         style: Theme.of(context).textTheme.titleLarge?.copyWith(
//                               fontFamily: "Roboto",
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Spacer(),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:bd_railway/src/bloc/onboarding/onboarding_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../routes/routes.dart';
import '../../../utils/asset_manager.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<OnboardingBloc, OnboardingState>(
        builder: (context, state) {
          return SafeArea(
            child: Column(
              children: [
                const Spacer(flex: 2),
                Expanded(
                  flex: 14,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: demoData.length,
                    onPageChanged: (value) {
                      context
                          .read<OnboardingBloc>()
                          .add(pageChanged(page: value));
                    },
                    itemBuilder: (context, index) => OnboardContent(
                      illustration: demoData[index]["illustration"],
                      title: demoData[index]["title"],
                      text: demoData[index]["text"],
                    ),
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    demoData.length,
                    (index) =>
                        DotIndicator(isActive: index == state.currentPage),
                  ),
                ),
                const Spacer(flex: 2),
                if (state.currentPage < demoData.length - 1)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ElevatedButton(
                      onPressed: () {
                        _pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF22A45D),
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        "Next".toUpperCase(),
                        style: TextStyle(fontFamily: "Roboto"),
                      ),
                    ),
                  )
                else
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ElevatedButton(
                      onPressed: () {
                        context.goNamed(Routes.LOGIN_SCREEN_ROUTE.name);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF22A45D),
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        "Get Started".toUpperCase(),
                        style: TextStyle(fontFamily: "Roboto"),
                      ),
                    ),
                  ),
                const Spacer(),
              ],
            ),
          );
        },
      ),
    );
  }
}

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    super.key,
    required this.illustration,
    required this.title,
    required this.text,
  });

  final String? illustration, title, text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: AspectRatio(
            aspectRatio: 1,
            child: SvgPicture.asset(
              illustration!,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          title!,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontFamily: "Roboto", fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            text!,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontFamily: "Roboto",
                ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    this.isActive = false,
    this.activeColor = const Color(0xFF22A45D),
    this.inActiveColor = const Color(0xFF868686),
  });

  final bool isActive;
  final Color activeColor, inActiveColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      margin: const EdgeInsets.symmetric(horizontal: 16 / 2),
      height: 5,
      width: 8,
      decoration: BoxDecoration(
        color: isActive ? activeColor : inActiveColor.withOpacity(0.25),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
    );
  }
}

// Demo data for our Onboarding screen
List<Map<String, dynamic>> demoData = [
  {
    "illustration": AssetManager.ONBOARDING_IMAGE,
    "title": "Search",
    "text":
        "Choose your origin, destination, journey dates and search for trains.",
  },
  {
    "illustration": AssetManager.ONBOARDING_IMAGE_1,
    "title": "Select",
    "text": "Select your desired trip and choose your seats.",
  },
  {
    "illustration": AssetManager.ONBOARDING_IMAGE_2,
    "title": "Pay",
    "text": "Pay for the tickets via Debit / Credit Cards or MFS.",
  },
];

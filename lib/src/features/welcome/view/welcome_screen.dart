import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../gen/assets.gen.dart';
import '../../../constants/app_sizes.dart';
import '../../../router/app_router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: SizedBox.square(
                    dimension: 300.0,
                    child: SvgPicture.asset(Assets.illustrations.untitled),
                  ),
                ),
                Column(
                  children: const [
                    Text('Take Video Courses'),
                    Gaps.h12,
                    Text(
                      'From cooking to coding\nand everything in between',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            color: Colors.black,
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => context.goNamed(LRoute.home.name),
                    child: const Text('Browse'),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () => context.pushNamed(LRoute.signIn.name),
                    child: const Text('Sign In'),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

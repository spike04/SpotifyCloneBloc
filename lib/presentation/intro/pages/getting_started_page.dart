import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/common/widgets/button/basic_app_button.dart';
import 'package:spotify_clone/core/configs/assets/app_images.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';
import 'package:spotify_clone/core/configs/gap.dart';
import 'package:spotify_clone/core/extensions/context.dart';
import 'package:spotify_clone/presentation/choose_theme_mode/pages/choose_theme_mode_page.dart';

class GettingStartedPage extends StatelessWidget {
  const GettingStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.introBg),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.15),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 40,
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(AppVectors.spotifyLogo),
                ),
                const Spacer(),
                Text(
                  'Enjoy Listening to Music',
                  style: const TextStyle(
                    fontSize: 24,
                  ).bold.white,
                ),
                gapH24,
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  style: const TextStyle(fontSize: 14).gray.medium,
                  textAlign: TextAlign.center,
                ),
                gapH20,
                BasicAppButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => const ChooseThemeModePage(),
                      ),
                    );
                  },
                  text: 'Get Started',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

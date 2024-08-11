import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/common/widgets/button/basic_app_button.dart';
import 'package:spotify_clone/core/configs/assets/app_images.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';
import 'package:spotify_clone/core/configs/gap.dart';
import 'package:spotify_clone/core/extensions/context.dart';
import 'package:spotify_clone/presentation/auth/pages/signup_or_signin.dart';
import 'package:spotify_clone/presentation/choose_theme_mode/bloc/theme_cubit.dart';

class ChooseThemeModePage extends StatelessWidget {
  const ChooseThemeModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.chooseModeBg),
                fit: BoxFit.cover,
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
                  'Choose Mode',
                  style: const TextStyle(
                    fontSize: 24,
                  ).bold.gray,
                ),
                gapH24,
                BlocBuilder<ThemeCubit, ThemeMode>(
                  builder: (context, mode) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                context
                                    .read<ThemeCubit>()
                                    .updateThemeMode(ThemeMode.dark);
                              },
                              child: ClipOval(
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                  child: Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      color:
                                          const Color(0xff30393c).withOpacity(
                                        mode == ThemeMode.dark ? 1 : 0,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                    child: SvgPicture.asset(
                                      AppVectors.moon,
                                      fit: BoxFit.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            gapH16,
                            Text(
                              'Dark Mode',
                              style: const TextStyle(fontSize: 16).gray.medium,
                            ),
                          ],
                        ),
                        gapW50,
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                context
                                    .read<ThemeCubit>()
                                    .updateThemeMode(ThemeMode.light);
                              },
                              child: ClipOval(
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                  child: Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      color:
                                          const Color(0xff30393c).withOpacity(
                                        mode == ThemeMode.light ? 1 : 0,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                    child: SvgPicture.asset(
                                      AppVectors.sun,
                                      fit: BoxFit.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            gapH16,
                            Text(
                              'Light Mode',
                              style: const TextStyle(fontSize: 16).gray.medium,
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
                gapH50,
                BasicAppButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const SignUpOrSignInPage(),
                      ),
                    );
                  },
                  text: 'Continue',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

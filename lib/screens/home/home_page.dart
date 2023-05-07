import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/screens/drawer/app_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Ashutosh Shashi',
          ),
          centerTitle: true,
        ),
        drawer: const AppDrawer(),
        body: SizedBox(
          child: Stack(
            children: [
              Positioned(
                bottom: 0.1,
                right: 10,
                child: Opacity(
                  opacity: 0.9,
                  child: Image.asset(
                    StaticUtils.blackWhitePhoto,
                    height: size.height * 0.75,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.orange,
                        size: size.width * 0.08,
                      ),
                      AnimatedTextKit(
                        animatedTexts: [
                          TyperAnimatedText('Author',
                              speed: const Duration(milliseconds: 50),
                              textStyle: animatedText(size)),
                          TyperAnimatedText('Technology Leader',
                              speed: const Duration(milliseconds: 50),
                              textStyle: animatedText(size)),
                          TyperAnimatedText('co-founder of STEMars EdTech',
                              speed: const Duration(milliseconds: 50),
                              textStyle: animatedText(size)),
                          TyperAnimatedText('Entrepreneur',
                              speed: const Duration(milliseconds: 50),
                              textStyle: animatedText(size)),
                          TyperAnimatedText('Trainer',
                              speed: const Duration(milliseconds: 50),
                              textStyle: animatedText(size)),
                          TyperAnimatedText('Blogger',
                              speed: const Duration(milliseconds: 50),
                              textStyle: animatedText(size)),
                        ],
                        repeatForever: true,
                        isRepeatingAnimation: true,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                    ],
                  ),
                  Row(
                    children: StaticUtils.socialIconURL
                        .asMap()
                        .entries
                        .map(
                          (e) => Ink(
                            decoration: const ShapeDecoration(
                              color: Colors.lightBlue,
                              shape: CircleBorder(),
                            ),
                            child: IconButton(
                              icon: Image.network(e.value),
                              color: Colors.white,
                              onPressed: () {
                                openURL(StaticUtils.socialLinks[e.key]);
                              },
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  //  )
                  // const SocialLinks(),
                ],
              ),
            ],
          ),
        ));
  }

  TextStyle animatedText(Size size) {
    return TextStyle(
      fontSize: size.width * 0.05,
      fontWeight: FontWeight.bold,
      color: Colors.red,
    );
  }

  TextStyle headingText(Size size) {
    return TextStyle(
      fontSize: size.width * 0.06,
      fontWeight: FontWeight.bold,
      color: Colors.green,
    );
  }

  void openURL(String url) => launchUrl(
        Uri.parse(url),
      );
}

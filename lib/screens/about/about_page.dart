import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/about_utils.dart';
import '../../utils/utils.dart';
import '../drawer/app_drawer.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('About me'),
        backgroundColor: Colors.blue,
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 20.0,
          ),
          child: SizedBox(
            child: Column(
              children: [
                const Text(
                  "A person with diverse experience",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    letterSpacing: 1.0,
                  ),
                ),
                Center(
                  child: Image.asset(
                    StaticUtils.mobilePhoto,
                    height: size.height * 0.17,
                  ),
                ),
                const Text(
                  "Who am I?",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange,
                    letterSpacing: 1.0,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                const Text(
                  AboutUtils.aboutMeHeadline,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    letterSpacing: 1.0,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                const Text(
                  AboutUtils.aboutMeDetail,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    letterSpacing: 1.0,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "Email :  ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          letterSpacing: 1.0,
                        ),
                      ),
                      TextSpan(
                        text: "as@ashutoshshashi.com",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.deepOrange,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ],
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    openURL(StaticUtils.resume);
                  },
                  child: const Text(
                    "Resume",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.deepOrange,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void openURL(String url) => launchUrl(
        Uri.parse(url),
      );
}

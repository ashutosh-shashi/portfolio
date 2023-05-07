import 'package:awesome_icons/awesome_icons.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/screens/drawer/app_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/book_utils.dart';
import '../../utils/utils.dart';

class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  int _currentBookIndex = 0;
  bool _showButtons = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Published Books'),
        backgroundColor: Colors.blue,
      ),
      drawer: const AppDrawer(),
      body: Stack(
        children: <Widget>[
          CarouselSlider(
            items: [
              for (int itemIndex = 0; itemIndex <= 2; itemIndex++)
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    margin: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          BookUtils.bookIcons[itemIndex],
                        ),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
            ],
            options: CarouselOptions(
              height: double.infinity,
              viewportFraction: 0.8,
              enlargeStrategy: CenterPageEnlargeStrategy.scale,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              onPageChanged: (index, reason) {
                setState(() {
                  _currentBookIndex = index;
                });
              },
            ),
          ),
          if (_showButtons)
            Positioned(
              bottom: size.height * 0.12,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton.icon(
                      icon: const Icon(FontAwesomeIcons.amazon),
                      label: const Text('Amazon'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                          (states) {
                            if (states.contains(MaterialState.focused) ||
                                states.contains(MaterialState.hovered)) {
                              return Colors.blue.withOpacity(0.8);
                            }
                            return Colors.blue;
                          },
                        ),
                      ),
                      onPressed: () {
                        openURL(BookUtils.bookAmazon[_currentBookIndex]);
                      },
                      onFocusChange: (focused) {
                        setState(() {});
                      },
                    ),
                    ElevatedButton.icon(
                      icon: Image.asset(
                        StaticUtils.bn,
                        height: size.width * 0.05,
                      ),
                      label: const Text('Barnes & Noble'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                          (states) {
                            if (states.contains(MaterialState.focused) ||
                                states.contains(MaterialState.hovered)) {
                              return Colors.red.withOpacity(0.8);
                            }
                            return Colors.red;
                          },
                        ),
                      ),
                      onPressed: () {
                        openURL(BookUtils.bookBn[_currentBookIndex]);
                      },
                      onFocusChange: (focused) {
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  void openURL(String url) => launchUrl(
        Uri.parse(url),
      );
}

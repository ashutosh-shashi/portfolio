import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/screens/drawer/app_drawer.dart';

import '../../utils/book_utils.dart';

class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  int _currentBookIndex = 0;
  bool _showDialog = false;

  void _toggleDialog() {
    setState(() {
      _showDialog = !_showDialog;
    });
  }

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
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentBookIndex = itemIndex;
                      _toggleDialog();
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
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
              viewportFraction: 1.0,
              enlargeCenterPage: true,
              autoPlay: true,
              reverse: true,
              autoPlayInterval: const Duration(seconds: 3),
              onPageChanged: (index, reason) {
                setState(() {
                  _currentBookIndex = index;
                });
              },
            ),
          ),
          if (_showDialog)
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _toggleDialog();
                  });
                },
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
          if (_showDialog)
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Card(
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          BookUtils.bookTitles[_currentBookIndex],
                          style: TextStyle(fontSize: 24.0),
                        ),
                        SizedBox(height: 16.0),
                        Container(
                          width: double.infinity,
                          height: size.height * 0.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: AssetImage(
                                BookUtils.bookIcons[_currentBookIndex],
                              ),
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          BookUtils.bookDescription[_currentBookIndex],
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            ElevatedButton(
                              child: Text('Button 1'),
                              onPressed: () {
                                // TODO: Add functionality for button 1
                              },
                            ),
                            ElevatedButton(
                              child: Text('Button 2'),
                              onPressed: () {
                                // TODO: Add functionality for button 2
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:portfolio/screens/about/about_page.dart';
import 'package:portfolio/screens/book/book_page.dart';
import 'package:portfolio/screens/contact/contact_page.dart';
import 'package:portfolio/screens/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ashutosh',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/about': (context) => const AboutPage(),
        '/book': (context) => const BookPage(),
        '/contact': (context) => const ContactPage(),
      },
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
      ),
    );
  }
}

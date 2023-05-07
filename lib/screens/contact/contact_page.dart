import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/utils.dart';
import '../drawer/app_drawer.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact'),
      ),
      drawer: const AppDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              StaticUtils.coloredPhoto,
              height: size.height * 0.2,
            ),
          ),
          const Text(
            "let's work together",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              letterSpacing: 1.0,
            ),
          ),
          _buildContactTile(
            context,
            icon: Icons.email,
            label: 'Email',
            value: 'as@ashutoshshashi.com',
            onTap: () => openURL('mailto:as@ashutoshshashi.com'),
          ),
          _buildContactTile(
            context,
            icon: Icons.schedule,
            label: 'Schedule Meeting',
            value: 'https://cal.com/techas',
            onTap: () => openURL('https://cal.com/techas'),
          ),
          _buildContactTile(
            context,
            icon: Icons.phone,
            label: 'Twitter',
            value: '@ashutoshshashi',
            onTap: () => openURL('https://twitter.com/ashutoshshashi'),
          ),
          _buildContactTile(
            context,
            icon: Icons.link,
            label: 'LinkedIn',
            value: '/in/ashutoshshashi',
            onTap: () => openURL('https://linkedin.com/in/ashutoshshashi'),
          ),
        ],
      ),
    );
  }

  Widget _buildContactTile(BuildContext context,
      {required IconData icon,
      required String label,
      required String value,
      required void Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(icon),
              title: Text(
                label,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  letterSpacing: 1.0,
                ),
              ),
              subtitle: Text(
                value,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  letterSpacing: 1.0,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 1.0,
              color: Theme.of(context).dividerColor,
            ),
            SizedBox(
              width: double.infinity,
              height: 48.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.open_in_browser),
                  SizedBox(width: 10.0),
                  Text(
                    'Open in browser',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      letterSpacing: 1.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void openURL(String url) => launchUrl(
        Uri.parse(url),
      );
}

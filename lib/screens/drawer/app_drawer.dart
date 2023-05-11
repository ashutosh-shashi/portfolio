import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      child: ListView(
        children: [
          SizedBox(
            height: size.height * 0.1,
            child: const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                //image: DecorationImage(
                //   image: AssetImage("assets/photos/mobile.png"),
                //    fit: BoxFit.cover,
                //  ),
              ),
              child: Text(
                'Ashutosh',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
            ),
            title: const Text(
              'Home',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
            ),
            tileColor: Colors.white,
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.person,
            ),
            tileColor: Colors.white,
            title: const Text(
              'About me',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/about');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.book_outlined,
            ),
            title: const Text(
              'Books',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
            ),
            tileColor: Colors.white,
            onTap: () {
              Navigator.pushReplacementNamed(context, '/book');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.contact_phone_outlined,
            ),
            tileColor: Colors.white,
            title: const Text(
              'Contact',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/contact');
            },
          ),
        ],
      ),
    );
  }
}

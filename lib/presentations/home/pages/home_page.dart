import 'package:flutter/material.dart';
import 'package:flutter_agribisnisku/core/assets/assets.gen.dart';
import 'package:flutter_agribisnisku/presentations/business_profile/pages/business_profile.dart';
import 'package:flutter_agribisnisku/presentations/product_target/page/product_page.dart';
import '../../business_target/pages/business_page.dart';
import '../../marketing/pages/marketing_page.dart';
import '../widgets/header_home.dart';
import '../widgets/menu_home.dart';
import '../widgets/title_section.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigasi ke halaman profil jika ikon profil diklik
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProfilePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const HeaderHome(),
          const SizedBox(height: 15.0),
          const TitleSection(
            title: 'Beranda',
            // onSeeAllTap: () {},
          ),
          const SizedBox(height: 16.0),
          GridView(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 24.0,
            ),
            children: [
              MenuHome(
                imagePath: Assets.images.logo.path,
                label: 'My Business',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BusinessProfile()),
                  );
                },
              ),
              MenuHome(
                imagePath: Assets.images.marketingTarget.path,
                label: 'Marketing Plan',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MarketingTargetPage(),
                    ),
                  );
                },
              ),
              MenuHome(
                imagePath: Assets.images.businessTarget.path,
                label: 'Business Plan',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BusinessTargetPage(),
                    ),
                  );
                },
              ),
              MenuHome(
                imagePath: Assets.images.produkTarget.path,
                label: 'Product Plan',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProductTargetPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.lightGreen,
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
      ),
    );
  }
}

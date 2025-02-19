import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:trate/pages/profile_page.dart';
import 'package:trate/pages/form_page.dart';
import 'package:trate/pages/home_page.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;

  void _changeTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _screens = [];

  @override
  void initState() {
    super.initState();
    _screens.addAll([
      HomePage(),
      FormPage(),
      ProfilePage(onNavigateToForm: () => _changeTab(1)),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Trate', style: GoogleFonts.bebasNeue(fontSize: 25)),
      //   backgroundColor: Theme.of(context).colorScheme.primary,
      //   centerTitle: true,
      // ),
      body: Center(child: _screens[_currentIndex]),
      bottomNavigationBar: Material(
        color: Theme.of(context).colorScheme.surface,
        elevation: 10.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1.0, vertical: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: GNav(
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  color: Theme.of(context).colorScheme.onSurface,
                  activeColor: Theme.of(context).colorScheme.secondary,
                  tabBackgroundColor: Theme.of(context).colorScheme.secondary.withAlpha(50),
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  tabs: const [
                    GButton(icon: Icons.chat_bubble, text: 'Wall', iconSize: 24, gap: 8),
                    GButton(icon: Icons.translate, text: 'Translate', iconSize: 24, gap: 8),
                    GButton(icon: Icons.person, text: 'Profile', iconSize: 24, gap: 8),
                  ],
                  selectedIndex: _currentIndex,
                  onTabChange: (index) => _changeTab(index),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

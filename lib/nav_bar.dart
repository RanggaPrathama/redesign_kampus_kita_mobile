import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percobaan_tampilan/screen/home.dart';
import 'package:percobaan_tampilan/screen/news.dart';
import 'package:percobaan_tampilan/screen/payment.dart';
import 'package:percobaan_tampilan/screen/profile.dart';
import 'package:percobaan_tampilan/utils/color.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;
  double _scale = 1.0;

  static const List<Widget> _screen = <Widget>[
    HomePage(),
    NewsPage(),
    PaymentPage(),
    ProfilePage(),
  ];

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _scale = 1.2;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _scale = 1.0;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _scale = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _navbarItem_custom(
                "Home",
                _selectedIndex == 0
                    ? "assets/icon/house-chimney-solid.png"
                    : "assets/icon/house-chimney.png",
                0),
            _navbarItem(
                "News",
                _selectedIndex == 1
                    ? FontAwesomeIcons.solidNewspaper
                    : FontAwesomeIcons.newspaper,
                1),
            SizedBox(
              width: 20,
            ),
            _navbarItem_custom(
                "Payment",
                _selectedIndex == 2
                    ? "assets/icon/money-bill-wave-solid.png"
                    : "assets/icon/money-bill-wave.png",
                2),
            _navbarItem(
                "Profile",
                _selectedIndex == 3
                    ? FontAwesomeIcons.solidUser
                    : FontAwesomeIcons.user,
                3),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.blue.shade200),
        child: Container(
          margin: EdgeInsets.all(10),
          child: ClipOval(
            child: Material(
              elevation: 10,
              color: UAcolor.blue,
              child: InkWell(
                onTap: () {},
                splashColor: Colors.blue.shade400,
                child: SizedBox(
                    width: 50,
                    height: 50,
                    child: Icon(
                      Icons.qr_code_scanner,
                      color: Colors.white,
                    )),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _navbarItem_custom(String label, String icon, int index) {
    return InkWell(
        onTapUp: _onTapUp,
        onTapDown: _onTapDown,
        onTap: () => _onItemTapped(index),
        child: AnimatedScale(
          scale: _selectedIndex == index ? 1.1 : 1.0,
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          child: Column(
            children: [
              // Icon(icon, size: 20, color: _selectedIndex == index ? Colors.blue : Colors.grey.shade400,)
              ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (bounds) {
                  return LinearGradient(
                    colors: _selectedIndex == index
                        ? [UAcolor.blue, UAcolor.accentColor]
                        : [Colors.grey.shade400, Colors.grey.shade400],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds);
                },
                child: Image.asset(
                  icon,
                  width: 22,
                ),
              ),
              Text(
                label,
                style: TextStyle(
                    color: _selectedIndex == index
                        ? Colors.blue
                        : Colors.grey.shade400),
              )
            ],
          ),
        ));
  }

  Widget _navbarItem(String label, IconData icon, int index) {
    return InkWell(
        onTap: () => _onItemTapped(index),
        child: AnimatedScale(
          scale: _selectedIndex == index ? 1.1 : 1.0,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          child: Column(
            children: [
              ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (bounds) {
                  return LinearGradient(
                    colors: _selectedIndex == index
                        ? [UAcolor.blue, UAcolor.accentColor]
                        : [Colors.grey.shade400, Colors.grey.shade400],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds);
                },
                child:  Icon(
                  icon,
                  size: 22,
                )
              ),
              Text(
                label,
                style: TextStyle(
                    color: _selectedIndex == index
                        ? Colors.blue
                        : Colors.grey.shade400),
              )
            ],
          ),
        ));
  }
}

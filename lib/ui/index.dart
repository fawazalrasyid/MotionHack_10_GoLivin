import 'package:golivin/constants/icons.dart';
import 'package:golivin/ui/order/views/my_order.dart';
import 'package:golivin/ui/profile/views/profile.dart';
import 'package:golivin/ui/wishlist/views/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/colors.dart';
import 'home/views/home.dart';

class IndexScreen extends StatefulWidget {
  @override
  _IndexScreenState createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  int _selectedIndex = 0;

  void _onTabItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: <Widget>[
          HomeScreen(),
          MyOrderScreen(),
          WishlistScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: AppColors.bottomNavBgColor,
          currentIndex: _selectedIndex,
          onTap: _onTabItem,
          items: <BottomNavigationBarItem>[
            buildBottomNavigationBarItem(
              icon: AppIcons.home_outline,
              activeIcon: AppIcons.home,
            ),
            buildBottomNavigationBarItem(
              icon: AppIcons.document_outline,
              activeIcon: AppIcons.document,
            ),
            buildBottomNavigationBarItem(
              icon: AppIcons.bookmark_outline,
              activeIcon: AppIcons.bookmark,
            ),
            buildBottomNavigationBarItem(
              icon: AppIcons.profile_outline,
              activeIcon: AppIcons.profile,
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem({
    required String icon,
    required String activeIcon,
  }) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        icon,
        color: AppColors.icon,
      ),
      activeIcon: SvgPicture.asset(
        activeIcon,
        color: AppColors.iconActive,
      ),
      label: "",
    );
  }
}

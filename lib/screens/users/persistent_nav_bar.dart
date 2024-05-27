// Main files
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
// Project files
import 'package:ecommerce/main.dart';
import 'package:ecommerce/screens/users/home.dart';
import 'package:ecommerce/screens/users/order.dart';
import 'package:ecommerce/screens/users/user_profile.dart';
import 'package:ecommerce/screens/users/all_products.dart';

class Tabs extends StatelessWidget {
  const Tabs({super.key});

  // List of screen
  List<Widget> _buildScreens() {
    return [
      Home(),
      SeeAllProducts(),
      UserOrders(),
      UserProfile(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home_outlined),
        title: ("Home"),
        activeColorPrimary: style.color1,
        inactiveColorPrimary: style.color2,
        textStyle: style.mainTitle.copyWith(
          fontSize: 20,
          letterSpacing: 1.5,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.storefront),
        title: ("Store"),
        activeColorPrimary: style.color1,
        inactiveColorPrimary: style.color2,
        textStyle: style.mainTitle.copyWith(
          fontSize: 20,
          letterSpacing: 1.5,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.shopping_bag_outlined,
          color: style.color1,
        ),
        title: ("Orders"),
        activeColorPrimary: style.color1,
        inactiveColorPrimary: style.color2,
        textStyle: style.mainTitle.copyWith(
          fontSize: 20,
          letterSpacing: 1.5,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person_2_outlined),
        title: ("Profile"),
        activeColorPrimary: style.color1,
        inactiveColorPrimary: style.color2,
        textStyle: style.mainTitle.copyWith(
          fontSize: 20,
          letterSpacing: 1.5,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    PersistentTabController _controller =
        PersistentTabController(initialIndex: 0);

    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        // colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style9, // Choose the nav bar style with this property.
    );
  }
}

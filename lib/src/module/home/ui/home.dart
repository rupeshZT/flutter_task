import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_esp/src/module/home/ui/price_page.dart';
import 'package:flutter_task_esp/src/module/other_screens/other_page.dart';
import 'package:flutter_task_esp/src/widget/search_button_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();

    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<Widget> _buildScreens() {
    return [
      PricePage(),
      OtherPages(title: 'page 2'),
      OtherPages(title: 'page 3'),
      OtherPages(title: 'Page 4'),
      OtherPages(title: 'Page 5'),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
          icon: Icon(Icons.ac_unit),
          activeColorPrimary: Colors.grey,
          activeColorSecondary: Colors.white),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.ac_unit),
          activeColorPrimary: Colors.grey,
          activeColorSecondary: Colors.white),
      PersistentBottomNavBarItem(
          icon: CircleAvatar(
            child: Icon(Icons.add),
            backgroundColor: Colors.white,
          ),
          activeColorPrimary: Colors.grey,
          activeColorSecondary: Colors.white),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.ac_unit),
          activeColorPrimary: Colors.grey,
          activeColorSecondary: Colors.white),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.ac_unit),
          activeColorPrimary: Colors.grey,
          activeColorSecondary: Colors.white),
    ];
  }

  Widget _tabBarBody() {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),

      onItemSelected: (i) {},
    
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.purpleAccent,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25),
            topLeft: Radius.circular(25),
          ),
          // circular(25.0),
          boxShadow: [
            BoxShadow(
              color:
                  Theme.of(context).colorScheme.primaryVariant.withOpacity(0.3),
              // Colors.grey,
              blurRadius: 10.0,
            ),
          ]),
 
      popAllScreensOnTapOfSelectedTab: true,

      popActionScreens: PopActionScreensType.all,
   
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: false,
       
      ),
      navBarStyle: NavBarStyle.style6,

      navBarHeight: 60,
    );
  }

  @override
  Widget build(BuildContext context) {
    return mainbody();
  }

  Widget mainbody() {
    return Scaffold(
      appBar: AppBar(
          title: Text('Swappful'),
          centerTitle: false,
          elevation: 4.0,
          leading: Icon(Icons.ac_unit),
          actions: const [
            SearchButtonWidget(
              language: 'English',
            ),
          ]),
      
      body: Stack(
        children: [
          _tabBarBody(),
        ],
      ),
    );
  }


}

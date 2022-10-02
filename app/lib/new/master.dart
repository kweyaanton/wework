import 'package:flutter/material.dart';
import 'package:login_signup/new/wallet.dart';
import 'package:login_signup/pages/create_resume.dart';
import 'applications.dart';
import 'jobs.dart';
import 'data.dart';
import 'wallet.dart';

class Master extends StatefulWidget {
  @override
  _MasterState createState() => _MasterState();
}

class _MasterState extends State<Master> {
  List<NavigationItem> navigationItems = getNavigationItemList();
  late NavigationItem selectedItem;

  late Widget currentWidgetView;

  @override
  void initState() {
    super.initState();
    setState(() {
      selectedItem = navigationItems[0];
      currentWidgetView = Jobs();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        child: currentWidgetView,
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: buildNavigationItems(),
        ),
      ),
    );
  }

  List<Widget> buildNavigationItems() {
    List<Widget> list = [];
    for (var navigationItem in navigationItems) {
      list.add(buildNavigationItem(navigationItem));
    }
    return list;
  }

  Widget buildNavigationItem(NavigationItem item) {
    return GestureDetector(
      onTap: () {
        setState(() {
          switch (item.title) {
            case "Jobs":
              currentWidgetView = Jobs();
              break;
            case "Applications":
              currentWidgetView = Applications();
              break;
            case "wallet":
              currentWidgetView = wallet();
              break;
          }
          selectedItem = item;
        });
      },
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 300),
        opacity: selectedItem == item ? 1.0 : 0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              item.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            selectedItem == item
                ? Column(
                    children: <Widget>[
                      SizedBox(
                        height: 4,
                      ),
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 81, 32, 32),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

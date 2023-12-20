import 'dart:ui';

import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:untitled6/core/constant/color_manager.dart';
import 'package:untitled6/presentation/screens/home/home-screen.dart';
import 'package:untitled6/presentation/screens/Spash.dart';
import 'package:untitled6/presentation/screens/voice_screen.dart';

import '../widgets/tabBar.dart';
import 'project/creat_project_screen.dart';
import 'devices_screen.dart';
import 'mqtt_screen.dart';
import 'vertical box.dart';
import 'charts.dart';
import 'edit_profile.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff141415),
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: <Widget>[
          // const CreateProjectScreen(),
          HomeScreen(),
          const TabBarPage(),
          SpeechScreen(),
          const LineChartSample2(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 80,
        padding: const EdgeInsets.only(top: 25),
        margin: const EdgeInsets.symmetric(horizontal: 22),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(80.0),
          ),
          child: Container(
            color: Colors.black45.withOpacity(0.9),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: TabBar(
                labelColor: AppColor.primary,
                unselectedLabelColor: Colors.white,
                labelStyle: const TextStyle(fontSize: 10.0),
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(color: Color(0xff141415), width: 0.0),
                ),
                indicatorColor: Colors.black54,
                tabs: <Widget>[
                  const Tab(
                    icon: Icon(
                      FeatherIcons.home,
                      size: 24.0,
                    ),
                  ),
                  const Tab(
                    icon: Icon(
                      FeatherIcons.grid,
                      size: 24.0,
                    ),
                  ),
                  const Tab(
                    icon: Icon(
                      FeatherIcons.mic,
                      size: 24.0,
                    ),
                  ),
                  const Tab(
                    icon: Icon(
                      FeatherIcons.barChart2,
                      size: 24.0,
                    ),
                  ),
                  const Tab(
                    icon: Icon(
                      FeatherIcons.user,
                      size: 24.0,
                    ),
                  ),
                ],
                controller: _tabController,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:valo_dex/controller/agent_controller.dart';
import 'package:valo_dex/controller/weapon_controller.dart';
import 'package:valo_dex/screens/agents/agent_details.dart';
import 'package:valo_dex/screens/agents/agent_list.dart';
import 'package:valo_dex/screens/agents/agents.dart';
import 'package:valo_dex/screens/weapons/weapon_details.dart';
import 'package:valo_dex/screens/weapons/weapon_list.dart';
import 'package:valo_dex/screens/weapons/weapons.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:valo_dex/utils/colors.dart';

void main() {
  initializeServices();
  runApp(const ValoDexApp());
}

void initializeServices() {
  Get.put(AgentController());
  Get.put(WeaponController());
}

class ValoDexApp extends StatelessWidget {
  const ValoDexApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Valo Dex',
      home: MyHomePage(),
      getPages: [
        GetPage(name: '/agents', page: () => Agents()),
        GetPage(name: '/weapons', page: () => Weapons()),
        GetPage(name: '/agent_list', page: () => AgentList()),
        GetPage(name: '/agent_details', page: () => AgentDetails()),
        GetPage(name: '/weapon_list', page: () => WeaponList()),
        GetPage(name: '/weapon_details', page: () => WeaponDetails()),
      ],
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final _page = 0.obs;
  final List _screens = [Agents(), Weapons()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _screens[_page.value]),
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
        backgroundColor: redVariant1,
        color: greyVariant,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 400),
        items: const [
          Icon(FontAwesomeIcons.userSecret, size: 30, color: Colors.white),
          Icon(FontAwesomeIcons.gun, size: 30, color: Colors.white),
        ],
        onTap: (index) => _page.value = index,
      ),
    );
  }
}

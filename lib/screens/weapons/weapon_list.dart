import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valo_dex/controller/weapon_controller.dart';
import 'package:valo_dex/utils/colors.dart';
import 'package:valo_dex/utils/widgets.dart';

class WeaponList extends StatelessWidget {
  WeaponList({super.key});
  final weaponCtlr = Get.find<WeaponController>();

  List filterSkins(int index) {
    List skinList = weaponCtlr.weaponList[index]['skins'];
    List filteredSkinsList = List.from(skinList);

    filteredSkinsList.removeWhere((skin) {
      return skin['displayName'].contains('Standard') ||
          skin['displayName'].contains('Random Favorite') ||
          skin['displayIcon'] == null ||
          skin['displayName'] == null;
    });

    return filteredSkinsList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ValoDexAppBar(),
      backgroundColor: redVariant1,
      body: SafeArea(
        child: ListView.builder(
          itemCount: weaponCtlr.weaponList.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              List skinList = filterSkins(index);
              Get.toNamed('/weapon_details', arguments: {
                'weaponData': weaponCtlr.weaponList[index],
                'skinList': skinList,
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: 200,
              decoration: BoxDecoration(
                color: greyVariant.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    weaponCtlr.weaponList[index]['displayIcon'],
                    height: 100,
                  ),
                  Text(
                    weaponCtlr.weaponList[index]['displayName'].toString().toUpperCase(),
                    style: GoogleFonts.montserrat(),
                    textScaleFactor: 2.3,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

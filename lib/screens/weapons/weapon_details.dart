import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valo_dex/controller/weapon_controller.dart';
import 'package:valo_dex/utils/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';

class WeaponDetails extends StatelessWidget {
  WeaponDetails({super.key});
  final Map weaponData = Get.arguments['weaponData'];
  final List skinList = Get.arguments['skinList'].toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redVariant1,
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(height: Get.height / 3, child: Image.asset('assets/images/gun-bg.jpg', fit: BoxFit.cover)),
                Image.network(weaponData['displayIcon']),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: greyVariant.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  WeaponTitleAndInfo(title: 'Weapon', info: weaponData['displayName']),
                  if (weaponData['displayName'] != 'Melee')
                    WeaponTitleAndInfo(title: 'Category', info: weaponData['shopData']['category']),
                  if (weaponData['displayName'] != 'Melee')
                    WeaponTitleAndInfo(title: 'Cost', info: weaponData['shopData']['cost'].toString()),
                ],
              ),
            ),
            if (weaponData['displayName'] != 'Melee')
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: greyVariant.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    WeaponTitleAndInfo(title: 'Fire Rate', info: weaponData['weaponStats']['fireRate'].toString()),
                    WeaponTitleAndInfo(title: 'Magazine Size', info: weaponData['weaponStats']['magazineSize'].toString()),
                    WeaponTitleAndInfo(
                        title: 'Run Speed Multiplier', info: weaponData['weaponStats']['runSpeedMultiplier'].toString()),
                    WeaponTitleAndInfo(title: 'Equip Time', info: '${weaponData['weaponStats']['equipTimeSeconds']} s'),
                    WeaponTitleAndInfo(title: 'Reload Time', info: '${weaponData['weaponStats']['reloadTimeSeconds']} s'),
                    WeaponTitleAndInfo(title: 'Bullet Accuracy', info: weaponData['weaponStats']['firstBulletAccuracy'].toString()),
                    WeaponTitleAndInfo(
                      title: 'Wall Penetration',
                      info: weaponData['weaponStats']['wallPenetration'].toString().substring(
                          weaponData['weaponStats']['wallPenetration'].toString().indexOf('::') + 2,
                          weaponData['weaponStats']['wallPenetration'].toString().length),
                    ),
                  ],
                ),
              ),
            CarouselSlider(
              options: CarouselOptions(height: 400.0),
              items: skinList.map(
                (skin) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                        decoration: BoxDecoration(color: greyVariant.withOpacity(0.5), borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.network(skin['displayIcon']),
                            Text(
                              skin['displayName'],
                              style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
                              textScaleFactor: 2.0,
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ).toList(),
            )
          ],
        ),
      ),
    );
  }
}

class WeaponTitleAndInfo extends StatelessWidget {
  const WeaponTitleAndInfo({
    super.key,
    required this.title,
    required this.info,
    this.softWrap = false,
  });

  final String title;
  final String info;
  final bool softWrap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(right: 5),
            width: Get.width / 2.0,
            child: Text(
              title,
              textAlign: TextAlign.right,
              style: GoogleFonts.montserrat(
                color: greyVariant,
                fontWeight: FontWeight.bold,
              ),
              textScaleFactor: 1.3,
            ),
          ),
          SizedBox(
            width: Get.width - Get.width / 1.7,
            child: Text(
              info,
              style: GoogleFonts.montserrat(color: greyVariant),
              textScaleFactor: 1.3,
              softWrap: softWrap,
            ),
          ),
        ],
      ),
    );
  }
}

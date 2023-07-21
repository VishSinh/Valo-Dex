import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valo_dex/controller/weapon_controller.dart';
import 'package:valo_dex/screens/weapons/weapon_list.dart';
import 'package:valo_dex/utils/colors.dart';
import 'package:valo_dex/utils/widgets.dart';

class Weapons extends StatelessWidget {
  Weapons({super.key});
  final weaponCtlr = Get.find<WeaponController>();

  var isLoading = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ValoDexAppBar(backButton: false),
      backgroundColor: redVariant1,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              width: Get.width - 50,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Image.asset('assets/gif/valo-gun.gif'),
            ),
            const SizedBox(width: double.infinity),
            Obx(
              () => ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: greyVariant,
                  disabledBackgroundColor: greyVariant,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                onPressed: isLoading.value
                    ? null
                    : () async {
                        isLoading.value = true;
                        await weaponCtlr.getWeapons();
                        isLoading.value = false;
                        Get.to(() => WeaponList());
                      },
                child: SizedBox(
                  width: Get.width / 2,
                  height: 50,
                  child: Center(
                    child: isLoading.value
                        ? const SpinKitChasingDots(color: redVariant1)
                        : Text(
                            'Gun Locker',
                            style: GoogleFonts.montserrat(),
                            textScaleFactor: 1.2,
                          ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:valo_dex/controller/agent_controller.dart';
import 'package:valo_dex/main.dart';
import 'package:valo_dex/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:valo_dex/utils/widgets.dart';

class Agents extends StatelessWidget {
  Agents({super.key});
  final agentCtlr = Get.find<AgentController>();
  final RxBool isLoading = false.obs;

  Future<void> getAgents() async {
    isLoading.value = true;
    bool success = await agentCtlr.getAgents();
    isLoading.value = false;
    if (success) {
      Get.toNamed('/agent_list');
    } else {
      Get.snackbar('Error', 'An Error occured while fetching data\nPlease try again!');
    }
  }

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
              child: Image.asset('assets/gif/jett-valorant.gif'),
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
                onPressed: isLoading.value ? null : getAgents,
                child: SizedBox(
                  width: Get.width / 2,
                  height: 50,
                  child: Center(
                    child: isLoading.value
                        ? const SpinKitChasingDots(color: redVariant1)
                        : Text(
                            'Agent Lounge',
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

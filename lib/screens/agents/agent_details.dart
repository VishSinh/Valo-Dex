import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valo_dex/controller/agent_controller.dart';
import 'package:valo_dex/utils/colors.dart';

class AgentDetails extends StatelessWidget {
  AgentDetails({super.key});
  final Map agentData = Get.arguments['agentData'];

  String description = Get.arguments['agentData']['description'];

  @override
  Widget build(BuildContext context) {
    description = Get.find<AgentController>().shortenDescription(description);
    return Scaffold(
      backgroundColor: redVariant1,
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.network(
                  agentData['background'],
                  loadingBuilder: (context, child, loadingProgress) =>
                      loadingProgress == null ? child : const SpinKitDualRing(color: greyVariant),
                ),
                Image.network(
                  agentData['fullPortrait'],
                  loadingBuilder: (context, child, loadingProgress) =>
                      loadingProgress == null ? child : const SpinKitDualRing(color: greyVariant),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: greyVariant.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  TitleAndInfo(title: 'Title', info: agentData['displayName']),
                  TitleAndInfo(title: 'Role', info: agentData['role']['displayName']),
                  TitleAndInfo(title: 'Description', info: description, softWrap: true),
                ],
              ),
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
                  TitleAndInfo(title: 'Ability 1', info: agentData['abilities'][0]['displayName']),
                  TitleAndInfo(title: 'Ability 2', info: agentData['abilities'][1]['displayName']),
                  TitleAndInfo(title: 'Ability 3', info: agentData['abilities'][2]['displayName']),
                  TitleAndInfo(title: 'Ultimate', info: agentData['abilities'][3]['displayName']),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TitleAndInfo extends StatelessWidget {
  const TitleAndInfo({
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
            width: Get.width - Get.width / 1.5,
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
            width: Get.width / 1.7,
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

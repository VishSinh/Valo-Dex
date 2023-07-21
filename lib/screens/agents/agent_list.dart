import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valo_dex/controller/agent_controller.dart';
import 'package:valo_dex/utils/colors.dart';
import 'package:valo_dex/utils/widgets.dart';

class AgentList extends StatelessWidget {
  AgentList({super.key});
  final agentCtlr = Get.find<AgentController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ValoDexAppBar(),
      backgroundColor: redVariant1,
      body: SafeArea(
        child: ListView.builder(
          itemCount: agentCtlr.agentList.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () => Get.toNamed('/agent_details', arguments: {'agentData': agentCtlr.agentList[index]}),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: 150,
              decoration: BoxDecoration(
                color: greyVariant.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Image.network(
                    agentCtlr.agentList[index]['displayIconSmall'],
                    width: 100,
                    height: 100,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          agentCtlr.agentList[index]['displayName'].toString().toUpperCase(),
                          style: GoogleFonts.montserrat(),
                          textScaleFactor: 2.3,
                        ),
                        Text(
                          agentCtlr.agentList[index]['role']['displayName'],
                          style: GoogleFonts.raleway(),
                          textScaleFactor: 1.5,
                        ),
                      ],
                    ),
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:valo_dex/utils/colors.dart';

AppBar ValoDexAppBar({bool backButton = true}) {
  return AppBar(
    leading: backButton
        ? IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios),
            color: greyVariant,
          )
        : null,
    elevation: 0,
    backgroundColor: Colors.transparent,
    title: const Text(
      'VALO DEX',
      style: TextStyle(
        fontFamily: 'Valo',
        color: greyVariant,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.5,
      ),
      textScaleFactor: 1.7,
    ),
    centerTitle: true,
  );
}

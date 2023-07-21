import 'package:get/get.dart';
import 'package:valo_dex/services/request_service.dart';

class WeaponController extends GetxController {
  final RequestService requestService = RequestService();

  RxList weaponList = [].obs;

  Future<bool> getWeapons() async {
    final Map response = await requestService.getWeapons();
    if (response['success']) {
      weaponList.value = response['data'];
      weaponList.sort((a, b) => a['displayName'].compareTo(b['displayName']));
      return true;
    }
    return false;
  }
}

import 'package:get/get.dart';
import 'package:valo_dex/services/request_service.dart';

class AgentController extends GetxController {
  final RequestService requestService = RequestService();

  RxList agentList = [].obs;

  Future<bool> getAgents() async {
    final Map response = await requestService.getAgents();
    if (response['success']) {
      agentList.value = response['data'];
      agentList.sort((a, b) => a['displayName'].compareTo(b['displayName']));
      return true;
    }
    return false;
  }

  String shortenDescription(String description) {
    int dotIndex = -1;
    for (int i = 0; i < description.length; i++) {
      if (description[i] == '.' && description[i - 1] != description[i - 1].toUpperCase()) {
        dotIndex = i;
        break;
      }
    }
    return description.substring(0, dotIndex + 1);
  }
}

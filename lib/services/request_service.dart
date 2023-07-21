import 'dart:convert';

import 'package:http/http.dart' as http;

class RequestService {
  Future<dynamic> requestHelper(String apiEndPoint) async {
    final request = http.Request('GET', Uri.parse(apiEndPoint));

    final streamedResponse = await request.send();
    final statusCode = streamedResponse.statusCode;
    final responseBody = await streamedResponse.stream.bytesToString();

    if (statusCode < 200 || statusCode >= 400) {
      throw Exception('Error while fetching data');
    }
    print('+++++++++');
    print(responseBody);

    try {
      return jsonDecode(responseBody);
    } catch (e) {
      throw Exception('Error while decoding response data');
    }
  }

  Future<Map> getAgents() async {
    Map response = {"successs": false};
    try {
      final res = await requestHelper('https://valorant-api.com/v1/agents?isPlayableCharacter=true');
      response = {"success": true, "data": res['data']};
    } catch (e) {
      print(e.toString());
    }
    return response;
  }

  Future<Map> getWeapons() async {
    Map response = {"successs": false};
    try {
      final res = await requestHelper('https://valorant-api.com/v1/weapons');
      response = {"success": true, "data": res['data']};
    } catch (e) {
      print(e.toString());
    }
    return response;
  }
}

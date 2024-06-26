import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:hive/hive.dart';
import 'package:http/http.dart';
import 'package:store_offline_app/models/hive/user_hive_data_model.dart';
import 'package:store_offline_app/services/network_response.dart';

class NetworkCaller {
  static Future<NetworkResponse> getRequest({required String url}) async {
    try {
      Response response = await get(Uri.parse(url), headers: {'Content-Type': 'application/json'}).timeout(const Duration(seconds: 5));

      if (response.statusCode == 200) {

        var box = Hive.box<UserHiveDataModel>('userDataBox');
        box.clear();
        List<dynamic> data = jsonDecode(response.body);
        for (var item in data) {
          //print("===>$item<========");
          box.put(item['id'], UserHiveDataModel.fromJson(item));
        }

        return NetworkResponse(isSuccess: true, statusCode: response.statusCode, body: jsonDecode(response.body));
      } else {
        return NetworkResponse(isSuccess: false, statusCode: response.statusCode, body: null);
      }
    } on TimeoutException catch (e) {
      log('Request to $url timed out: ${e.message}');

      var box = Hive.box<UserHiveDataModel>('userDataBox');
      if (box.isNotEmpty) {
        List<UserHiveDataModel> data = box.values.toList();
        return NetworkResponse(isSuccess: true, statusCode: -3, body: data);
      }

      return NetworkResponse(isSuccess: false, statusCode: -2, body: null);
    } on SocketException catch (e) {
      log('SocketException: ${e.message}');

      var box = Hive.box<UserHiveDataModel>('userDataBox');
      if (box.isNotEmpty) {
        List<UserHiveDataModel> data = box.values.toList();
        return NetworkResponse(isSuccess: true, statusCode: -3, body: data);
      }

      return NetworkResponse(isSuccess: false, statusCode: -3, body: null);
    } catch (e) {
      log('Unexpected error: $e');
      return NetworkResponse(isSuccess: false, statusCode: -1, body: null);
    }
  }
}

// import 'dart:developer';
//
// import 'package:get/get.dart';
// import 'package:store_offline_app/models/user_data_model.dart';
// import 'package:store_offline_app/services/network_caller.dart';
// import 'package:store_offline_app/services/network_response.dart';
// import 'package:store_offline_app/utility/urls.dart';
//
// class FetchUserDataController extends GetxController {
//   bool _isUserLoading = false;
//   String _errorMessage = '';
//   List<UserDataModel> _userDataList = [];
//
//   bool get isUserLoading => _isUserLoading;
//   String get errorMessage => _errorMessage;
//   List<UserDataModel> get userDataList => _userDataList;
//
//   Future<bool> getUserData() async {
//     _isUserLoading = true;
//     update();
//
//     final NetworkResponse response = await NetworkCaller.getRequest(url: Urls.usersUrl);
//
//     log("UserData statusCode ==> ${response.statusCode}");
//     log("UserData body ==> ${response.body}");
//
//     _isUserLoading = false;
//
//     if (response.isSuccess) {
//       List<dynamic> data = response.body;
//       _userDataList = data.map((json) => UserDataModel.fromJson(json)).toList();
//       update();
//       return true;
//     } else {
//       _errorMessage = 'Failed to load data';
//       update();
//       return false;
//     }
//   }
// }
import 'package:get/get.dart';
import 'package:store_offline_app/models/hive/user_hive_data_model.dart';
import 'package:store_offline_app/models/user_data_model.dart';
import 'package:store_offline_app/services/network_caller.dart';
import 'package:store_offline_app/services/network_response.dart';
import 'package:store_offline_app/utility/urls.dart';
import 'dart:developer';

class FetchUserDataController extends GetxController {
  bool _isUserLoading = false;
  String _errorMessage = '';
  List<UserDataModel> _userDataList = [];

  bool get isUserLoading => _isUserLoading;
  String get errorMessage => _errorMessage;
  List<UserDataModel> get userDataList => _userDataList;

  Future<bool> getUserData() async {
    _isUserLoading = true;
    update();

    final NetworkResponse response =
    await NetworkCaller.getRequest(url: Urls.usersUrl);

    log("UserData statusCode ==> ${response.statusCode}");
    log("UserData body ==> ${response.body}");

    _isUserLoading = false;

    if (response.isSuccess) {
      if (response.statusCode == 200) {
        List<dynamic> data = response.body;
        _userDataList = data.map((json) => UserDataModel.fromJson(json)).toList();
      } else {
        List<UserHiveDataModel> data = response.body;
        _userDataList = data.map((hiveModel) => hiveModel.toUserDataModel()).toList();
      }
      update();
      return true;
    } else {
      _errorMessage = 'Failed to load data';
      update();
      return false;
    }
  }
  Future<bool> getNewUserData() async {
    _isUserLoading = true;
    update();

    final NetworkResponse response =
    await NetworkCaller.getRequest(url: Urls.moviesUrl);

    log("UserData statusCode ==> ${response.statusCode}");
    log("UserData body ==> ${response.body}");

    _isUserLoading = false;

    if (response.isSuccess) {
      if (response.statusCode == 200) {
        List<dynamic> data = response.body;
        _userDataList = data.map((json) => UserDataModel.fromJson(json)).toList();
      } else {
        List<UserHiveDataModel> data = response.body;
        _userDataList = data.map((hiveModel) => hiveModel.toUserDataModel()).toList();
      }
      update();
      return true;
    } else {
      _errorMessage = 'Failed to load data';
      update();
      return false;
    }
  }
}


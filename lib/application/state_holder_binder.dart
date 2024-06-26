import 'package:get/get.dart';
import 'package:store_offline_app/controllers/fetch_user_data_controller.dart';


class StateHolderBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(FetchUserDataController());

  }

}
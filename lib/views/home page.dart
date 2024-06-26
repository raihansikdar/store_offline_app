import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_offline_app/controllers/fetch_user_data_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<FetchUserDataController>().getUserData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: GetBuilder<FetchUserDataController>(
        builder: (_fetchUserDataController) {
          if (_fetchUserDataController.isUserLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (_fetchUserDataController.userDataList.isEmpty) {
            return const Center(child: Text("Empty"));
          }
          return RefreshIndicator(
            onRefresh: () async {
              await _fetchUserDataController.getUserData();
            },
            child: ListView.separated(
              itemCount: _fetchUserDataController.userDataList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_fetchUserDataController.userDataList[index].name ?? 'unknown'),
                );
              },
              separatorBuilder: (context, index) => const Divider(height: 5),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        await Get.find<FetchUserDataController>().getNewUserData();
      },child: Text("send"),),
    );
  }
}

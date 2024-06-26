import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:store_offline_app/application/app.dart';
import 'package:store_offline_app/models/hive/user_hive_data_model.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserHiveDataModelAdapter());
  await Hive.openBox<UserHiveDataModel>('userDataBox');

  runApp(const MyApp());
}



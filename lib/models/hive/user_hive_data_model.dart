// import 'package:hive/hive.dart';
//
// part 'user_hive_data_model.g.dart';
//
// @HiveType(typeId: 0)
// class UserHiveDataModel extends HiveObject {
//   @HiveField(0)
//   final int? id;
//
//   @HiveField(1)
//   final String? name;
//
//   UserHiveDataModel({this.id, this.name});
//
//   factory UserHiveDataModel.fromJson(Map<String, dynamic> json) {
//     return UserHiveDataModel(
//       id: json['id'] ,
//       name: json['name'] as String?,
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//     };
//   }
// }
import 'package:hive/hive.dart';
import 'package:store_offline_app/models/user_data_model.dart';

part 'user_hive_data_model.g.dart';

@HiveType(typeId: 0)
class UserHiveDataModel extends HiveObject {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final String? name;

  UserHiveDataModel({this.id, this.name});

  factory UserHiveDataModel.fromJson(Map<String, dynamic> json) {
    return UserHiveDataModel(
      id: json['id'],
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  UserDataModel toUserDataModel() {
    return UserDataModel(
      id: id,
      name: name,
    );
  }
}

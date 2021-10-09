import '../../domain/entity/user_data_entity.dart';

class UserDataModel extends UserDataEntity {
  UserDataModel({
    required String email,
    required String password,
  }) : super(email: email, password: password);
}

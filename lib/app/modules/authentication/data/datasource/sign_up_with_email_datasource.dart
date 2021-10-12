import '../model/user_model.dart';
import '../model/user_data_model.dart';
import '../../../../utils/mock_utils.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/httpClient/http_client.dart';

abstract class ISignUpWithEmailDataSource {
  Future<UserModel> signUp(
    UserDataModel userDataModel,
  );
}

class SignUpWithEmailDataSource implements ISignUpWithEmailDataSource {
  final IHttpClient httpClient;

  SignUpWithEmailDataSource({required this.httpClient});

  @override
  Future<UserModel> signUp(
    UserDataModel userDataModel,
  ) async {
    final mockFile = 'user_authenticated';
    final mockData = await MockUtils.getMock(mockFile);

    if (mockData != null) {
      return UserModel.fromJson(mockData);
    } else {
      throw ServerException(message: '');
    }
  }
}

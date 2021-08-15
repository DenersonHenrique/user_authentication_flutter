import 'package:user_authentication_flutter/app/modules/authentication/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required String kind,
    required String localId,
    required String email,
    required String displayName,
    required String idToken,
    required bool registered,
    required String refreshToken,
    required String expiresIn,
  }) : super(
          kind: kind,
          localId: localId,
          email: email,
          displayName: displayName,
          idToken: idToken,
          registered: registered,
          refreshToken: refreshToken,
          expiresIn: expiresIn,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        kind: json['kind'],
        localId: json['localId'],
        email: json['email'],
        displayName: json['displayName'],
        idToken: json['idToken'],
        registered: json['registered'],
        refreshToken: json['refreshToken'],
        expiresIn: json['expiresIn'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kind'] = this.kind;
    data['localId'] = this.localId;
    data['email'] = this.email;
    data['displayName'] = this.displayName;
    data['idToken'] = this.idToken;
    data['registered'] = this.registered;
    data['refreshToken'] = this.refreshToken;
    data['expiresIn'] = this.expiresIn;
    return data;
  }
}

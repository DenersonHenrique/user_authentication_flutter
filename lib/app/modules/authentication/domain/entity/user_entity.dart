class UserEntity {
  String kind;
  String localId;
  String email;
  String displayName;
  String idToken;
  bool registered;
  String refreshToken;
  String expiresIn;

  UserEntity({
    required this.kind,
    required this.localId,
    required this.email,
    required this.displayName,
    required this.idToken,
    required this.registered,
    required this.refreshToken,
    required this.expiresIn,
  });
}

// {
//   "kind": "identitytoolkit#VerifyPasswordResponse",
//   "localId": "iBQL7KwhqAManreGD4m7nsBrEZ82",
//   "email": "denersonh@gmail.com",
//   "displayName": "",
//   "idToken": "",
//   "registered": true,
//   "refreshToken": "",
//   "expiresIn": "3600"
// }

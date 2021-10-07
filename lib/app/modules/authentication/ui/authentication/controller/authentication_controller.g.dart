// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthenticationController on _AuthenticationControllerBase, Store {
  final _$_userEntityAtom =
      Atom(name: '_AuthenticationControllerBase._userEntity');

  @override
  UserEntity? get _userEntity {
    _$_userEntityAtom.reportRead();
    return super._userEntity;
  }

  @override
  set _userEntity(UserEntity? value) {
    _$_userEntityAtom.reportWrite(value, super._userEntity, () {
      super._userEntity = value;
    });
  }

  final _$_userDataEntityAtom =
      Atom(name: '_AuthenticationControllerBase._userDataEntity');

  @override
  UserDataEntity get _userDataEntity {
    _$_userDataEntityAtom.reportRead();
    return super._userDataEntity;
  }

  @override
  set _userDataEntity(UserDataEntity value) {
    _$_userDataEntityAtom.reportWrite(value, super._userDataEntity, () {
      super._userDataEntity = value;
    });
  }

  final _$authenticateUserAsyncAction =
      AsyncAction('_AuthenticationControllerBase.authenticateUser');

  @override
  Future<void> authenticateUser() {
    return _$authenticateUserAsyncAction.run(() => super.authenticateUser());
  }

  final _$signUpUserAsyncAction =
      AsyncAction('_AuthenticationControllerBase.signUpUser');

  @override
  Future<void> signUpUser() {
    return _$signUpUserAsyncAction.run(() => super.signUpUser());
  }

  final _$_AuthenticationControllerBaseActionController =
      ActionController(name: '_AuthenticationControllerBase');

  @override
  void setEmail(String? value) {
    final _$actionInfo = _$_AuthenticationControllerBaseActionController
        .startAction(name: '_AuthenticationControllerBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_AuthenticationControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String? value) {
    final _$actionInfo = _$_AuthenticationControllerBaseActionController
        .startAction(name: '_AuthenticationControllerBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_AuthenticationControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}

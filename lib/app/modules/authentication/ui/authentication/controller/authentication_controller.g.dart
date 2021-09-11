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

  final _$authenticateUserAsyncAction =
      AsyncAction('_AuthenticationControllerBase.authenticateUser');

  @override
  Future authenticateUser() {
    return _$authenticateUserAsyncAction.run(() => super.authenticateUser());
  }

  @override
  String toString() {
    return '''

    ''';
  }
}

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nutm_food_app/features/auth/model/user.dart';

class SecureStorage {
  static SecureStorage? _instance;

  factory SecureStorage() =>
      _instance ??= SecureStorage._(const FlutterSecureStorage());

  SecureStorage._(this._storage);

  final FlutterSecureStorage _storage;
  static const _tokenKey = 'TOKEN';
  static const _emailKey = 'EMAIL';
  static const _nameKey = 'NAME';

  Future<void> persistUser(String email, String token, String name) async {
    await _storage.write(key: _emailKey, value: email);
    await _storage.write(key: _tokenKey, value: token);
    await _storage.write(key: _nameKey, value: name);
  }



  Future<bool> hasToken() async {
    var value = await _storage.read(key: _tokenKey);
    return value != null;
  }

  Future<bool> hasEmail() async {
    var value = await _storage.read(key: _emailKey);
    return value != null;
  }

  Future<bool> hasName() async {
    var value = await _storage.read(key: _nameKey);
    return value != null;
  }

  Future<void> deleteToken() async {
    return _storage.delete(key: _tokenKey);
  }

  Future<void> deleteEmail() async {
    return _storage.delete(key: _emailKey);
  }

  Future<void> deleteName() async {
    return _storage.delete(key: _nameKey);
  }

  Future<String?> getEmail() async {
    return _storage.read(key: _emailKey);
  }

  Future<String?> getToken() async {
    return _storage.read(key: _tokenKey);
  }

  Future<String?> getName() async {
    return _storage.read(key: _nameKey);
  }

  Future<void> deleteAll() async {
    return _storage.deleteAll();
  }
}

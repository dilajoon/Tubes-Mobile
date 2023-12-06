import 'package:collection/collection.dart';
import 'package:wisata_app/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final List<UserModel> _users = [];

  AuthService() {
    _users.add(UserModel(
      email: 'user1@gmail.com',
      password: 'password',
      name: 'User',
      nohp: '1234567890',
    ));

    
  }

  Future<UserModel?> login(String email, String password) async {
  try {
    UserModel? preRegisteredUser = _users.firstWhereOrNull(
      (user) => user.email == email && user.password == password,
    );

    if (preRegisteredUser != null) {
      return preRegisteredUser;
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedEmail = prefs.getString('email');
    String? storedPassword = prefs.getString('password');
    String? storedName = prefs.getString('name');
    String? storedNohp = prefs.getString('nohp');

    if (storedEmail == email && storedPassword == password) {
      UserModel newUser = UserModel(
        email: storedEmail!,
        password: storedPassword!,
        name: storedName ?? '',
        nohp: storedNohp ?? '',
      );
      return newUser;
    } else {
      return null;
    }
 } catch (e) {
    print('Login failed: $e');
    return null;
 }
}


  Future<Map<String, dynamic>> register(
    String email,
    String password,
    String confirmPassword,
    String name,
    String nohp,
  ) async {
    try {
      if (password != confirmPassword) {
        return {'success': false, 'message': 'Passwords tidak sama'};
      }

      if (_users.any((user) => user.email == email)) {
        return {'success': false, 'message': 'Email sudah digunakan'};
      }

      UserModel newUser =
          UserModel(email: email, password: password, name: name, nohp: nohp);

      _users.add(newUser);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('email', email);
      prefs.setString('password', password);
      prefs.setString('name', name);
      prefs.setString('nohp', nohp);

      return {'success': true, 'message': 'Register berhasil'};
    } catch (e) {
      return {'success': false, 'message': 'Register gagal: $e'};
    }
  }
}

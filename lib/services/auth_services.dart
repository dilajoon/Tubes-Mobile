import 'package:collection/collection.dart';
import 'package:wisata_app/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final List<UserModel> _users = [];

  AuthService() {
    // Initialize _users list with some sample data
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
      return preRegisteredUser; // Pre-registered user found
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
      return newUser; // User found in added users during registration
    } else {
      return null; // User not found or credentials don't match
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
        return {'success': false, 'message': 'Passwords do not match'};
      }

      if (_users.any((user) => user.email == email)) {
        return {'success': false, 'message': 'Email is already registered'};
      }

      UserModel newUser =
          UserModel(email: email, password: password, name: name, nohp: nohp);

      _users.add(newUser);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('email', email);
      prefs.setString('password', password);
      prefs.setString('name', name);
      prefs.setString('nohp', nohp);

      return {'success': true, 'message': 'Registration successful'};
    } catch (e) {
      return {'success': false, 'message': 'Registration failed: $e'};
    }
  }
}

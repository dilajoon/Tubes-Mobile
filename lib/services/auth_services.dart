import 'package:wisata_app/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final List<UserModel> _users = [];

  Future<UserModel?> login(String email, String password) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      //Mengambil data user
      String? storedEmail = prefs.getString('email');
      String? storedPassword = prefs.getString('password');
      String? storedName = prefs.getString('name');
      String? storedNohp = prefs.getString('nohp');

      // Mengecek apakah data sama
      if (storedEmail == email && storedPassword == password) {
        UserModel storedUser = UserModel(
          email: storedEmail!,
          password: storedPassword!,
          name: storedName ?? '',
          nohp: storedNohp ?? '',
        );
        return storedUser;
      } else {
        return null; // User tidak ada atau tidak sama
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

import 'package:wisata_app/screen/login_sucess.dart';
import 'package:wisata_app/screen/sign_up.dart';
import 'package:wisata_app/constans.dart';
import 'package:flutter/material.dart';
import 'package:wisata_app/helper/keyboard.dart';
import 'package:wisata_app/helper/session_manager.dart';
import 'package:wisata_app/services/auth_services.dart';
import 'package:wisata_app/widgets/social_media_card.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

Future<void> checkIsLogin(BuildContext context) async {
  await SessionManager().isLogin(context);
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool? remember = false;
  String _error = '';
  final List<String?> errors = [];
  final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  void initState() {
    super.initState();
    checkIsLogin(context);
  }

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  Future<void> _login() async {
    try {
      final user = await AuthService().login(email!, password!);

      if (user != null && user.email.isNotEmpty) {
        setState(() {
          _error = '';
        });

        final prefs = await SessionManager.getInstance();
        await prefs.saveUserData(user.email);

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => LoginSuccessScreen(
              text: 'Login',
              press: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                  (route) => false,
                );
              },
            ),
          ),
          (route) => false,
        );
      } else {
        setState(() {
          _error = 'Email atau Password Salah';
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Login gagal';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 197, 193, 193),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome",
                style: textTextStyle.copyWith(fontSize: 30, fontWeight: bold),
              ),
              SizedBox(height: 21),
              Text(
                "Rencanakan liburan terbesarmu di Big Holidey, ada banyak tempat wisata dan kamar hotel yang tersedia",
                style: secondaryTextStyle.copyWith(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 44,
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Email",
                      style: textTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    buildEmailFormField(),
                    SizedBox(height: 15),
                    Text(
                      "Password",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    buildPasswordFormField(),
                    SizedBox(height: 15),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: buttonColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      SizedBox(width: 15),
                      Text("Remember me",
                          style: greyTextStyle.copyWith(fontSize: 12)),
                    ],
                  ),
                  Text("Forget Password ?",
                      style: textTextStyle.copyWith(fontSize: 12)),
                ],
              ),
              SizedBox(
                height: 22,
              ),
              Container(
                width: double.infinity,
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryButtonColor,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      KeyboardUtil.hideKeyboard(context);
                      _login();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                              Text("Invalid input. Please check your entries."),
                        ),
                      );
                    }
                  },
                  child: Text("LOGIN",
                      style: whiteTextStyle.copyWith(fontWeight: bold)),
                ),
              ),
              // Container(
              //   width: 200,
              //   height: 40,
              //   margin: EdgeInsets.symmetric(horizontal: 5, vertical: 25),
              //   child: SingleChildScrollView(
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         SocialMediaCard(
              //           icon: "assets/icons/google-icon.svg",
              //           press: () {},
              //         ),
              //         SocialMediaCard(
              //           icon: "assets/icons/facebook-2.svg",
              //           press: () {},
              //         ),
              //         SocialMediaCard(
              //           icon: "assets/icons/twitter.svg",
              //           press: () {},
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("You don't have an account yet?",
                      style: secondaryTextStyle.copyWith(fontSize: 12)),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUp()));
                    },
                    child: const Text("Sign Up"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}

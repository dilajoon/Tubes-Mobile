import 'package:flutter/material.dart';
import 'package:wisata_app/constans.dart';
import 'package:wisata_app/services/auth_services.dart';
import 'package:wisata_app/screen/login.dart';
import 'package:wisata_app/widgets/custom_snackbar.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController nohpController = TextEditingController();
  bool isVisible = false;
  String _error = '';

  Future<void> _register() async {
    try {
      if (_formKey.currentState!.validate()) {
        final result = await AuthService().register(
          emailController.text,
          passwordController.text,
          confirmPasswordController.text,
          nameController.text,
          nohpController.text,
        );

        print("result $result");

        if (result['success']) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
            (route) => false,
          );
        } else {
          setState(() {
            _error = result['message'];
          });
        }
      }
    } catch (e) {
      setState(() {
        _error = 'Registration Failed';
      });
    }

    if (_error.isNotEmpty) {
      CustomSnackbar.show(
        ScaffoldMessenger.of(context),
        _error,
        SnackbarType.error,
      );
      setState(() {
        _error = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 197, 193, 193),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Register New Account",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 9),
              SizedBox(
                height: 15,
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Nama Lengkap",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        controller: nameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Nama Lengkap is required';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.black.withOpacity(0.6),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 17,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Nomor Telepon",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: whiteColor,
                      ),
                      child: TextFormField(
                        controller: nohpController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            fontSize: 12,
                            color: textColor.withOpacity(0.6),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 17,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Email",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: whiteColor,
                      ),
                      child: TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email is required';
                          } else if (!RegExp(
                                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                              .hasMatch(value)) {
                            return 'Invalid email address';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            fontSize: 12,
                            color: textColor.withOpacity(0.6),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 17,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Password",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: !isVisible,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password is required';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 17,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                isVisible = !isVisible;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Confirm Password",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        controller: confirmPasswordController,
                        obscureText: !isVisible,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Confirm Password is required';
                          } else if (value != passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 17,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                isVisible = !isVisible;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: primaryButtonColor,
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
                        child: Text(
                          "Back",
                          style: whiteTextStyle.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: primaryButtonColor,
                        ),
                        onPressed: _register,
                        child: Text(
                          "Register",
                          style: whiteTextStyle.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

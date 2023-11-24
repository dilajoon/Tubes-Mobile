import 'package:wisata_app/Register/login_sucess.dart';
import 'package:wisata_app/Register/sign_up.dart';
import 'package:wisata_app/constans.dart';
import 'package:flutter/material.dart';
import 'package:wisata_app/helper/keyboard.dart';
import 'package:wisata_app/helper/session_manager.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

// Future<void> checkIsLogin(BuildContext context) async {
//   await SessionManager().isLogin(context);
// }

class _LoginPageState extends State<LoginPage> {
  final TextEditingController passwordController = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  bool isVisible = false;
  bool isLoginTrue = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>(); // Define a form key 
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
              SizedBox(height: 11),
              Text(
                "Rencanakan liburan terbesarmu di Big Holidey, ada banyak tempat wisata dan kamar hotel yang tersedia",
                style: secondaryTextStyle.copyWith(fontSize: 12),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 64,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Email",
                    style: textTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: whiteColor,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                        hintStyle:
                            textTextStyle.copyWith(fontSize: 12, color: textColor.withOpacity(0.6)),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 17),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Password",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
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
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 17),
                        suffixIcon: IconButton(
                          icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off),
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
              SizedBox(height: 20,),
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
                      Text("Remember me", style: greyTextStyle.copyWith(fontSize: 12)),
                    ],
                  ),
                  Text("Forget Password ?", style: textTextStyle.copyWith(fontSize: 12)),
                ],
              ),
              SizedBox(height: 32,),
              Container(
                width: double.infinity,
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: primaryButtonColor,
                  ),
                  onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  KeyboardUtil.hideKeyboard(context);
                  LoginSuccessScreen();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Invalid input. Please check your entries."),
                    ),
                  );
                }
              },
              child: Text("LOGIN", style: whiteTextStyle.copyWith(fontWeight: bold)),
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 19),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: buttonColor,
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network("https://www.flaticon.com/free-icon/google_2702602", height: 20),
                      SizedBox(width: 12),
                      Text("Sign in with Google", style: textTextStyle.copyWith(fontWeight: bold)),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("You don't have an account yet?", style: secondaryTextStyle.copyWith(fontSize: 12)),
                  TextButton(
                    onPressed: () {
                      // Navigate to sign up
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUp()));
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
}

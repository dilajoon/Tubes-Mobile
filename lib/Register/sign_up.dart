import 'package:wisata_app/Register/login.dart';
import 'package:wisata_app/constans.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool isVisible = false;

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
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 9),
              SizedBox(
                height: 15,
              ),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Nama Lengkap",
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
                        controller: emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.6)),
                          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 17),
                        ),
                      ),
                    ),
              Text(
              "Nomor Telepon", 
              style: textTextStyle.copyWith(
                fontSize: 12, fontWeight: bold,
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
                    hintStyle: textTextStyle.copyWith(fontSize: 12, color: textColor.withOpacity(0.6)),

                    contentPadding:  EdgeInsets.symmetric(horizontal: 16, vertical: 17)
                  ),
                ),
              ),
              Text(
              "Email", 
              style: textTextStyle.copyWith(
                fontSize: 12, fontWeight: bold,
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
                    hintStyle: textTextStyle.copyWith(fontSize: 12, color: textColor.withOpacity(0.6)),

                    contentPadding:  EdgeInsets.symmetric(horizontal: 16, vertical: 17)
                  ),
                ),
              ),
                      SizedBox(height: 10),
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
                    SizedBox(height: 10),
                    Text(
                      "Confirm Password",
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
                        controller: confirmPasswordController,
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
                        validator: (value) {
                          if (value != passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              SizedBox(height: 20,),
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
                        onPressed: (){
                          Navigator.pushReplacement(
                         context,
                          MaterialPageRoute(builder: (context) => const LoginPage()),
                          );
                        }, 
                        child: Text("Back", style: whiteTextStyle.copyWith(fontWeight: FontWeight.bold,),),
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
                        onPressed: () {
                            if (formKey.currentState!.validate()) {

                            }else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                content: Text("You don't have an account"),
                                ),
                              );
                           }
                          },
                        
                        child: Text("Register", style: whiteTextStyle.copyWith(fontWeight: FontWeight.bold),),
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

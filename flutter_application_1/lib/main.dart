import 'package:flutter/material.dart';
import 'package:flutter_application_1/constans.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome", style: textTextStyle.copyWith(fontSize: 30, fontWeight: bold),),
              SizedBox(height: 11),
              Text("Lupakan pekerjaan mu, mari rencanakan liburan besar di Big Holiday", style: secondaryTextStyle.copyWith(fontSize: 12),
              textAlign: TextAlign.center,
              ),
              SizedBox(height: 64,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Email",
                   style: textTextStyle.copyWith(
                    fontSize: 12, 
                    fontWeight: bold
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
                          hintText: "your email",
                          hintStyle: textTextStyle.copyWith(fontSize: 12, color: textColor.withOpacity(0.6)),
                          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 17)
                         ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text("Password",
                   style: textTextStyle.copyWith(
                    fontSize: 12, 
                    fontWeight: bold
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
                          hintText: "your password",
                          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 17),
                          suffixIcon: Icon(Icons.visibility_off)
                         ),
                      ),
                    )
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
                    Text("Remember me", style: greyTextStyle.copyWith(fontSize: 12),)
                      ],
                    ),
                    Text("Forget Password?", style: textTextStyle.copyWith(fontSize: 12),)
                    
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
                onPressed: (){}, 
                child: Text("LOGIN", style: whiteTextStyle.copyWith(fontWeight: bold),),
                ),
                ),
                   Container(
                  width: double.infinity,
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 19),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary:buttonColor,
                    ),
                onPressed: (){}, 
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network("https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png", height: 20,),
                    SizedBox(width: 12,),
                    Text("Sign in with Google", style: textTextStyle.copyWith(fontWeight: bold),),
                  ],
                ),
                ),
                ),
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text("You don't have an account yet?", style: secondaryTextStyle.copyWith(fontSize: 12 ),),
                Text("Sign up", style: tncTextStyle.copyWith(fontSize: 12),), 
                ],
                ),
                
            ],
          ),
        ),
      ),
    );
  }
}
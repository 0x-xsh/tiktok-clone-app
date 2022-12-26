import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/views/screens/Widgets/text_input.dart';
import 'package:untitled/views/screens/auth/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Tiktok ',
                style: TextStyle(
                  fontSize: 35,
                  color: buttonColor,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 25),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: CustomInputField(
                  controller: _emailController,
                  labeltext: 'email',
                  icon: Icons.email,
                ),
              ),
              SizedBox(height: 25),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: CustomInputField(
                  isObscure: true,
                  controller: _passwordController,
                  labeltext: 'password',
                  icon: Icons.lock,
                ),
              ),
              SizedBox(height: 30),
              Container(
                width: MediaQuery.of(context).size.width - 40,
                height: 50,
                decoration: BoxDecoration(
                    color: buttonColor, borderRadius: BorderRadius.circular(5)),
                child: InkWell(
                  onTap: () => authcontroller.login(
                      _emailController.text, _passwordController.text),
                  child: Center(
                    child: Text(
                      "Login",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("dont have an account?"),
                  InkWell(
                      child: Text(
                        " Register",
                        style: TextStyle(color: buttonColor, fontSize: 17),
                      ),
                      onTap: () => Get.to(() => SignUpScreen()))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

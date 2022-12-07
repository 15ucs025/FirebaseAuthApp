import 'package:firebase_auth_login/Screens/homeView.dart';
import 'package:firebase_auth_login/Screens/signup.dart';
import 'package:firebase_auth_login/custom_widget/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SigninView extends StatefulWidget {
  const SigninView({super.key});

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  var emailController = TextEditingController(text: "email");
  var passController = TextEditingController(text: "password");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign in"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: reusableTextField(
                text: "Email",
                controller: emailController,
                icon: Icons.person_outline,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: reusableTextField(
                text: "Password",
                controller: passController,
                icon: Icons.lock_outlined,
                isPasswordType: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: reusableElevatedButton(
                context: context,
                title: "Sign in",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyHomePage(
                              title: "Login with Firebase Auth")));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextButton(
                child: const Text("Create a new account!"),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const SignupView(title: "Register")));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

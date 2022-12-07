import 'package:firebase_auth_login/Screens/homeView.dart';
import 'package:firebase_auth_login/custom_widget/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key, required this.title});

  final String title;

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  var nameController = TextEditingController(text: "name");
  var emailController = TextEditingController(text: "email");
  var passController = TextEditingController(text: "password");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: reusableTextField(
                text: "Name",
                controller: nameController,
                icon: Icons.person_outline,
              ),
            ),
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
                title: "Sign up",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyHomePage(
                              title: "Login with Firebase Auth")));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

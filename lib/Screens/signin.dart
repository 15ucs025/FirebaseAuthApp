import 'package:firebase_auth/firebase_auth.dart';
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
  final _formKey = GlobalKey<FormState>();
  var emailController = TextEditingController(text: "email");
  var passController = TextEditingController(text: "password");
  late bool bRegistrationSuccess;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign in"),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              reusableTextField(
                text: "Email",
                controller: emailController,
                icon: Icons.person_outline,
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email can not be empty";
                  }
                  return null;
                },
              ),
              reusableTextField(
                text: "Password",
                controller: passController,
                icon: Icons.lock_outlined,
                isPasswordType: true,
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email can not be empty";
                  }
                  if (value.length < 8) {
                    return "Password must contain atleast 8 characters";
                  }
                  return null;
                },
              ),
              reusableElevatedButton(
                context: context,
                title: "Sign in",
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const MyHomePage(
                  //             title: "Login with Firebase Auth")));
                  if (_formKey.currentState!.validate()) return;
                  bRegistrationSuccess = false;
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: emailController.text,
                          password: passController.text)
                      .then((value) {
                    bRegistrationSuccess = true;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyHomePage(
                                title: "Login with Firebase")));
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
                },
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
      ),
    );
  }
}

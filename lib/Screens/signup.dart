import 'package:firebase_auth/firebase_auth.dart';
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
  final _formKey = GlobalKey<FormState>();
  var nameController = TextEditingController(text: "name");
  var emailController = TextEditingController(text: "email");
  var passController = TextEditingController(text: "password");
  late bool bRegistrationSuccess;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              reusableTextField(
                text: "Name",
                controller: nameController,
                icon: Icons.person_outline,
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return "Name can not be empty";
                  }
                  return null;
                },
              ),
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
              Padding(
                padding: const EdgeInsets.all(20),
                child: reusableTextField(
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
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: reusableElevatedButton(
                  context: context,
                  title: "Sign up",
                  onTap: () {
                    if (_formKey.currentState!.validate()) return;
                    bRegistrationSuccess = false;
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const MyHomePage(
                    //             title: "Login with Firebase Auth")));
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: emailController.text,
                            password: passController.text)
                        .then((value) {
                      bRegistrationSuccess = true;
                      print("Created New Account");
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => MyHomePage("L")));
                    }).onError((error, stackTrace) {
                      print("Error ${error.toString()}");
                    });
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

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_login/Screens/homeView.dart';
import 'package:firebase_auth_login/Screens/signup.dart';
import 'package:firebase_auth_login/custom_widget/reusable_widget.dart';
import 'package:flutter/material.dart';

class SigninView extends StatefulWidget {
  const SigninView({super.key});

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  final _formKey = GlobalKey<FormState>();
  var emailController = TextEditingController(text: "email");
  var passController = TextEditingController(text: "password");
  bool bLoding = false;

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
                view: (bLoding)
                    ? const CircularProgressIndicator()
                    : const Text("Sign in"),
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const MyHomePage(
                  //             title: "Login with Firebase Auth")));
                  if (_formKey.currentState!.validate()) return;
                  bLoding = true;
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: emailController.text,
                          password: passController.text)
                      .then((value) {
                    bLoding = false;

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyHomePage(
                                title: "Login with Firebase")));
                  }).onError((error, stackTrace) {
                    bLoding = false;
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Error while logging in'),
                      duration: Duration(seconds: 3),
                    ));
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

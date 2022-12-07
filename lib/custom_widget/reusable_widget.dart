import 'package:flutter/material.dart';

Padding reusableTextField(
    {required String text,
    required IconData icon,
    required TextEditingController controller,
    String? Function(String?)? validation,
    bool isPasswordType = false}) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: TextFormField(
      controller: controller,
      obscureText: isPasswordType,
      enableSuggestions: !isPasswordType,
      autocorrect: !isPasswordType,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
        ),
        labelText: text,
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
      ),
      keyboardType: isPasswordType
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
      validator: validation,
    ),
  );
}

Container reusableElevatedButton(
    {required BuildContext context,
    required Widget? view,
    required Function onTap}) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
        onPressed: () {
          onTap();
        },
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)))),
        child: view),
  );
}

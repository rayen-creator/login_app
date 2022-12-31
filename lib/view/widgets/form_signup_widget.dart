import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/user_model.dart';
import '../../routes/routes_names.dart';
import '../../view_model/auth_view_model.dart';

Widget form_signup_widget(
    {required BuildContext context,
    required GlobalKey<FormState> FormKey,
    required TextEditingController emailcontroller,
    required TextEditingController passwordcontroller,
    required TextEditingController confirmpasswordcontroller,
    required void Function()? onpressed,
    required bool passwordVisible}) {
  return Form(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    key: FormKey,
    child: Column(
      children: [
        Row(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  label: Text('Email'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                ),
                controller: emailcontroller,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "email is required";
                  } else if (!EmailValidator.validate(value)) {
                    return "incorrect email address";
                  }
                },
              ),
            ))
          ],
        ),
        Row(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  label: const Text('Password'),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  suffixIcon: passwordcontroller.text.isNotEmpty
                      ? IconButton(
                          icon: Icon(
                            passwordVisible ? Icons.visibility : Icons.visibility_off,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          onPressed: onpressed)
                      : null,
                ),
                controller: passwordcontroller,
                obscureText: passwordVisible,
                // validator: (value) {
                //   if (value!.isEmpty) {
                //     return "password required";
                //   } else {
                //     if (value.length < 8) {
                //       return "password must be at least 8 characters";
                //     }
                //     if ((!value.contains(RegExp('[a-z]'))) ||
                //         (!value.contains(RegExp('[1-9]')))) {
                //       return "password must contain both alphabet and digit";
                //     }
                //   }
                // },
              ),
            ))
          ],
        ),
        Row(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  label: Text('Confirm Password'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                ),
                controller: confirmpasswordcontroller,
                obscureText: true,
                validator: ((value) {
                  if (passwordcontroller.text != value) {
                    return "password missmatch , try again";
                  }
                }),
              ),
            ))
          ],
        ),
        Row(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                child: const Text("Sign up"),
                onPressed: () {
                  if (FormKey.currentState!.validate()) {
                    //provider
                    context.read<AuthViewModel>().signUpapi(
                        UserModel(
                          email: emailcontroller.text.toString(),
                          password: passwordcontroller.text.toString(),
                        ).toJson(),
                        context);
                    print("okay registration complete");
                  } else {
                    print("okay registration incomplete");
                  }
                },
              ),
            ))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.login);
                  },
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(text: "Already have an account ? "),
                        TextSpan(text: "Sign in ", style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  )),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        )
      ],
    ),
  );
}

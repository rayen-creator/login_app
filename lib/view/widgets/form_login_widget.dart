import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:provider/provider.dart';
import '../../model/user_model.dart';
import '../../routes/routes_names.dart';
import '../../view_model/auth_view_model.dart';

// ignore: non_constant_identifier_names
Widget form_widget_login(
    {required BuildContext context,
    required GlobalKey<FormState> FormKey,
    required TextEditingController emailcontroller,
    required TextEditingController passwordcontroller,
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
                    return 'Email is required';
                  }
                  return null;
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
                          onPressed: onpressed,
                        )
                      : null,
                ),
                controller: passwordcontroller,
                obscureText: passwordVisible,
              ),
            ))
          ],
        ),
        Row(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 11.0),
              child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/forgetpwd');
                  },
                  child: const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forget Password ?",
                        style: TextStyle(color: Colors.grey, fontSize: 13, fontWeight: FontWeight.bold),
                      ))),
            ))
          ],
        ),
        Row(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                child: const Text("Sign in"),
                onPressed: () {
                  if (FormKey.currentState!.validate()) {
                    context.read<AuthViewModel>().loginApi(
                        UserModel(
                          email: emailcontroller.text,
                          password: passwordcontroller.text,
                        ).toJson(),
                        context);
                    if (kDebugMode) {
                      print("validate");
                      print("email:${emailcontroller.text} password:${passwordcontroller.text}");
                    }
                  } else {
                    print('no validate');
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
                    Navigator.pushNamed(context, RoutesName.signUp);
                  },
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(text: "Don't have account ? "),
                        TextSpan(text: "Sign up", style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  )),
            ),
          ],
        ),
        Row(children: const [
          Expanded(
              child: Divider(
            indent: 20,
            endIndent: 10,
            thickness: 1,
            color: Colors.grey,
          )),
          Text("OR"),
          Expanded(
              child: Divider(
            indent: 10,
            endIndent: 20,
            thickness: 1,
            color: Colors.grey,
          )),
        ]),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                height: 80,
                child: FlutterSocialButton(
                  onTap: () {},
                  buttonType: ButtonType.facebook,
                  mini: true,
                )),
            SizedBox(
                height: 80,
                child: FlutterSocialButton(
                  onTap: () {},
                  buttonType: ButtonType.google,
                  mini: true,
                )),
            SizedBox(
                height: 80,
                child: FlutterSocialButton(
                  onTap: () {},
                  buttonType: ButtonType.apple,
                  mini: true,
                )),
            SizedBox(
                height: 80,
                child: FlutterSocialButton(
                  onTap: () {},
                  buttonType: ButtonType.phone,
                  mini: true,
                ))
          ],
        ),
        const SizedBox(
          height: 10,
        )
      ],
    ),
  );
}

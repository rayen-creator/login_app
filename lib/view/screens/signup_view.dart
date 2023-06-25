import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:email_validator/email_validator.dart';
import 'package:mvvm_app/routes/routes_names.dart';
import 'package:mvvm_app/view/widgets/form_signup_widget.dart';
import 'package:mvvm_app/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

import '../../model/user_model.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _FormKey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  bool _passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: GestureDetector(
            onTap: () => {FocusManager.instance.primaryFocus?.unfocus(), setState(() {})},
            child: Scaffold(
                resizeToAvoidBottomInset: false,
                body: Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(color: Colors.blueAccent),
                    ),
                    Positioned(
                      top: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: AppBar(
                        automaticallyImplyLeading: false,
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        leading: InkWell(
                          child: const Icon(
                            Icons.arrow_back_ios_outlined,
                            color: Colors.white,
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Card(
                              color: Colors.white.withOpacity(0.9),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              elevation: 0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 20, bottom: 10, top: 20, right: 0),
                                    child: Text("Create an account",
                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 20, bottom: 5, top: 0, right: 0),
                                    child: Text("We'll be waiting ",
                                        style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
                                  ),
                                  form_signup_widget(
                                      context: context,
                                      FormKey: _FormKey,
                                      confirmpasswordcontroller: confirmpasswordcontroller,
                                      emailcontroller: emailcontroller,
                                      passwordVisible: _passwordVisible,
                                      passwordcontroller: passwordcontroller,
                                      onpressed: () {
                                        setState(() {
                                          _passwordVisible = !_passwordVisible;
                                        });
                                      })
                                ],
                              )),
                        ),
                      ],
                    )
                  ],
                ))));
  }
}

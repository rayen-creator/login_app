import 'package:flutter/material.dart';
import 'package:mvvm_app/view/widgets/form_login_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _FormKey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    passwordcontroller.clear();
  }

  @override
  void dispose() {
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
              body: Stack(children: [
                Container(
                  decoration: BoxDecoration(color: Colors.blueAccent),
                ),
                Positioned(
                  top: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: AppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
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
                                child: Text("Welcome Back",
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black)),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 20, bottom: 5, top: 0, right: 0),
                                child: Text("Sign in to start ",
                                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15, color: Colors.black)),
                              ),
                              form_widget_login(
                                  FormKey: _FormKey,
                                  passwordVisible: _passwordVisible,
                                  context: context,
                                  emailcontroller: emailcontroller,
                                  onpressed: () {
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                  passwordcontroller: passwordcontroller)
                            ],
                          )),
                    ),
                  ],
                ),
              ]),
            )));
  }
}

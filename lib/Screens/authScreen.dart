import 'package:amazon_clone/Global%20variables%20/globalvariables.dart';
import 'package:amazon_clone/Widgets/appbutton.dart';
import 'package:amazon_clone/Widgets/input-textfield.dart';
import 'package:amazon_clone/services/authServices.dart';
import 'package:flutter/material.dart';

enum Auth { signIn, signUp }

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signUp;

  final signinKey = GlobalKey<FormState>();
  final signUpKey = GlobalKey<FormState>();

  final TextEditingController nameCon = TextEditingController();
  final TextEditingController emailCon = TextEditingController();
  final TextEditingController passwordCon = TextEditingController();
  final AuthServices authServices = AuthServices();

  void signUpUser() {
    authServices.signUp(
        name: nameCon.text,
        email: emailCon.text,
        password: passwordCon.text,
        context: context);
  }

  void signIn() async {
    authServices.signIn(
        context: context, email: emailCon.text, password: passwordCon.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            ListTile(
              tileColor: _auth == Auth.signUp
                  ? GlobalVariables.backgroundColor
                  : GlobalVariables.greyBackgroundCOlor,
              title: const Text(
                'Create Account',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Radio(
                activeColor: GlobalVariables.secondaryColor,
                groupValue: _auth,
                value: Auth.signUp,
                onChanged: (Auth? val) {
                  setState(() {
                    _auth = val!;
                  });
                },
              ),
            ),
            if (_auth == Auth.signUp)
              Container(
                padding: const EdgeInsets.all(8),
                decoration:
                    const BoxDecoration(color: GlobalVariables.backgroundColor),
                child: Form(
                    key: signUpKey,
                    child: Column(
                      children: [
                        InputTextField(
                          obscureText: false,
                          hintText: "Name",
                          controller: nameCon,
                          textInputAction: true,
                        ),
                        InputTextField(
                          hintText: "Email",
                          obscureText: false,
                          controller: emailCon,
                          textInputAction: true,
                        ),
                        InputTextField(
                          hintText: "Password",
                          obscureText: true,
                          controller: passwordCon,
                          textInputAction: true,
                          password: true,
                        ),
                        AppButtons(
                            textColor: GlobalVariables.backgroundColor,
                            backgroundColor: GlobalVariables.secondaryColor,
                            text: "Sign up",
                            borderColor: GlobalVariables.secondaryColor,
                            onTap: () {
                              if (signUpKey.currentState!.validate()) {
                                signUpUser();
                              }
                            }),
                        // ElevatedButton(
                        //     onPressed: () {
                        //       if (signUpKey.currentState!.validate()) {
                        //         signUpUser();
                        //       }
                        //     },
                        //     style: ElevatedButton.styleFrom(),
                        //     child: const Text(
                        //       'Sign-up',
                        //       style: TextStyle(
                        //           color: GlobalVariables.backgroundColor,
                        //           fontSize: 17),
                        //     ))
                      ],
                    )),
              ),
            ListTile(
              tileColor: _auth == Auth.signIn
                  ? GlobalVariables.backgroundColor
                  : GlobalVariables.greyBackgroundCOlor,
              title: const Text(
                'Sign-In.',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Radio(
                activeColor: _auth == Auth.signIn
                    ? GlobalVariables.secondaryColor
                    : GlobalVariables.greyBackgroundCOlor,
                groupValue: _auth,
                value: Auth.signIn,
                onChanged: (Auth? val) {
                  setState(() {
                    _auth = val!;
                  });
                },
              ),
            ),
            if (_auth == Auth.signIn)
              Container(
                padding: const EdgeInsets.all(8),
                decoration:
                    const BoxDecoration(color: GlobalVariables.backgroundColor),
                child: Form(
                    key: signinKey,
                    child: Column(
                      children: [
                        InputTextField(
                          hintText: "Email",
                          obscureText: false,
                          controller: emailCon,
                          textInputAction: true,
                        ),
                        InputTextField(
                          hintText: "Password",
                          obscureText: true,
                          controller: passwordCon,
                          textInputAction: true,
                          password: true,
                        ),
                        AppButtons(
                            textColor: GlobalVariables.backgroundColor,
                            backgroundColor: GlobalVariables.secondaryColor,
                            text: "Sign In",
                            borderColor: GlobalVariables.secondaryColor,
                            onTap: () {
                              if (signinKey.currentState!.validate()) {
                                signIn();
                              }
                            })
                      ],
                    )),
              ),
          ],
        ),
      )),
    );
  }
}

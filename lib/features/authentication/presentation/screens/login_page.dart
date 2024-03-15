import 'package:chat_app/core/pages/home_page.dart';
import 'package:chat_app/features/authentication/presentation/bloc/bloc/authentication_bloc.dart';
import 'package:chat_app/features/authentication/presentation/bloc/bloc/login_status.dart';
import 'package:chat_app/features/authentication/presentation/screens/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<LoginPage> {
  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isFormHasError = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  height: isFormHasError ? 30.h : 38.h,
                  child: Image.asset('assets/illustrations/login.png'),
                ),
                const Text(
                  'Welcome To Amir Hosein Chat App',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                  child: Column(
                    children: [
                      Text(
                        'Login to Your account',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 21,
                            color: Theme.of(context).primaryColor),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please enter email';
                          } else if (!RegExp(
                                  r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$")
                              .hasMatch(value)) {
                            return 'please enter valid email';
                          }
                          return null;
                        },
                        controller: email,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), labelText: 'Email'),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please enter password';
                          } else if (!RegExp(
                                  r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$")
                              .hasMatch(value)) {
                            return 'please enter valid password';
                          }
                          return null;
                        },
                        controller: password,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'password'),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      BlocConsumer<AuthenticationBloc, AuthenticationState>(
                        listener: (context, state) {
                          if (state.loginStatus is LoginDone) {
                            LoginDone loginDone =
                                state.loginStatus as LoginDone;
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    "you are logged in with \n ${loginDone.userCredential.user!.email}")));
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(
                              builder: (context) {
                                return HomePage();
                              },
                            ));
                          }
                          if (state.loginStatus is LoginError) {
                            LoginError signupStatus =
                                state.signupStatus as LoginError;
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(signupStatus.error)));
                          }
                        },
                        builder: (context, state) {
                          return ElevatedButton(
                              style: ButtonStyle(
                                  minimumSize: MaterialStatePropertyAll(
                                      Size(100.w, 6.h)),
                                  backgroundColor: MaterialStatePropertyAll(
                                      Theme.of(context).primaryColor)),
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  setState(() {
                                    isFormHasError = false;
                                  });
                                  BlocProvider.of<AuthenticationBloc>(context)
                                      .add(LoginEvent(
                                          email: email.text,
                                          password: password.text));
                                } else {
                                  setState(() {
                                    isFormHasError = true;
                                  });
                                }
                              },
                              child: state.loginStatus is LoginLoading
                                  ? const CircularProgressIndicator()
                                  : Text(
                                      'Login',
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                      ),
                                    ));
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                              minimumSize:
                                  MaterialStatePropertyAll(Size(100.w, 6.h)),
                              backgroundColor: MaterialStatePropertyAll(
                                  Theme.of(context).cardColor)),
                          onPressed: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(
                              builder: (context) {
                                return SignupPage();
                              },
                            ));
                          },
                          child: Text(
                            'If you dont have an account Please Signup',
                            style: TextStyle(
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:chat_app/core/pages/home_page.dart';
import 'package:chat_app/features/authentication/presentation/bloc/bloc/authentication_bloc.dart';
import 'package:chat_app/features/authentication/presentation/bloc/bloc/signup_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignupPage extends StatefulWidget {
  SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();

  final TextEditingController confirmpPassword = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isFormHasError = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  height: isFormHasError ? 25.h : 30.h,
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
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Column(
                    children: [
                      Text(
                        'Create an account',
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
                        height: 3.h,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please confirm password';
                          } else if (value != password.text) {
                            return 'passwords not the same';
                          }
                          return null;
                        },
                        controller: confirmpPassword,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'confirm password'),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      BlocConsumer<AuthenticationBloc, AuthenticationState>(
                        listener: (context, state) {
                          if (state.signupStatus is SignupDone) {
                            SignupDone signupStatus =
                                state.signupStatus as SignupDone;
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    "${signupStatus.userCredential.user!.email}")));
                          }
                          if (state.signupStatus is SignupError) {
                            SignupError signupStatus =
                                state.signupStatus as SignupError;
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
                                      .add(SignupEvent(
                                          email: email.text,
                                          password: password.text));
                                } else {
                                  setState(() {
                                    isFormHasError = true;
                                  });
                                }
                              },
                              child: state.signupStatus is SignupLoading
                                  ? const CircularProgressIndicator()
                                  : Text(
                                      'Create account',
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
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return HomePage();
                              },
                            ));
                          },
                          child: Text(
                            'Do you have an account ? Login',
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

import 'package:flutter/material.dart';
import 'package:nerds_project/auth/auth.dart';
import 'package:nerds_project/models/user.dart';
import 'package:nerds_project/widgets/loading_alert.dart';
// import 'package:nerds_project/models/user.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: height * 0.05, bottom: 30, left: width * 0),
                    child: const Text(
                      "Create an Account.",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                          top: 0.0, left: 15, right: 15, bottom: 10),
                      child: TextFormField(
                        controller: _nameController,
                        keyboardType: TextInputType.name,
                        autofocus: true,
                        autocorrect: true,
                        validator: (val) {
                          if (_emailController.text.isEmpty) {
                            return "Field cannot be empty";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelStyle: const TextStyle(
                            fontSize: 14,
                          ),
                          labelText: "Full Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 1.5),
                          ),
                        ),
                      )),
                      Padding(
                      padding: const EdgeInsets.only(
                          top: 0.0, left: 15, right: 15, bottom: 10),
                      child: TextFormField(
                        controller: _userNameController,
                        keyboardType: TextInputType.name,
                        autofocus: true,
                        autocorrect: true,
                        validator: (val) {
                          if (_emailController.text.isEmpty) {
                            return "Field cannot be empty";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelStyle: const TextStyle(
                            fontSize: 14,
                          ),
                          labelText: "username",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 1.5),
                          ),
                        ),
                      )),
                  Padding(
                      padding: const EdgeInsets.only(
                          top: 0.0, left: 15, right: 15, bottom: 10),
                      child: TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        autofocus: true,
                        autocorrect: true,
                        validator: (val) {
                          if (_emailController.text.isEmpty) {
                            return "Field cannot be empty";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelStyle: const TextStyle(
                            fontSize: 14,
                          ),
                          labelText: "Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 1.5),
                          ),
                        ),
                      )),
                  Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, left: 15, right: 15, bottom: 20),
                      child: TextFormField(
                        controller: _passwordController,
                        autofocus: true,
                        autocorrect: true,
                        obscureText: true,
                        validator: (val) {
                          if (_passwordController.text.isEmpty) {
                            return "Field cannot be empty";
                          } else if (_passwordController.text.length < 8) {
                            return "Password cannot be less that 8 characters";
                          } else if(_passwordController.text.trim() != _confirmPasswordController.text.trim()) {
                            return "Passwords don't match";
                          }
                           else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          labelStyle: const TextStyle(
                            fontSize: 14,
                          ),
                          labelText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 1.5),
                          ),
                        ),
                      )),
                  Padding(
                      padding: const EdgeInsets.only(
                          top: 0.0, left: 15, right: 15, bottom: 10),
                      child: TextFormField(
                        controller: _confirmPasswordController,
                        autofocus: true,
                        autocorrect: true,
                        obscureText: true,
                        validator: (val) {
                          if (_emailController.text.isEmpty) {
                            return "Field cannot be empty";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelStyle: const TextStyle(
                            fontSize: 14,
                          ),
                          labelText: "Confirm Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 1.5),
                          ),
                        ),
                      )),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 5.0, left: 0, right: 0, bottom: 20),
                    height: height * 0.1,
                    width: width * 0.9,
                    child: ElevatedButton(
                        onPressed: () {
                          final FormState? form = _formKey.currentState;
                          if (form!.validate()) {
                            User newUser = User(
                              name: _nameController.text.trim(),
                              email: _emailController.text.trim(),
                              password: _passwordController.text.trim(),
                              username: _userNameController.text.trim()
                            );
                            showDialog(
                                context: context,
                                builder: (_) {
                                  return const LoadingAlert(
                                    message: 'Signing Up please wait...',
                                  );
                                });
                            AuthMethods().createUser(newUser).then((value) =>
                                Navigator.pushReplacementNamed(
                                    context, "/storeTabs").onError((error, stackTrace) {
                                      Navigator.pop(context);
                              return ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Sign Up Error please Try again"),
                                duration: Duration(seconds: 2),
                              ));
                                    }));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.deepPurple),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Sign Up",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.check,
                              color: Colors.white,
                            )
                          ],
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

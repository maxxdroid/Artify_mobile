import 'package:flutter/material.dart';
import 'package:nerds_project/auth/auth.dart';
import 'package:nerds_project/models/user.dart';
import 'package:nerds_project/widgets/loading_alert.dart';
// import '../models/user.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

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
                      "Sign In.",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                          top: 0.0, left: 15, right: 15, bottom: 0),
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
                  Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: TextButton(
                          child: const Text("Forgot Password?",
                              style: TextStyle(color: Colors.purple)),
                          onPressed: () {},
                        ),
                      )),
                  Padding(
                      padding: const EdgeInsets.only(
                          top: 0.0, left: 15, right: 15, bottom: 20),
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        validator: (val) {
                          if (_passwordController.text.isEmpty) {
                            return "Field cannot be empty";
                          } else if (_passwordController.text.length < 8) {
                            return "Password cannot be less that 8 characters";
                          } else {
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
                  Container(
                    padding: const EdgeInsets.only(
                        top: 5.0, left: 0, right: 0, bottom: 20),
                    height: height * 0.1,
                    width: width * 0.9,
                    child: ElevatedButton(
                        onPressed: () {
                          final FormState? form = _formKey.currentState;
                          if (form!.validate()) {
                            User user = User(
                              email: _emailController.text.trim(),
                              password: _passwordController.text.trim(),
                            );

                            showDialog(
                                context: context,
                                builder: (_) {
                                  return const LoadingAlert(
                                    message: 'Signing in please wait...',
                                  );
                                });

                            AuthMethods()
                                .signInUser(user)
                                .then((value) => Navigator.pushReplacementNamed(
                                    context, "/storeTabs"))
                                .onError((error, stackTrace) {
                              Navigator.pop(context);
                              return ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Sign In error kindly check your credentials"),
                                duration: Duration(seconds: 2),
                              ));
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.purple,
                            backgroundColor: Colors.deepPurpleAccent),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Sign In",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            )
                          ],
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      const Flexible(
                        child: Divider(
                          thickness: 1,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        width: 40,
                        child: const Text("or"),
                      ),
                      const Flexible(
                        child: Divider(
                          thickness: 1,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.black, width: .5)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(
                              height: 40,
                              width: 40,
                              "https://imagepng.org/wp-content/uploads/2019/08/google-icon.png"),
                          const SizedBox(
                            width: 20,
                          ),
                          const Text("Sign In with Google")
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

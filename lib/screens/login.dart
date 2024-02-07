import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:task1/screens/Home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: Form(
          key: _formKey,
          child: SafeArea(
              child: Center(
                  child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //image
                Image.asset("images/icon.png"),
                const SizedBox(height: 20),

                //title
                const Text(
                  "SIGN IN",
                  style: TextStyle(fontSize: 20),
                ),

                //subtitle
                const Text(
                  "Welcome In My App :-) ",
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 20),

                //phone textfield

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Phone Nummber",
                        ),
                        validator: (value) {
                          // 1. Phone numbers must contain 10 digits.
                          // 2.In case country code us used, it can be 12 digits. (example country codes: +12, 012)
                          // 3.No space or no characters allowed between digits
                          String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                          RegExp regExp = RegExp(pattern);
                          if (value!.isEmpty) {
                            return 'Please enter phone number';
                          } else if (regExp.hasMatch(value)) {
                            return null;
                          } else {
                            return 'Enter valid phone number';
                          }
                        },
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 3),

                //password textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Password",
                        ),
                        validator: (value) {
                          // 1. Minimum 1 Upper case
                          // 2. Minimum 1 lowercase
                          // 3. Minimum 1 Numeric Number
                          // 4. Minimum 1 Special Character
                          // 5. Common Allow Character ( ! @ # $ & * ~ )
                          RegExp regex = RegExp(
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                          if (value!.isEmpty) {
                            return 'Please enter password';
                          } else {
                            if (!regex.hasMatch(value)) {
                              return 'Enter (Aa-Zz),(! @ # & * ~)  to password';
                            } else {
                              return null;
                            }
                          }
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                //sign in button

                MaterialButton(
                    elevation: 5.0,
                    color: Colors.green[400],
                    padding: const EdgeInsets.symmetric(
                        vertical: 8, horizontal: 120),
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none,
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        if (kDebugMode) {
                          // ignore: prefer_typing_uninitialized_variables

                          print("Valid");
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();

                          // ignore: prefer_typing_uninitialized_variables

                          await prefs.setString(
                            'user_phone_number',
                            'phoneNumberController.text',
                          );
                          // ignore: use_build_context_synchronously
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
                          );
                        }
                      } else {
                        if (kDebugMode) {
                          print("Not Valid");
                        }
                      }
                    },
                    child: const Text(
                      "Log in",
                    )),
                const SizedBox(height: 0),

                //text forget password

                const Text(
                  "Forgot password?  No yawa .",
                  style: TextStyle(fontSize: 13),
                ),
                const Text(
                  "Tap me",
                  style: TextStyle(color: Colors.blue),
                ),
                const SizedBox(height: 0),

                //text no account
                const Text(
                  "No Account ? ",
                  style: TextStyle(fontSize: 13),
                ),
                const SizedBox(height: 0),

                //sing up button
                MaterialButton(
                    elevation: 5.0,
                    color: Colors.grey[600],
                    padding: const EdgeInsets.symmetric(
                        vertical: 8, horizontal: 120),
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none,
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Sign Up",
                    )),
                const SizedBox(height: 20),
              ],
            ),
          ))),
        ));
  }
}

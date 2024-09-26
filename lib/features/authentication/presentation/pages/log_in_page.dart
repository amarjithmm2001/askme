import 'package:askme/features/authentication/presentation/pages/sign_up_page.dart';
import 'package:askme/features/authentication/presentation/widgets/my_rich_text.dart';
import 'package:askme/features/authentication/presentation/widgets/my_textfield.dart';
import 'package:askme/features/chat/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Center(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              const Text(
                "Welcome back..",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
                const Text(
                  "Login to access the chat...",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                MyTextfield(
                  controller: emailController,
                  hinttext: "Enter your Email",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10.0,
                ),
                MyTextfield(
                  controller: passwordController,
                  hinttext: "Enter the Password",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 30.0,
                ),
                GestureDetector(
                  child: Container(
                    height: 60.0,
                    width: double.infinity,
                    color: Colors.green,
                    child: const Center(
                      child: Text(
                        "LOG IN",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    // if (formKey.currentState?.validate() ?? false) {}
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const MyRichText(
                  page: SignUpPage(),
                  text_1: "You don't have an account? ",
                  text_2: "Sign up",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

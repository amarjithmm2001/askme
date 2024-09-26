import 'package:askme/features/authentication/data/models/user_model.dart';
import 'package:askme/features/authentication/domin/auth_services.dart';
import 'package:askme/features/authentication/presentation/pages/log_in_page.dart';
import 'package:askme/features/authentication/presentation/widgets/my_button.dart';
import 'package:askme/features/authentication/presentation/widgets/my_rich_text.dart';
import 'package:askme/features/authentication/presentation/widgets/my_textfield.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    final formKey = GlobalKey<FormState>();

    UserModel userModel = UserModel();
    AuthServices authServices = AuthServices();

  @override
  Widget build(BuildContext context) {
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
                  "SIGN UP",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                MyTextfield(controller: nameController, hinttext: "Name"),
                const SizedBox(
                  height: 10.0,
                ),
                MyTextfield(controller: emailController, hinttext: "Email"),
                const SizedBox(
                  height: 10.0,
                ),
                MyTextfield(
                    controller: passwordController, hinttext: "Password"),
                const SizedBox(
                  height: 10.0,
                ),
                MyTextfield(
                    controller: confirmPasswordController,
                    hinttext: "Confirm Password"),
                const SizedBox(
                  height: 20.0,
                ),
                GestureDetector(
                    onTap: () {
                      if (formKey.currentState?.validate() ?? false) {
                        userModel = UserModel(
                          email: emailController.text,
                          password: passwordController.text,
                          name: nameController.text
                        );
                        final userdata = authServices.signup(userModel);
                        
                        if(userdata != null){
                          print("success");
                        }
                      }
                    },
                    child: const MyButton(buttonname: "SIGN UP")),
                const SizedBox(
                  height: 10.0,
                ),
                 const MyRichText(
                  page: LoginPage(),
                  text_1:"You already have an account? ",
                  text_2: 'LogIn',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

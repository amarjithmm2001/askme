import 'package:askme/features/authentication/presentation/pages/log_in_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "AskMe.!",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              SizedBox(
                height: 200.0,
                child: Image(
                  image: AssetImage("assets/images/AskMe_app_logo.png"),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Text(
                "Welcome to AskMe AI Chat App",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Discover a whole new way to interact and get assistance with our intelligent AI chat app. Whether you need help with daily tasks, want to have a friendly conversation, or seek quick answers to your questions, AskMe is here for you to solve your question",
                style: TextStyle(
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(30.0),
        child: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const LoginPage()));
          },
          child: Container(
            height: 60.0,
            width: double.infinity,
            color: Colors.green,
            child: const Center(
              child: Text(
                "Let us Start",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

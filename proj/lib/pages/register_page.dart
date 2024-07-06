import 'package:flutter/material.dart';
import 'package:proj/components/my_button.dart';
import 'package:proj/components/my_text_feild.dart';
import 'package:proj/pages/login_page.dart';
import 'package:proj/services/auth/auth_service.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void signUp() async {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match!')),
      );
      return;
    }

    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signUpWithEmailAndPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 110),
            Icon(Icons.person_add, size: 80),
            const SizedBox(height: 25),
            Text('Sign Up Page', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 25),
            TextInputField(
              controller: emailController,
              labelText: 'Email',
              isObscure: false,
              icon: Icons.email,
            ),
            const SizedBox(height: 20),
            TextInputField(
              controller: passwordController,
              labelText: 'Password',
              isObscure: true,
              icon: Icons.lock,
            ),
            const SizedBox(height: 20),
            TextInputField(
              controller: confirmPasswordController,
              labelText: 'Confirm Password',
              isObscure: true,
              icon: Icons.lock,
            ),
            const SizedBox(height: 20),
            MyButton(
              text: 'Sign Up',
              onTap: signUp,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account?'),
                GestureDetector(
                  onTap: (){
                     Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

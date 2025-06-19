import 'package:flutter/material.dart';
import 'package:my_project/core/routes/app_routes.dart';
import 'package:my_project/pages/authentication/presentation/pages/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscurePassword = true;

  bool isEmailValid(String email) {
    return RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                const SizedBox(height: 40),
                Image.asset('assets/images/plant.png', height: 150),

                const SizedBox(height: 32),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Enter your credentials to continue",
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ),
                const SizedBox(height: 24),

                // Username Field
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Username",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF7C7C7C),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                TextField(
                  style: TextStyle(color: Colors.black),
                  controller: usernameController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 24),

                // Email Field
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Email",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF7C7C7C),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                TextField(
                  style: TextStyle(color: Colors.black),
                  controller: emailController,
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
                    suffixIcon:
                        isEmailValid(emailController.text)
                            ? const Icon(Icons.check, color: Colors.green)
                            : null,
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
                const SizedBox(height: 24),

                // Password Field
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Password",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF7C7C7C),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                TextField(
                  style: TextStyle(color: Colors.black),
                  controller: passwordController,
                  obscureText: obscurePassword,
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          obscurePassword = !obscurePassword;
                        });
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 16),
                RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    text: "By continuing you agree to our ",
                    style: const TextStyle(color: Colors.black54),
                    children: const [
                      TextSpan(
                        text: "Terms of Service",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(text: " and "),
                      TextSpan(
                        text: "Privacy Policy.",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Sign Up Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text("Sign Up"),
                  ),
                ),

                const SizedBox(height: 24),

                // Footer: Already have an account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an Account? ",
                      style: TextStyle(color: Colors.black),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.Login);
                      },
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_project/core/widgets/inputs/phone_number_input.dart';

class InitialLoginScreen extends StatefulWidget {
  const InitialLoginScreen({super.key});

  @override
  State<InitialLoginScreen> createState() => _InitialLoginScreenState();
}

class _InitialLoginScreenState extends State<InitialLoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();

  String initialCountry = "KH";
  PhoneNumber number = PhoneNumber(isoCode: "KH");

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight / 2,
              width: double.infinity,
              child: Image.asset("assets/images/plantImage.png"),
            ),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Please enter your\nPhone Number",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PhoneNumberInput(
                    formKey: formKey,
                    controller: controller,
                    initialNumber: number,
                    onSaved: (PhoneNumber num) {
                      print("On save: $num");
                    },
                    onChanged: (PhoneNumber num) {
                      print("Changed: ${num.phoneNumber}");
                    },
                  ),
                  const SizedBox(height: 16),
                  const Text('Or connect with social media'),
                  const SizedBox(height: 16),

                  // Google Button
                  buildSocialButton(
                    icon: FontAwesomeIcons.google,
                    text: 'Continue with Google',
                    color: Colors.blue,
                  ),

                  const SizedBox(height: 16),

                  // Facebook Button
                  buildSocialButton(
                    icon: FontAwesomeIcons.facebook,
                    text: 'Continue with Facebook',
                    color: Colors.blueAccent,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSocialButton({
    required IconData icon,
    required String text,
    required Color color,
  }) {
    return SizedBox(
      width: 300,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          padding: EdgeInsets.zero,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: FaIcon(icon),
              ),
            ),
            Center(child: Text(text)),
          ],
        ),
      ),
    );
  }

  void getPhoneNumber(String phoneNumberStr) async {
    PhoneNumber newNumber = await PhoneNumber.getRegionInfoFromPhoneNumber(
      phoneNumberStr,
      "KH",
    );

    if (!mounted) return;

    setState(() {
      number = newNumber;
      controller.text = newNumber.phoneNumber ?? '';
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
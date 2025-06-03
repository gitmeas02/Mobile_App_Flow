import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
            Padding(
              padding: const EdgeInsets.all(16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: const Text(
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
                  Form(
                    key: formKey,
                    child: InternationalPhoneNumberInput(
                      onInputChanged: (PhoneNumber number) {
                        print(number.phoneNumber);
                      },
                      onInputValidated: (bool value) {
                        print(value);
                      },
                      selectorConfig: const SelectorConfig(
                        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                        useBottomSheetSafeArea: true,
                      ),
                      ignoreBlank: false,
                      autoValidateMode: AutovalidateMode.disabled,
                      selectorTextStyle: const TextStyle(color: Colors.black),
                      initialValue: number,
                      textFieldController: controller,
                      formatInput: true,
                      keyboardType: const TextInputType.numberWithOptions(
                        signed: true,
                        decimal: true,
                      ),
                      inputBorder: const OutlineInputBorder(),
                      onSaved: (PhoneNumber number) {
                        print("On save: $number");
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      formKey.currentState?.validate();
                    },
                    child: const Text("Validate"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      getPhoneNumber("+15417543010");
                    },
                    child: const Text("Update"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      formKey.currentState?.save();
                    },
                    child: const Text("Save"),
                  ),
                ],
              ),
            ),
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

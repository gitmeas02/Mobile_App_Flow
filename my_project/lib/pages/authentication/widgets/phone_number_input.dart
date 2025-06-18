import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneNumberInput extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController controller;
  final PhoneNumber initialNumber;
  final Function(PhoneNumber) onSaved;
  final Function(PhoneNumber) onChanged;

  const PhoneNumberInput({
    super.key,
    required this.formKey,
    required this.controller,
    required this.initialNumber,
    required this.onSaved,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: InternationalPhoneNumberInput(
        onInputChanged: onChanged,
        onInputValidated: (bool value) {
          print("Validated: $value");
        },
        selectorConfig: const SelectorConfig(
          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
          useBottomSheetSafeArea: true,
        ),
        ignoreBlank: false,
        autoValidateMode: AutovalidateMode.disabled,
        selectorTextStyle: const TextStyle(color: Colors.black),
        initialValue: initialNumber,
        textFieldController: controller,
        formatInput: true,
        keyboardType: const TextInputType.numberWithOptions(
          signed: true,
          decimal: true,
        ),
        inputBorder: const OutlineInputBorder(),
        onSaved: onSaved,
      ),
    );
  }
}
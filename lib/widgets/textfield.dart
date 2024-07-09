import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.title,
    required this.onChange,
    required this.focusNode,
    this.onFieldSubmitted,
  });

  final TextEditingController controller;
  final String title;
  final Function(String value) onChange;
  final FocusNode focusNode;
  final Function(String value)? onFieldSubmitted;
  String? getValidator(String? v) {
    if (v == null || v.isEmpty) {
      return "Please enter correct parameters.";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: getValidator,
      onChanged: onChange,
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
      ),
      focusNode: focusNode,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: onFieldSubmitted,
      autocorrect: true,
    );
  }
}

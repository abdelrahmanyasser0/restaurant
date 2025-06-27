import 'package:flutter/material.dart';
import 'package:payment/core/constants/app_colors.dart';
import 'package:payment/core/widgets/custom_text.dart';


class CustomTextField extends StatelessWidget {
  final String label;
  final String? initialValue;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final int minLength;
  final int maxLength;

  const CustomTextField({
    super.key,
    required this.label,
    this.initialValue,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.minLength = 1,
    this.maxLength = 100,
  });

  String? _validator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return '$label is required';
    }
    if (value.length < minLength) {
      return '$label must be at least $minLength characters';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 25),

        Text(
          label,
          style: AppTextStyles.label
        ),
        const SizedBox(height: 6),
        TextFormField(
          cursorColor: AppColors.orangeDark,
          controller: controller,
          initialValue: controller == null ? initialValue : null,
          keyboardType: keyboardType,
          validator: _validator,
          maxLength: maxLength,
          style:  AppTextStyles.input,
          decoration: InputDecoration(
            counterText: '',
            filled: true,

            fillColor:  AppColors.beige, // beige color
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}

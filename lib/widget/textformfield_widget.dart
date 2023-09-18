import 'package:flutter/material.dart';
import 'package:non_trade_cement_bulk_order_only/utils/colors.dart';


class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;
  final FormFieldValidator<String>? validator;
  final int? maxLines;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.onSaved,
    this.validator,
    this.obscureText = false,
    this.prefixIcon,
    this.keyboardType,
    this.enabled = true,
    this.readOnly = false,
    this.onTap,
    this.onChanged,
    this.suffixIcon,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null) ...{
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15 / 2),
              child: Text(
                labelText ?? '',
                style: const TextStyle(
                    fontSize: 16,
                    color: textColor,
                    fontWeight: FontWeight.w500),
              ))
        },
        const SizedBox(height: 10),
        TextFormField(
          readOnly: readOnly,
          enabled: enabled,
          controller: controller,
          obscureText: obscureText,
          cursorColor: darkBlue,
          maxLines: maxLines ?? 1,
          style: const TextStyle(
              fontSize: 16, color: textColor, fontWeight: FontWeight.w500),
          keyboardType: keyboardType ?? TextInputType.text,
          decoration: InputDecoration(
            isDense: true,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon ?? const SizedBox(),
            hintText: hintText,
            hintStyle: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: darkBlue),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.red),
            ),
          ),
          onSaved: onSaved,
          validator: validator,
          onTap: onTap,
          onChanged: onChanged,
        ),
      ],
    );
  }
}

// class TextFormFieldWidget extends StatelessWidget {
//   final String? hintText;
//   final Widget? suffixIcon;
//   final bool? obscureText;
//   final TextEditingController? controller;
//   final Function? onChanged;
//   final bool? readOnly;
//   final int? maxLines;
//   final TextInputType? keyboardType;
//   const TextFormFieldWidget(
//       {super.key,
//       this.hintText,
//       this.suffixIcon,
//       this.obscureText,
//       this.controller,
//       this.onChanged,
//       this.readOnly,
//       this.maxLines,
//       this.keyboardType});

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//         keyboardType: keyboardType ?? TextInputType.text,
//         maxLines: maxLines ?? 1,
//         readOnly: readOnly ?? false,
//         controller: controller,
//         onChanged: onChanged as void Function(String)?,
//         style: const TextStyle(fontSize: 18),
//         obscureText: obscureText ?? false,
//         decoration: InputDecoration(
//           isDense: true,
//           fillColor: Colors.white,
//           border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
//           hintText: hintText ?? '',
//           focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10.0),
//               borderSide: const BorderSide(width: 3, color: secondaryColor)),
//           enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10.0),
//               borderSide: const BorderSide(color: secondaryColor, width: 2.0)),
//           suffixIcon: suffixIcon ?? const SizedBox(),
//         ));
//   }
// }

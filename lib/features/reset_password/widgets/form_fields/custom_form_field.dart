import 'package:custom_snack_bar/backend_errors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomFormField<StateType> extends StatefulWidget {
  final String keyName;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType inputType;
  final bool isPasswordField;
  final StateType? state;
  const CustomFormField({
    required this.keyName,
    required this.hintText,
    required this.controller,
    super.key,
    this.state,
    this.isPasswordField = false,
    this.validator,
    this.inputType = TextInputType.text,
  });

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: Key(widget.keyName),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.controller,
      obscureText: widget.isPasswordField ? hidePassword : false,
      decoration: InputDecoration(
        suffixIcon: widget.isPasswordField
            ? InkWell(
                onTap: () => setState(() {
                      hidePassword = !hidePassword;
                    }),
                child: Icon(
                  !hidePassword ? Icons.lock : Icons.remove_red_eye,
                ))
            : null,
        contentPadding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(5.w),
        ),
        //error
        errorText:
            FailureState.getError(state: widget.state, key: widget.keyName),
        errorMaxLines: 10,

        hintText: widget.hintText,
      ),
      keyboardType: widget.inputType,
      validator: widget.validator,
    );
  }
}

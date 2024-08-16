import 'package:authentication_with_bloc_firebase_flutter/utils/constants/app_color.dart';
import 'package:flutter/material.dart';

class DefaultTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  const DefaultTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
  });

  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 400,
      ),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.isPassword ? !visible : visible,
        autocorrect: !widget.isPassword,
        enableSuggestions: !widget.isPassword,
        decoration: InputDecoration(
          suffixIcon: widget.isPassword
              ? Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: IconButton(
                    style: const ButtonStyle(
                        splashFactory: NoSplash.splashFactory),
                    onPressed: () {
                      setState(() {
                        visible = !visible;
                      });
                    },
                    icon: Icon(
                      visible ? Icons.visibility : Icons.visibility_off,
                      color: AppColor.borderColor,
                    ),
                  ),
                )
              : null,
          contentPadding: const EdgeInsets.all(27),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColor.borderColor,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColor.gradient2,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: widget.hintText,
        ),
      ),
    );
  }
}

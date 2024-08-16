import 'package:authentication_with_bloc_firebase_flutter/utils/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialButton extends StatelessWidget {
  final String iconPath;
  final String label;
  final double horizontalPadding;
  final VoidCallback onPressed;
  const SocialButton({
    super.key,
    required this.iconPath,
    required this.label,
    this.horizontalPadding = 100,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        iconPath,
        width: 25,
        color: AppColor.white,
      ),
      label: Text(
        label,
        style: const TextStyle(
          color: AppColor.white,
          fontSize: 17,
        ),
      ),
      style: TextButton.styleFrom(
        padding:
            EdgeInsets.symmetric(vertical: 30, horizontal: horizontalPadding),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: AppColor.borderColor,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

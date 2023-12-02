import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialMediaCard extends StatelessWidget {
  const SocialMediaCard({
    super.key,
    this.icon,
    this.press,
  });

  final String? icon;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press as void Function()?,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        padding: EdgeInsets.all(50),
        height: (30),
        width: (40),
        decoration: const BoxDecoration(
          color: Color(0xFFF5F6F9),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(icon!),
      ),
    );
  }
}

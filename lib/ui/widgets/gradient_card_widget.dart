import 'package:flutter/material.dart';
import 'package:qyre_test/constans/app_colors.dart';

class GradientCardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget widget;
  final Color topColor;
  final Color bottomColor;
  const GradientCardWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.widget,
    required this.topColor,
    required this.bottomColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 140,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                topColor,
                bottomColor,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 17,
              bottom: 12,
              left: 12,
              right: 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget,
                const SizedBox(height: 12),
                Text(
                  title,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.whiteColor),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: AppColors.whiteColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

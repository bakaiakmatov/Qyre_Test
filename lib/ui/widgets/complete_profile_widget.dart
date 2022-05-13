import 'package:flutter/material.dart';
import 'package:qyre_test/constans/app_colors.dart';

class CompleteProfileWidget extends StatelessWidget {
  final Widget? indicator;
  final String title;
  final Widget? widget;

  const CompleteProfileWidget({
    Key? key,
    this.indicator,
    this.widget,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 136,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.athensGrayColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 18),
              if (indicator != null) indicator!,
              const SizedBox(height: 18),
              if (widget != null) widget!,
            ],
          ),
        ),
      ),
    );
  }
}

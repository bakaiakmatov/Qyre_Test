import 'package:flutter/material.dart';
import 'package:qyre_test/constans/app_colors.dart';
import 'package:qyre_test/constans/app_styles.dart';

class CustomCardWidget extends StatelessWidget {
  final String title;
  final String content;
  final Widget? widget;
  final Widget? icon;
  const CustomCardWidget({
    Key? key,
    required this.title,
    required this.content,
    this.widget,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: AppStyles.text18W600.copyWith(
              color: AppColors.tundoraColor,
            )),
        const SizedBox(height: 8),
        SizedBox(
          width: double.maxFinite,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: AppColors.athensGrayColor,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 20,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      icon!,
                      const SizedBox(width: 18),
                      Flexible(
                        child: Text(
                          content,
                          style: AppStyles.text15W400,
                        ),
                      ),
                      const SizedBox(height: 18),
                    ],
                  ),
                  if (widget != null) widget!,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

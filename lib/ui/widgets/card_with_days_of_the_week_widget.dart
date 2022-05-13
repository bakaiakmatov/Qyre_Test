import 'package:flutter/material.dart';
import 'package:qyre_test/constans/app_colors.dart';
import 'package:qyre_test/constans/app_styles.dart';

class CardWithDaysOfTheWeekWidget extends StatelessWidget {
  final String? today;
  final String dayOfTheWeek;
  final String month;
  final int number;
  final bool? isToday;

  const CardWithDaysOfTheWeekWidget({
    Key? key,
    this.today,
    required this.dayOfTheWeek,
    required this.month,
    required this.number,
    this.isToday,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.codGrayColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (today != null)
                Text(
                  today!,
                  style: AppStyles.text10W600.copyWith(
                    color: AppColors.dustyGray,
                  ),
                ),
              const SizedBox(height: 4),
              Text(
                dayOfTheWeek,
                style: AppStyles.text12W500.copyWith(
                  color: AppColors.whiteColor,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                month,
                style: AppStyles.text10W600.copyWith(
                  color: AppColors.dustyGray,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                number.toString(),
                style: AppStyles.text16W700.copyWith(
                  color: AppColors.whiteColor,
                ),
              ),
              const SizedBox(width: 8),
              const SizedBox(height: 4),
              if (isToday == true)
                const ClipOval(
                  child: SizedBox(
                    height: 8,
                    width: 8,
                    child: ColoredBox(color: AppColors.flamingoColor),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}

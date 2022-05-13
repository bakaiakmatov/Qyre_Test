import 'package:flutter/material.dart';
import 'package:qyre_test/constans/app_styles.dart';

import '../../constans/app_colors.dart';

class SmallCardWithDaysWidget extends StatelessWidget {
  final String? today;
  final String dayOfTheWeek;
  final String month;
  final int number;
  final double? width;
  final bool? isToday;
  const SmallCardWithDaysWidget({
    Key? key,
    this.today,
    required this.dayOfTheWeek,
    required this.month,
    required this.number,
    this.isToday,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: SizedBox(
        width: width,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.codGrayColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 7,
              horizontal: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    if (today != null)
                      Text(
                        today!,
                        style: AppStyles.text10W600.copyWith(
                          color: AppColors.dustyGray,
                        ),
                      ),
                    const SizedBox(width: 2),
                    Text(dayOfTheWeek,
                        style: AppStyles.text12W500.copyWith(
                          color: AppColors.whiteColor,
                        )),
                  ],
                ),
                Row(
                  children: [
                    if (isToday == true)
                      const ClipOval(
                        child: SizedBox(
                          height: 4,
                          width: 4,
                          child: ColoredBox(color: AppColors.flamingoColor),
                        ),
                      ),
                    Text(
                      number.toString(),
                      style: AppStyles.text10W500.copyWith(color: AppColors.whiteColor),
                    ),
                    const SizedBox(width: 2),
                    Text(
                      month,
                      style: AppStyles.text10W600.copyWith(color: AppColors.whiteColor),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

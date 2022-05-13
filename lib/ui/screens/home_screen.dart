import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qyre_test/constans/app_colors.dart';
import 'package:qyre_test/constans/app_icons.dart';
import 'package:qyre_test/constans/app_strings.dart';
import 'package:qyre_test/ui/widgets/card_with_days_of_the_week_widget.dart';
import 'package:qyre_test/ui/widgets/gradient_card_widget.dart';

import '../widgets/complete_profile_widget.dart';
import '../widgets/custom_card_widget.dart';
import '../widgets/small_card_with_days_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isMinDaysVisible = false;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      debugPrint('_scrollController.offset: ${_scrollController.offset}');
      if (_scrollController.offset >= 100) {
        setState(() {
          _isMinDaysVisible = true;
        });
      } else {
        setState(() {
          _isMinDaysVisible = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      controller: ScrollController(),
      floatHeaderSlivers: true,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          const SliverAppBar(
            elevation: 0.0,
            floating: true,
            backgroundColor: Colors.transparent,
            centerTitle: false,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
              title: Text(
                AppStrings.appBarTitile,
                style: TextStyle(color: AppColors.codGrayColor),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: AnimatedSize(
              duration: const Duration(milliseconds: 400),
              child: SizedBox(
                height: _isMinDaysVisible ? kToolbarHeight : 0,
                width: double.maxFinite,
                child: DecoratedBox(
                  decoration: const BoxDecoration(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: IntrinsicHeight(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            const SmallCardWithDaysWidget(
                              today: 'TODAY',
                              dayOfTheWeek: 'Thu',
                              month: 'May',
                              number: 4,
                              isToday: true,
                            ),
                            ...DaysOfTheWeek.daysOfTheWeek
                                .map(
                                  (e) => Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: SmallCardWithDaysWidget(
                                      dayOfTheWeek: e.dayOfWeek,
                                      month: e.month,
                                      number: e.day,
                                      isToday: e.isToday,
                                    ),
                                  ),
                                )
                                .toList(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ];
      },
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const CardWithDaysOfTheWeekWidget(
                      today: 'TODAY',
                      dayOfTheWeek: 'Thu',
                      month: 'May',
                      number: 4,
                      isToday: true,
                    ),
                    ...DaysOfTheWeek.daysOfTheWeek
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: CardWithDaysOfTheWeekWidget(
                              dayOfTheWeek: e.dayOfWeek,
                              month: e.month,
                              number: e.day,
                              isToday: e.isToday,
                            ),
                          ),
                        )
                        .toList(),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CompleteProfileWidget(
                      title: AppStrings.completeProfile,
                      indicator: const LinearProgressIndicator(
                        backgroundColor: AppColors.whiteColor,
                        valueColor: AlwaysStoppedAnimation<Color>(AppColors.malibuColor),
                        minHeight: 9,
                        value: 85 / 100,
                      ),
                      widget: InkWell(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text(
                              'Complete profile',
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(width: 6),
                            Icon(Icons.arrow_forward_ios, size: 14),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    CompleteProfileWidget(
                      title: AppStrings.completeProfile,
                      widget: InkWell(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text(
                              'Complete profile',
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(width: 6),
                            Icon(Icons.arrow_forward_ios, size: 14),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              CustomCardWidget(
                title: AppStrings.todaysWorksTitle,
                content: AppStrings.todaysWorksSubtitle,
                icon: SvgPicture.asset(
                  AppIcons.ic3,
                  alignment: Alignment.bottomCenter,
                  height: 44,
                  width: 50,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  GradientCardWidget(
                      title: AppStrings.myNetworkTitle,
                      subtitle: AppStrings.myNetworkSubtitle,
                      widget: SvgPicture.asset(
                        AppIcons.ic1,
                        alignment: Alignment.bottomCenter,
                        height: 34,
                        width: 50,
                      ),
                      topColor: AppColors.ceruleanBlueColor,
                      bottomColor: AppColors.havelockBlueColor),
                  const SizedBox(width: 14),
                  GradientCardWidget(
                      title: AppStrings.quickHireTitle,
                      subtitle: AppStrings.quickHireSubtitle,
                      widget: SvgPicture.asset(
                        AppIcons.ic6,
                        alignment: Alignment.bottomCenter,
                        height: 34,
                        width: 50,
                      ),
                      topColor: AppColors.flamingoColor,
                      bottomColor: AppColors.sandyBrownColor),
                  const SizedBox(width: 14),
                  GradientCardWidget(
                      title: AppStrings.myCVTitle,
                      subtitle: AppStrings.myCVSubtitle,
                      widget: SvgPicture.asset(
                        AppIcons.ic2,
                        alignment: Alignment.bottomCenter,
                        height: 34,
                        width: 50,
                      ),
                      topColor: AppColors.purpleHeartColor,
                      bottomColor: AppColors.mediumPurpleColor),
                ],
              ),
              const SizedBox(height: 40),
              CustomCardWidget(
                title: AppStrings.myJobOffersTitle,
                content: AppStrings.myJobOffersSubtitle,
                widget: InkWell(
                  onTap: () {
                    print('Tapped');
                  },
                  child: Column(
                    children: [
                      const SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            'Go to my profile',
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(width: 6),
                          Icon(Icons.arrow_forward_ios, size: 14),
                        ],
                      ),
                    ],
                  ),
                ),
                icon: SvgPicture.asset(
                  AppIcons.ic5,
                  alignment: Alignment.bottomCenter,
                  height: 44,
                  width: 50,
                ),
              ),
              const SizedBox(height: 40),
              CustomCardWidget(
                title: AppStrings.starredPostsTitle,
                content: AppStrings.starredPostsSubtitle,
                icon: SvgPicture.asset(
                  AppIcons.ic4,
                  alignment: Alignment.bottomCenter,
                  height: 44,
                  width: 50,
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class AppStrings {
  static const String appName = 'Qyre Test';
  static const String appBarTitile = 'My Availability';
  static const String completeProfile = 'Complete your profile tooptimize your exposure in job searches.';

  //
  static const String todaysWorksTitle = 'Today’s productions';
  static const String todaysWorksSubtitle = 'All of your today’s productions will be displayed here.';
  //
  static const String myJobOffersTitle = 'My job offers';
  static const String myJobOffersSubtitle =
      'Job offers are shown here! Keep your profile updated to stay relevant for new opportunities.';

  // Starred posts
  static const String starredPostsTitle = 'Starred posts';
  static const String starredPostsSubtitle =
      'Posts that are extra relevant to you can be marked with a star and will be shown here for easy access.';

  //My network
  static const String myNetworkTitle = 'My network';
  static const String myNetworkSubtitle = 'Connect and grow your network';

  //Quick hire
  static const String quickHireTitle = 'Quick hire';
  static const String quickHireSubtitle = 'Hire someone quickly today';

  //My CV
  static const String myCVTitle = 'My CV';
  static const String myCVSubtitle = 'Keep your CV updated to get relevant offers';
  //
}

class DaysOfTheWeek {
  final String month;
  final int day;
  final String dayOfWeek;
  final bool? isToday;

  DaysOfTheWeek({
    required this.month,
    required this.day,
    required this.dayOfWeek,
    this.isToday,
  });

  static List<DaysOfTheWeek> daysOfTheWeek = [
    DaysOfTheWeek(
      dayOfWeek: 'Tue',
      month: 'May',
      day: 1,
    ),
    DaysOfTheWeek(
      dayOfWeek: 'Wed',
      month: 'May',
      day: 2,
    ),
    DaysOfTheWeek(
      dayOfWeek: 'Thu',
      month: 'May',
      day: 3,
      isToday: true,
    ),
    DaysOfTheWeek(
      dayOfWeek: 'Fri',
      month: 'May',
      day: 4,
    ),
    DaysOfTheWeek(
      dayOfWeek: 'Sat',
      month: 'May',
      day: 5,
      isToday: true,
    ),
    DaysOfTheWeek(
      dayOfWeek: 'Sun',
      month: 'May',
      day: 6,
    ),
    DaysOfTheWeek(
      dayOfWeek: 'Mon',
      month: 'May',
      day: 7,
    ),
  ];
}

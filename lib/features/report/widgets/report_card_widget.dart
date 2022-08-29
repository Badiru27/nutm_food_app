import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutm_food_app/themes/app_theme.dart';
import 'package:nutm_food_app/util/formatter.dart';

class BookedPlaceCard extends StatelessWidget {
  const BookedPlaceCard(
      {Key? key,
      required this.name,
      required this.date,
      required this.image,
      required this.totalPerson})
      : super(key: key);
  final String name;
  final String date;
  final int totalPerson;
  final String image;

  static final BorderRadius radius = BorderRadius.circular(10);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: radius,
      ),
      child: SizedBox(
        height: 100.h,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              width: 100.w,
              height: 100.w,
              child: ClipRRect(
                borderRadius: radius,
                child: Image.asset(
                  image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(left: 10.w, bottom: 5.h, top: 5.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name.capitalize(),
                      style: theme.textTheme.headline5,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.date_range,
                          size: 16,
                        ),
                        SizedBox(width: 5.w),
                        Flexible(
                          child: Text(
                            date,
                            style: theme.textTheme.caption!.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 10.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Row(
              children: [
                const Icon(
                  Icons.person,
                  color: AppTheme.primaryColor,
                ),
                SizedBox(width: 4.w),
                Text(
                  "$totalPerson",
                  style: theme.textTheme.headline5!.copyWith(
                    color: AppTheme.white,
                  ),
                ),
              ],
            ),
            SizedBox(width: 10.w),
          ],
        ),
      ),
    );
  }
}

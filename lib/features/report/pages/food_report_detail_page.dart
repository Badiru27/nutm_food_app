import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutm_food_app/features/report/model/report.dart';
import 'package:nutm_food_app/themes/app_theme.dart';
import 'package:nutm_food_app/util/formatter.dart';

class FoodReportDetailPage extends StatelessWidget {
  final FoodReport report;
  const FoodReportDetailPage({
    Key? key,
    required this.report,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  report.meal == "breakfast"
                    ? 'assets/breakfast.jpg'
                    : report.meal == "lunch"
                        ? 'assets/lunch.jpg'
                        : 'assets/dinner.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Align(alignment: Alignment.topLeft,
            child: IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: const Icon(Icons.arrow_back, color: Colors.black,),),),

          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   SizedBox(
                  height: 10.h,
                ),
                  Text(report.meal.capitalize(), style: AppTheme.textTheme.headline4,),
                  SizedBox(height: 10.h,),
                  Text(report.foodId, style: AppTheme.textTheme.bodySmall,),
                  SizedBox(height: 50.h,),
                  Text(
                  "Signed Users",
                  style: AppTheme.textTheme.headline4,
                ),

                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: report.person.length,

                    itemBuilder: ((context, index) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                      children: [
                        Text("Name:", style: AppTheme.textTheme.bodyText1,),
                        SizedBox(width: 50.w,),
                        Text(report.person[index].name.capitalize(), style: AppTheme.textTheme.bodyText1,),
                      ],
                  ),
                    )))
                ],
              ),
            ),
          ),
        ],
      ));
  }
}

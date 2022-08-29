import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutm_food_app/features/report/bloc/report_bloc.dart';
import 'package:nutm_food_app/features/report/widgets/report_card_widget.dart';
import 'package:nutm_food_app/features/report/widgets/report_filter.dart';
import 'package:nutm_food_app/util/formatter.dart';

class FoodReportPage extends StatelessWidget {
  const FoodReportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              '${AppFormatter.dateFormatterMonth.format(DateTime.now())} Food Report'),
          actions: [
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return const ReportFilterWidget();
                      });
                },
                icon: const Icon(Icons.filter_list))
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<ReportBloc, ReportState>(builder: (context, state) {
              if (state is ReportFailure) {
                return Center(child: Text(state.error));
              } else if (state is ReportLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ReportSuccess) {
                return Expanded(
                    child: ListView.builder(
                        itemCount: state.foodReports.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => BookedPlaceCard(
                              name: state.foodReports[index].meal,
                              date: state.foodReports[index].foodId,
                              image:
                                  state.foodReports[index].meal == "breakfast"
                                      ? 'assets/breakfast.jpg'
                                      : state.foodReports[index].meal == "lunch"
                                          ? 'assets/lunch.jpg'
                                          : 'assets/dinner.jpg',
                              totalPerson: state.foodReports[index].totalPerson,
                            )));
              }
              return const Center(child: Text('No Data'));
            })
          ],
        ));
  }
}

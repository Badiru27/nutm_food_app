import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutm_food_app/features/report/bloc/report_bloc.dart';
import 'package:nutm_food_app/shared/app_button.dart';
import 'package:nutm_food_app/shared/app_date_input_field.dart';
import 'package:nutm_food_app/shared/app_dropdown.dart';
import 'package:nutm_food_app/themes/app_theme.dart';
import 'package:nutm_food_app/util/validator.dart';

class ReportFilterWidget extends StatelessWidget {
  const ReportFilterWidget({Key? key}) : super(key: key);
  static const vendors = ['breakfast', 'lunch', 'dinner'];
  static final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String? selectedVendor;
    DateTime? selectedDate;

    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Text(
                'Filter food report',
                style: AppTheme.textTheme.headline4,
              ),
              const SizedBox(height: 30),
              AppDropDown(
                label: 'Vendor',
                name: "Select vendor",
                items: vendors,
                onSaved: (value) {},
                onChanged: (value) {
                  selectedVendor = value;
                },
              ),
              const SizedBox(height: 20),
              AppDatePicker(
                  label: 'Date',
                  validator: context.validateFieldNotNull,
                  onChanged: (value) {
                    selectedDate = value;
                  }),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: AppButton(
                    title: 'Get Report',
                    onButtonTapped: () {
                      if (_formKey.currentState!.validate()) {
                        if (selectedVendor != null) {
                          BlocProvider.of<ReportBloc>(context).add(
                              FetchVendorMonthReportFromApi(
                                  vendor: selectedVendor!,
                                  month: selectedDate!));
                            Navigator.of(context).pop();
                          return;
                        }
                        BlocProvider.of<ReportBloc>(context)
                            .add(FetchMonthReportFromApi(month: selectedDate!));
                        Navigator.of(context).pop();
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

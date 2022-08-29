import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nutm_food_app/features/report/model/report.dart';
import 'package:nutm_food_app/service/food_report_service.dart';
import 'package:nutm_food_app/util/formatter.dart';

part 'report_event.dart';
part 'report_state.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  final FoodReportService _foodReportService;

  ReportBloc({required FoodReportService foodReportService})
      : _foodReportService = foodReportService,
        super(ReportInitial()) {
    on<LoadReportPageWithCurrentMonth>(_onLoadReportPageWithCurrentMonth);
    on<FetchMonthReportFromApi>(_onFetchMonthReportFromApi);
    on<FetchVendorMonthReportFromApi>(_onFetchVendorMonthReportFromApi);
  }

  FutureOr<void> _onLoadReportPageWithCurrentMonth(
      LoadReportPageWithCurrentMonth event, Emitter<ReportState> emit) async {
    emit(ReportLoading());
    final month = AppFormatter.monthYearFormatter.format(DateTime.now());

    final report = await _foodReportService.getAllMonthFoodReport(month);
    if (report.isNotEmpty) {
      emit(ReportSuccess(foodReports: report.reversed.toList()));
    } else {
      emit(const ReportFailure(error: "No report found"));
    }
  }

  FutureOr<void> _onFetchMonthReportFromApi(
      FetchMonthReportFromApi event, Emitter<ReportState> emit) async {
    emit(ReportLoading());
    final month = AppFormatter.monthYearFormatter.format(event.month);
    final report = await _foodReportService.getAllMonthFoodReport(month);
    if (report.isNotEmpty) {
      emit(ReportSuccess(foodReports: report.reversed.toList()));
    } else {
      emit(const ReportFailure(error: "No report found"));
    }
  }

  FutureOr<void> _onFetchVendorMonthReportFromApi(
      FetchVendorMonthReportFromApi event, Emitter<ReportState> emit) async {
    emit(ReportLoading());
    final month = AppFormatter.monthYearFormatter.format(event.month);
    final report = await _foodReportService.getAllVendorMonthFoodReport(
        month, event.vendor);
    if (report.isNotEmpty) {
      emit(ReportSuccess(foodReports: report.reversed.toList()));
    } else {
      emit(const ReportFailure(error: "No report found"));
    }
  }
}

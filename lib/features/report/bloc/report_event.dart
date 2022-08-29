part of 'report_bloc.dart';

abstract class ReportEvent extends Equatable {
  const ReportEvent();

  @override
  List<Object> get props => [];
}

class ReportInit extends ReportEvent {}

class LoadReportPageWithCurrentMonth extends ReportEvent {}

class FetchVendorMonthReportFromApi extends ReportEvent {
  final String vendor;
  final DateTime month;
  const FetchVendorMonthReportFromApi(
      {required this.vendor, required this.month});

  @override
  List<Object> get props => [vendor, month];
}

class FetchMonthReportFromApi extends ReportEvent {
  final DateTime month;
  const FetchMonthReportFromApi({required this.month});

  @override
  List<Object> get props => [month];
}

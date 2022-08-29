part of 'report_bloc.dart';

abstract class ReportState extends Equatable {
  const ReportState();

  @override
  List<Object> get props => [];
}

class ReportInitial extends ReportState {}

class ReportLoading extends ReportState {}

class ReportFailure extends ReportState {
  final String error;
  const ReportFailure({required this.error});
  @override
  List<Object> get props => [error];
}

class ReportSuccess extends ReportState {
  final List<FoodReport> foodReports;
  const ReportSuccess({required this.foodReports});
  @override
  List<Object> get props => [foodReports];
}

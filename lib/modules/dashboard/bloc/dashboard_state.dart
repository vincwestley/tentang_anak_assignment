part of 'dashboard_bloc.dart';

abstract class DashboardState {}

class DashboardInitial extends DashboardState {}

class OnLoadingGetFruits extends DashboardState {}

class OnErrorGetFruits extends DashboardState {
  final int? errorCode;
  final String? errorMessage;

  OnErrorGetFruits({this.errorCode, this.errorMessage});
}

class OnSuccessGetFruits extends DashboardState {
  FruitsModel data;

  OnSuccessGetFruits({required this.data});
}

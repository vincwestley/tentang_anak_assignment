import 'package:flutter/material.dart';
import 'package:flutter_take_home_test/modules/dashboard/bloc/dashboard_bloc.dart';

class FruitsErrorWidget extends StatelessWidget {
  final DashboardBloc dashboardBloc;
  final String errorMessage;

  const FruitsErrorWidget({
    Key? key,
    required this.dashboardBloc,
    required this.errorMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          dashboardBloc.add(GetFruits());
        },
        child: Text("$errorMessage, Click to try again!"),
      ),
    );
  }
}

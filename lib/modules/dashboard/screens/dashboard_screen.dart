import 'package:flutter/material.dart';
import 'package:flutter_take_home_test/lib.dart';
import 'package:flutter_take_home_test/modules/dashboard/bloc/rx_dashboard_bloc.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // final DashboardBloc _dashboardBloc = DashboardBloc();

  @override
  void initState() {
    // _dashboardBloc.add(GetFruits());
    rxDashboardBloc.getFruits();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'Dashboard'),
      body: _buildDashboard(),
    );
  }

  Widget _buildDashboard() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: StreamBuilder(
        stream: rxDashboardBloc.fruitsLoading,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot == true) {
            return const FruitsLoaderWidget();
          } else {
            return StreamBuilder(
              stream: rxDashboardBloc.fruits,
              builder: (context, AsyncSnapshot<FruitsModel> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const FruitsLoaderWidget();
                } else {
                  return FruitCardsWidget(data: snapshot.data?.data);
                }
              },
            );
          }
        },
      ),
    );
  }

  // Widget _buildDashboard2() {
  //   return Container(
  //     padding: const EdgeInsets.all(16.0),
  //     child: BlocProvider(
  //       create: (_) => _dashboardBloc,
  //       child: BlocConsumer<DashboardBloc, DashboardState>(
  //         listener: (context, state) {},
  //         builder: (context, state) {
  //           if (state is OnLoadingGetFruits) {
  //             return const FruitsLoaderWidget();
  //           } else if (state is OnSuccessGetFruits) {
  //             return FruitCardsWidget(data: state.data.data);
  //           } else if (state is OnErrorGetFruits) {
  //             return FruitsErrorWidget(
  //               dashboardBloc: _dashboardBloc,
  //               errorMessage: state.errorMessage ?? dioErrorMessage,
  //             );
  //           }
  //
  //           return const SizedBox();
  //         },
  //       ),
  //     ),
  //   );
  // }
}

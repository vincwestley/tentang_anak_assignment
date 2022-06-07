import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_take_home_test/lib.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final FruitsService _fruitsService = FruitsService();

  DashboardBloc() : super(DashboardInitial()) {
    on<GetFruits>(_getFruits);
  }

  Future<void> _getFruits(
    DashboardEvent event,
    Emitter<DashboardState> emit,
  ) async {
    emit(OnLoadingGetFruits());

    try {
      var res = await _fruitsService.getFruits();

      if (res.statusCode == 200) {
        var data = FruitsModel.fromJson(res.data);
        emit(OnSuccessGetFruits(data: data));
      } else {
        emit(OnErrorGetFruits(
            errorCode: res.statusCode, errorMessage: res.statusMessage));
      }
    } catch (e) {
      print(e);
      emit(OnErrorGetFruits(errorMessage: dioErrorMessage));
    }
  }
}

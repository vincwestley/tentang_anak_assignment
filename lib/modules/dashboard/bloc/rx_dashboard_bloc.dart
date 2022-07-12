import 'package:flutter_take_home_test/lib.dart';
import 'package:rxdart/subjects.dart';

class RxDashboardBloc {
  final FruitsService _fruitsService = FruitsService();

  final _fruits = BehaviorSubject<FruitsModel>();
  final _fruitsLoading = BehaviorSubject<bool>();

  get fruits => _fruits.stream;
  get fruitsLoading => _fruitsLoading.stream;

  Future<void> getFruits() async {
    _fruitsLoading.sink.add(true);
    try {
      var res = await _fruitsService.getFruits();
      var data = FruitsModel.fromJson(res.data);
      _fruits.sink.add(data);
    } catch (e) {
      print(e);
    }

    _fruitsLoading.sink.add(false);
  }
}

final rxDashboardBloc = RxDashboardBloc();

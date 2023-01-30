import 'package:bloc/bloc.dart';
import 'package:charlie777/network_service/history_network_service.dart';
import 'package:meta/meta.dart';

import '../../models/history_model.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(HistoryInitial()) {
    HistoryNetworkService historyNetworkService = HistoryNetworkService();
    on<HistoryEvent>((event, emit) async {
      try {
        if (event is GetHistoryData) {
          emit(HistoryLoading());
          List<Historymodel> data = await historyNetworkService.getHistoryData();
          emit(HistoryLoded(data: data));
        }
      } catch (e) {
        emit(HistoryError());
      }
    });
  }
}

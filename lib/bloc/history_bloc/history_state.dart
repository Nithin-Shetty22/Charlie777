part of 'history_bloc.dart';

@immutable
abstract class HistoryState {}

class HistoryInitial extends HistoryState {}

class HistoryLoading extends HistoryState {}

class HistoryLoded extends HistoryState {
  List<Historymodel> data;
  HistoryLoded({required this.data});
}

class HistoryError extends HistoryState {}

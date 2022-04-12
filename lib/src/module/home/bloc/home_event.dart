part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object> get props => [];
}

class FetchHomeDetails extends HomeEvent {
  @override
  List<Object> get props => [];
}

class FetchHomeTraddableDetails extends HomeEvent {
  @override
  List<Object> get props => [];
}
class FetchHomeGainersDetails extends HomeEvent {
  @override
  List<Object> get props => [];
}
class FetchHomeLooserDetails extends HomeEvent {
  @override
  List<Object> get props => [];
}
class GlobalSearchEvent extends HomeEvent {
  final String? keyword;
  const GlobalSearchEvent({
    @required this.keyword,
  });

  @override
  List<Object> get props => [keyword!];

  @override
  String toString() => 'GlobalSearchEvent { keyword: $keyword}';
}



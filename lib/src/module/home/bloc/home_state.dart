part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class SearchLoading extends HomeState {}

class FetchHomeDetailsSuccess extends HomeState {
  // ignore: prefer_typing_uninitialized_variables
  final obj;
  const FetchHomeDetailsSuccess({this.obj});
  FetchHomeDetailsSuccess copyWith({final obj}) {
    return FetchHomeDetailsSuccess(obj: obj ?? this.obj);
  }

  @override
  List<Object> get props => [];
}
class FetchLocalHomeDetailsSuccess extends HomeState {
  // ignore: prefer_typing_uninitialized_variables
  final obj;
  const FetchLocalHomeDetailsSuccess({this.obj});
  FetchLocalHomeDetailsSuccess copyWith({final obj}) {
    return FetchLocalHomeDetailsSuccess(obj: obj ?? this.obj);
  }

  @override
  List<Object> get props => [];
}
class FetchHomeTraddableDetailsSuccess extends HomeState {
  final obj;
  const FetchHomeTraddableDetailsSuccess({this.obj});
  FetchHomeTraddableDetailsSuccess copyWith({final obj}) {
    return FetchHomeTraddableDetailsSuccess(obj: obj ?? this.obj);
  }

  @override
  List<Object> get props => [];
}
class FetchHomeGainersDetailsSuccess extends HomeState {
  final obj;
  const FetchHomeGainersDetailsSuccess({this.obj});
  FetchHomeGainersDetailsSuccess copyWith({final obj}) {
    return FetchHomeGainersDetailsSuccess(obj: obj ?? this.obj);
  }

  @override
  List<Object> get props => [];
}
class FetchHomeLooserDetailsSuccess extends HomeState {
  final obj;
  const FetchHomeLooserDetailsSuccess({this.obj});
  FetchHomeLooserDetailsSuccess copyWith({final obj}) {
    return FetchHomeLooserDetailsSuccess(obj: obj ?? this.obj);
  }

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class GlobalSearchSuccess extends HomeState {
  List<CoinList> obj = [];
   GlobalSearchSuccess({required this.obj});
  GlobalSearchSuccess copyWith({final obj}) {
    return GlobalSearchSuccess(obj: obj ?? this.obj);
  }

  @override
  List<Object> get props => [];
}

class HomeErrorReceived extends HomeState {
  // ignore: prefer_typing_uninitialized_variables
  final err;
  const HomeErrorReceived({this.err});
  HomeErrorReceived copyWith({final err}) {
    return HomeErrorReceived(err: err ?? this.err);
  }

  @override
  List<Object> get props => [err];
}

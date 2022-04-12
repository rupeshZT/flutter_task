import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_task_esp/src/globals.dart';
import 'package:flutter_task_esp/src/module/home/modal/coin_list.dart';
import 'package:flutter_task_esp/src/sevices/api_service.dart';
import 'package:flutter_task_esp/src/sevices/api_service_modal.dart';
part 'home_state.dart';
part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial());
  final DbServices _dbServices = DbServices();

  HomeState get initialState => HomeInitial();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is FetchHomeDetails) {
      try {
        if (Globals.wholeList.isEmpty) {
          yield HomeLoading();
        } else {
          yield FetchLocalHomeDetailsSuccess(obj: Globals.wholeList);
        }

        final data = await fetchHomeDetails();

        yield FetchHomeDetailsSuccess(obj: data);
      } catch (e) {
        yield HomeErrorReceived(err: e);
      }
    }
    if (event is FetchHomeTraddableDetails) {
      try {
        List<CoinList> data = [];
        for (var i = 0; i < Globals.wholeList.length; i++) {
          if (Globals.wholeList[i].coinType!.contains('Tradable')) {
            data.add(Globals.wholeList[i]);
          }
        }
        yield FetchHomeTraddableDetailsSuccess(obj: data);
      } catch (e) {
        yield HomeErrorReceived(err: e);
      }
    }
    if (event is FetchHomeGainersDetails) {
      try {
        List<CoinList> data = [];
        for (var i = 0; i < Globals.wholeList.length; i++) {
          if (Globals.wholeList[i].percentChange24H!.contains('-')) {
          } else {
            data.add(Globals.wholeList[i]);
          }
        }
        yield FetchHomeGainersDetailsSuccess(obj: data);
      } catch (e) {
        yield HomeErrorReceived(err: e);
      }
    }
    if (event is FetchHomeLooserDetails) {
      try {
        List<CoinList> data = [];
        for (var i = 0; i < Globals.wholeList.length; i++) {
          if (Globals.wholeList[i].percentChange24H!.contains('-')) {
            data.add(Globals.wholeList[i]);
          }
        }
        yield FetchHomeLooserDetailsSuccess(obj: data);
      } catch (e) {
        yield HomeErrorReceived(err: e);
      }
    }

    if (event is GlobalSearchEvent) {
      try {
        List<CoinList> data = [];
        yield SearchLoading();
        if (event.keyword!.isNotEmpty) {
          for (var i = 0; i < Globals.wholeList.length; i++) {
            if (Globals.wholeList[i].name!.contains(event.keyword!) ||
                Globals.wholeList[i].currencySymbol!.contains(event.keyword!) ||
                Globals.wholeList[i].coinType!.contains(event.keyword!)) {
              data.add(Globals.wholeList[i]);
            }
          }
        }

        yield GlobalSearchSuccess(
          obj: data,
        );
      } catch (e) {
        yield HomeErrorReceived(err: e);
      }
    }
  }

  Future fetchHomeDetails() async {
    try {
      final ResponseModel response = await _dbServices.postapi(
          Uri.encodeFull('get_coinlist_home'),
          body: {"user_id": "12", "currency": "USD", "type": "All"});

      if (response.statusCode == 200) {
        List<CoinList> _list = response.data['data']
            .map<CoinList>((i) => CoinList.fromJson(i))
            .toList();
        Globals.wholeList.addAll(_list);

        return _list;
      }
    } catch (e) {
      throw (e);
    }
  }

 
}

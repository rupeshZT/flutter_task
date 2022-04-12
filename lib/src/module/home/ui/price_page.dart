import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_esp/src/module/home/bloc/home_bloc.dart';
import 'package:flutter_task_esp/src/module/home/modal/coin_list.dart';
import 'package:flutter_task_esp/src/widget/common_list.dart';

class PricePage extends StatefulWidget {
  const PricePage({Key? key}) : super(key: key);

  @override
  State<PricePage> createState() => _PricePageState();
}

class _PricePageState extends State<PricePage> {
  final HomeBloc _homeBloc = HomeBloc();
  @override
  void initState() {
    super.initState();
    _homeBloc.add(FetchHomeDetails());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<HomeBloc, HomeState>(
            bloc: _homeBloc,
            builder: (context, state) {
              if (state is HomeLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              } else if (state is FetchLocalHomeDetailsSuccess) {
                return Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    _headerSheet('All'),
                    _coinList(state.obj)
                  ],
                );
              } else if (state is FetchHomeDetailsSuccess) {
                return Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    _headerSheet('All'),
                    _coinList(state.obj)
                  ],
                );
              } else if (state is FetchHomeTraddableDetailsSuccess) {
                return Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    _headerSheet('Tradable'),
                    _coinList(state.obj)
                  ],
                );
              } else if (state is FetchHomeLooserDetailsSuccess) {
                return Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    _headerSheet('Looser'),
                    _coinList(state.obj)
                  ],
                );
              } else if (state is FetchHomeGainersDetailsSuccess) {
                return Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    _headerSheet('Gainers'),
                    _coinList(state.obj)
                  ],
                );
              }

              return Container();
            }));
  }

  Widget _headerSheet(type) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.14,
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), topLeft: Radius.circular(20)),
      ),
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text(
                'Markets',
                style: Theme.of(context).textTheme.headline6,
              ),
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.grey,
                child: Center(
                  child: Icon(
                    Icons.ac_unit,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _headerButton('All', () {
                _homeBloc.add(FetchHomeDetails());
              }, type == 'All' ? Colors.purple : Colors.grey),
              _headerButton('Tradable', () {
                _homeBloc.add(FetchHomeTraddableDetails());
              }, type == 'Tradable' ? Colors.purple : Colors.grey),
              _headerButton('Gainers', () {
                _homeBloc.add(FetchHomeGainersDetails());
              }, type == 'Gainers' ? Colors.purple : Colors.grey),
              _headerButton('Looser', () {
                _homeBloc.add(FetchHomeLooserDetails());
              }, type == 'Looser' ? Colors.purple : Colors.grey)
            ],
          )
        ],
      ),
    );
  }

  Widget _coinList(List<CoinList> data) {
    return CommonList(data: data);
  }

  Widget _headerButton(String title, onTap, color) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Text(title),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_esp/src/widget/back_button_widget.dart';
import 'package:flutter_task_esp/src/module/home/bloc/home_bloc.dart';
import 'package:flutter_task_esp/src/widget/common_list.dart';
import 'package:flutter_task_esp/src/widget/debouncer.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    Key? key,
  }) : super(key: key);
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _controller = TextEditingController();
  final HomeBloc _homeBloc = HomeBloc();
  final _debouncer = Debouncer(milliseconds: 500);

  onItemChanged(String value) {
    _debouncer.run(() {
      _homeBloc.add(GlobalSearchEvent(keyword: value));
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
  }

  Widget _buildSearchbar() {
    return SizedBox(
      height: 50,
      child: Container(
          width: MediaQuery.of(context).size.width * 1,
          // padding: ,
          child: TextFormField(
            style: TextStyle(color: Colors.white),
            // focusNode: myFocusNode,
            controller: _controller,
            cursorColor: Colors.white,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary, width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.secondary, width: 2),
              ),
              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.white),
              fillColor: Colors.white,
              prefixIcon: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
            onChanged: onItemChanged,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          elevation: 0.0,
          leading: BackButtonWidget(),
          centerTitle: true,

          // )
        ),
        body: Container(
          child: Column(mainAxisSize: MainAxisSize.max, children: [
            // _buildHeading(),

            _buildSearchbar(),
            BlocBuilder<HomeBloc, HomeState>(
                bloc: _homeBloc,
                builder: (context, state) {
                  if (state is GlobalSearchSuccess) {
                    return state.obj.isNotEmpty
                        ? CommonList(
                            data: state.obj,
                          )
                        : Center(
                            child: _controller.text.isNotEmpty
                                ? Text('No Data Found')
                                : Text('Search Details'));
                  }
                  return Container();
                })
          ]),
        ));
  }
}

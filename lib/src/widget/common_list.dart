import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_esp/src/module/home/modal/coin_list.dart';

// ignore: must_be_immutable
class CommonList extends StatefulWidget {
  List<CoinList> data;
  CommonList({Key? key, required this.data}) : super(key: key);

  @override
  State<CommonList> createState() => _CommonListState();
}

class _CommonListState extends State<CommonList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: widget.data.length,
        separatorBuilder: (context, index) {
          return Container(
            color: Colors.grey,
            height: 1,
            width: MediaQuery.of(context).size.width,
          );
        },
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              radius: 18,
              child: CachedNetworkImage(
                imageUrl: widget.data[index].logo!,
              ),
            ),
            title: Text(widget.data[index].currencySymbol ?? ''),
            subtitle: Row(
              children: [
                Text(
                  widget.data[index].name!,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(color: Colors.grey, fontSize: 12),
                ),
                Icon(
                  Icons.arrow_right,
                  color: Colors.white,
                ),
                Text(
                  widget.data[index].coinType!,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(color: Colors.grey, fontSize: 12),
                )
              ],
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${widget.data[index].currencySymbol ?? ''}${widget.data[index].price!.split('.')[0]}.${widget.data[index].price!.split('.')[1].substring(0, 3)}',
                ),
                Text(
                  '${widget.data[index].percentChange24H}',
                  style: TextStyle(
                      color: widget.data[index].percentChange24H!.contains('-')
                          ? Colors.red
                          : Colors.green),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

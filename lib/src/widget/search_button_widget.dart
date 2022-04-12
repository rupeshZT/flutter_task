
import 'package:flutter/material.dart';
import 'package:flutter_task_esp/src/module/home/ui/search.dart';

class SearchButtonWidget extends StatelessWidget {
  final String? language;
  const SearchButtonWidget({
    Key? key,
    required this.language,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SearchPage(
                       
                      )));
        },
        icon: Icon(
          Icons.search
        ));
  }
}

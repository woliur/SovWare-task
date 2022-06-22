import 'package:flutter/material.dart';
import 'package:sovware/values/color_utils.dart';

class EmptyView extends StatelessWidget {
  final String message;
  final VoidCallback onTap;

  const EmptyView({Key? key, required this.message, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: InkWell(
            onTap: () {
              onTap();
            },
            child: Text(
              message,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: ColorUtils.blue,fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
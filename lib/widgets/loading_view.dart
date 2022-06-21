import 'package:flutter/material.dart';
import 'package:sovware/values/color_utils.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(color: ColorUtils.blue));
  }
}

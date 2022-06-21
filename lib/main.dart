import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:sovware/screens/repoList/list_view.dart';
import 'package:sovware/values/color_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SovWare App',
        theme: ThemeData(
            primaryColor: ColorUtils.primary,
            appBarTheme: AppBarTheme(
              color: ColorUtils.primary,
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.white),
            )
        ),
        home: const RepoList(),
      ),
    );
  }
}

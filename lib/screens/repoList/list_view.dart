import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sovware/screens/repoList/single_item.dart';
import 'package:sovware/values/color_utils.dart';
import 'package:sovware/values/string.dart';
import 'package:sovware/widgets/loading_view.dart';

import 'list_provider.dart';

class RepoList extends StatelessWidget {
  const RepoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RepoListProvider(context),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(StringAsset.listTitle),
        ),
          backgroundColor: ColorUtils.primary,
          body: Consumer<RepoListProvider>(builder: (context, value, child) => value.loading ? LoadingView() : _mainView(value),)),
    );
  }

  Widget _mainView(RepoListProvider provider){
    return ListView.builder(
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) => SingleItem(items: provider.repoList[index], onTap: () {provider.navigateToDetails(provider.repoList[index]);},),
    );
  }
}

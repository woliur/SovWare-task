import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sovware/db/itemModel.dart';
import 'package:sovware/models/git_repo_response.dart';
import 'package:sovware/screens/repoDetails/details_view.dart';
import 'package:sovware/utils/http_client.dart';
import 'package:sovware/utils/network.dart';
import 'package:sovware/utils/toastutils.dart';
import 'package:sovware/utils/urls.dart';
import 'package:sovware/values/string.dart';

import '../../main.dart';

class RepoListProvider extends ChangeNotifier {

  List<DbItems> repoList = [];
  bool loading = true;
  bool hasNetwork = true;
  bool sort = true;
  BuildContext? context;

  RepoListProvider(BuildContext contx) {
    context = contx;
    getRepoList();
  }


  Future getRepoList() async {
    loading = true;
    notifyListeners();
    hasNetwork = await Network.instance.checkNetwork();
    if(hasNetwork){
      getRepoListFromApi();
    } else {
      repoList = objectbox.store.box<DbItems>().getAll();
      loading = false;
      ToastUtils.showInfo(StringAsset.internetError);
      notifyListeners();
    }
  }

  Future getRepoListFromApi() async {
    try {
      var response = await HttpClient.get(
        Urls.repoList(StringAsset.q),
        null,
      );
      GitRepoResponse _response = GitRepoResponse.fromJson(response);
      if (_response.items != null && _response.items!.isNotEmpty) {
        objectbox.store.box<DbItems>().removeAll();
        for (var element in _response.items!) {
          var items = DbItems(
              repoId: element.repoId,
              name: element.name,
              login: element.owner!.login,
              avatarUrl: element.owner!.avatarUrl,
              description: element.description,
              pushedAt: element.pushedAt,
              updatedAt: element.updatedAt,
              stargazersCount: element.stargazersCount);
          objectbox.store.box<DbItems>().put(items);
          repoList.add(items);
        }
        loading = false;
        notifyListeners();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void sortRepo(){
    if(sort){
      sortByStarDescending();
    } else {
      sortByStarAscending();
    }
  }

  void sortByStarAscending(){
    loading = true;
    notifyListeners();
    if(repoList.isNotEmpty){
      repoList.sort((b, a) => a.stargazersCount!.compareTo(b.stargazersCount!));
    }
    loading = false;
    sort = true;
    notifyListeners();
  }

  void sortByStarDescending(){
    loading = true;
    notifyListeners();
    if(repoList.isNotEmpty){
      repoList.sort((a, b) => a.stargazersCount!.compareTo(b.stargazersCount!));
    }
    loading = false;
    sort = false;
    notifyListeners();
  }

  void navigateToDetails(DbItems item, bool hasNetwork){
    Navigator.of(context!).push(MaterialPageRoute(builder: (context) => Details(items: item,hasNetwork: hasNetwork,),));
  }

}
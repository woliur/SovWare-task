import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sovware/models/git_repo_response.dart';
import 'package:sovware/screens/repoDetails/details_view.dart';
import 'package:sovware/utils/http_client.dart';
import 'package:sovware/utils/urls.dart';
import 'package:sovware/values/string.dart';

// dataList = objectbox.store.box<WishListModel>().getAll();
// var cartListBox = objectbox.store.box<AddToCartModel>();
// cartListBox.put(_dataList[index]);

class RepoListProvider extends ChangeNotifier {

  List<Items> repoList = [];
  bool loading = true;
  BuildContext? context;

  RepoListProvider(BuildContext contx) {
    context = contx;
    getRepoList(contx);
  }

  Future getRepoList(BuildContext context) async {
    try {
      var response = await HttpClient.get(
        Urls.repoList(StringAsset.q),
        null,
      );
      GitRepoResponse _response = GitRepoResponse.fromJson(response);
      if (_response.items != null && _response.items!.isNotEmpty) {
        repoList = _response.items!;
        loading = false;
        notifyListeners();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void navigateToDetails(Items item){
    Navigator.of(context!).push(MaterialPageRoute(builder: (context) => Details(items: item,),));
  }

}
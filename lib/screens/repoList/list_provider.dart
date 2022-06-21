import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sovware/models/git_repo_response.dart';
import 'package:sovware/utils/http_client.dart';
import 'package:sovware/utils/urls.dart';
import 'package:sovware/values/string.dart';

class RepoListProvider extends ChangeNotifier {

  List<Items> repoList = [];
  bool loading = true;

  RepoListProvider(BuildContext context) {
    getRepoList(context);
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

}
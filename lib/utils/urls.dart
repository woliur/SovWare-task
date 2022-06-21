class Urls {

  static const String _baseUrl = "https://api.github.com/";

  // static String repoList(query) => _baseUrl + "search/repositories?q=Flutter&sort=stars&order=desc&per_page=50";
  static String repoList(String query) => _baseUrl + "search/repositories?q=$query&sort=stars&order=desc&per_page=50";

  static String userProducts(int id) => _baseUrl + "api/v1/users/$id/products";
}

class Urls {

  static const String _baseUrl = "https://api.github.com/";
  static String commitList = _baseUrl + "repos/flutter/flutter/commits";
  static String commitUserProfile = _baseUrl + "users/blasten";

  static String allProducts() => _baseUrl + "api/v1/products";

  static String userProducts(int id) => _baseUrl + "api/v1/users/$id/products";
}

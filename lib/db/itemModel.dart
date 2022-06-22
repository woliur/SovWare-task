import 'package:objectbox/objectbox.dart';

@Entity()
class DbItems {
  int? id;
  int? repoId;
  String? name;
  String? avatarUrl;
  String? login;
  String? description;
  String? updatedAt;
  String? pushedAt;
  int? stargazersCount;

  DbItems({this.id,
    this.repoId,
    this.name,
    this.avatarUrl,
    this.login,
    this.description,
    this.updatedAt,
    this.pushedAt,
    this.stargazersCount,});
}
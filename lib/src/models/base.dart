abstract class BaseEntity {
  const BaseEntity();

  Map<String, dynamic> toJson();

  @override
  String toString() => toJson().toString();
}

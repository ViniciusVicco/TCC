abstract class Entity {
  Entity fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson(Entity entity);
}

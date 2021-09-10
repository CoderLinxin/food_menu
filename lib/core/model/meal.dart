// 食物的数据模型

import 'dart:convert';

LXMealModel lxMealModelFromJson(String str) =>
    LXMealModel.fromJson(json.decode(str));

String lxMealModelToJson(LXMealModel data) => json.encode(data.toJson());

List<String> _complexes = ['简单', '中等', '复杂'];

class LXMealModel {
  LXMealModel({
    required this.id,
    required this.categories,
    required this.title,
    required this.affordability,
    required this.complexity,
    required this.complexStr,
    required this.imageUrl,
    required this.duration,
    required this.ingredients,
    required this.steps,
    required this.isGlutenFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.isLactoseFree,
  });

  String id;
  List<String> categories;
  String title;
  int affordability;
  int complexity;
  String complexStr; // 食物制作的复杂程度（根据complexity划分）
  String imageUrl;
  int duration;
  List<String> ingredients;
  List<String> steps;
  bool isGlutenFree;
  bool isVegan;
  bool isVegetarian;
  bool isLactoseFree;

  factory LXMealModel.fromJson(Map<String, dynamic> json) => LXMealModel(
        id: json["id"],
        categories: List<String>.from(json["categories"].map((x) => x)),
        title: json["title"],
        affordability: json["affordability"],
        complexity: json["complexity"],
        complexStr: _complexes[json["complexity"]],
        imageUrl: json["imageUrl"],
        duration: json["duration"],
        ingredients: List<String>.from(json["ingredients"].map((x) => x)),
        steps: List<String>.from(json["steps"].map((x) => x)),
        isGlutenFree: json["isGlutenFree"],
        isVegan: json["isVegan"],
        isVegetarian: json["isVegetarian"],
        isLactoseFree: json["isLactoseFree"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "title": title,
        "affordability": affordability,
        "complexity": complexity,
        "imageUrl": imageUrl,
        "duration": duration,
        "ingredients": List<dynamic>.from(ingredients.map((x) => x)),
        "steps": List<dynamic>.from(steps.map((x) => x)),
        "isGlutenFree": isGlutenFree,
        "isVegan": isVegan,
        "isVegetarian": isVegetarian,
        "isLactoseFree": isLactoseFree,
      };
}

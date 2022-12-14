import 'dart:convert';

import 'package:untitled/models/app_user.dart';
import 'package:untitled/models/category.dart';
import 'package:untitled/models/difficulty.dart';

import 'cuisine.dart';

List<Recipe> recipeFromJson(String str) =>
    List<Recipe>.from(json.decode(str).map((x) => Recipe.fromJson(x)));

String recipeToJson(List<Recipe> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Recipe {
  final int? id;
  final String? languageCode;
  final int? userId;
  final String? name;
  final String? image;
  final int? duration;
  final int? noOfServing;
  final int? difficultyId;
  final int? cuisineId;
  final String? ingredients;
  final String? steps;
  final String? websiteUrl;
  final String? youtubeUrl;
  final int? noOfViews;
  final int? noOfLikes;
  final int? status;
  final String? createdAt;
  final String? updatedAt;
  final AppUser? user;
  final Difficulty? difficulty;
  final Cuisine? cuisine;
  final List<Category>? categories;

  Recipe({
    this.id,
    this.languageCode,
    this.userId,
    this.name,
    this.image,
    this.duration,
    this.noOfServing,
    this.difficultyId,
    this.cuisineId,
    this.ingredients,
    this.steps,
    this.websiteUrl,
    this.youtubeUrl,
    this.noOfViews,
    this.noOfLikes,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.user,
    this.difficulty,
    this.cuisine,
    this.categories,
  });

  Recipe.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        languageCode = json['language_code'] as String?,
        userId = json['userId'] as int?,
        name = json['name'] as String?,
        image = json['image'] as String?,
        duration = json['duration'] as int?,
        noOfServing = json['noOfServing'] as int?,
        difficultyId = json['difficulty_id'] as int?,
        cuisineId = json['cuisine_id'] as int?,
        ingredients = json['ingredients'] as String?,
        steps = json['steps'] as String?,
        categories = json["categories"] != null
            ? (json["categories"] as List)
                .map<Category>((json) => new Category.fromJson(json))
                .toList()
            : null,
        websiteUrl = json['websiteUrl'] as String?,
        youtubeUrl = json['youtubeUrl'] as String?,
        noOfViews = json['noOfViews'] as int?,
        noOfLikes = json['noOfLikes'] as int?,
        status = json['status'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        user = (json['user'] as Map<String, dynamic>?) != null
            ? AppUser.fromJson(json['user'] as Map<String, dynamic>)
            : null,
        difficulty = (json['difficulty'] as Map<String, dynamic>?) != null
            ? Difficulty.fromJson(json['difficulty'] as Map<String, dynamic>)
            : null,
        cuisine = (json['cuisine'] as Map<String, dynamic>?) != null
            ? Cuisine.fromJson(json['cuisine'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'language_code': languageCode,
        'userId': userId,
        'name': name,
        'image': image,
        'duration': duration,
        'noOfServing': noOfServing,
        'difficulty_id': difficultyId,
        "cuisine": cuisine?.toJson(),
        "cuisine_id": cuisineId == null ? null : cuisineId,
        'ingredients': ingredients,
        'steps': steps,
        'websiteUrl': websiteUrl,
        'youtubeUrl': youtubeUrl,
        'noOfViews': noOfViews,
        'noOfLikes': noOfLikes,
        'status': status,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'user': user?.toJson(),
        'difficulty': difficulty?.toJson(),
      };
}

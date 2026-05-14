
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

class RecipeUpload {

  @JsonKey(name: "recipeId")
  final String recipeId;

  @JsonKey(name: "uid")
  final String uid;

  @JsonKey(name: "userName")
  final String userName;

  @JsonKey(name: "userImg")
  final String userImage;

  final String mealName;

  @JsonKey(name: "category")
  final String category;

  @JsonKey(name: "area")
  final String area;

  @JsonKey(name: "tags")
  final String tags;

  @JsonKey(name: "youtubeLink")
  final String youtubeLink;

  @JsonKey(name: "instructions")
  final String instructions;

  @JsonKey(name: "ingredients")
  final List<Map<String, String>>
  ingredients;

  @JsonKey(name: "mealImageUrl")
  final String mealImageUrl;

  @JsonKey(name: "videoUrl")
  final String videoUrl;

  @JsonKey(name: "status")
  final String status;

  @JsonKey(name: "createdAt")
  final int createdAt;

  @JsonKey(name: "updatedAt")
  final int updatedAt;

  RecipeUpload({

    String? recipeId,

    this.uid = "",

    this.userName = "",

    this.userImage = "",

    this.mealName = "",

    this.category = "",

    this.area = "",

    this.tags = "",

    this.youtubeLink = "",

    this.instructions = "",

    this.ingredients = const [],

    this.mealImageUrl = "",

    this.videoUrl = "",

    this.status = "draft",

    int? createdAt,

    int? updatedAt,
  })

      : recipeId =
      recipeId ??
          const Uuid().v4(),

        createdAt =
            createdAt ??
                DateTime.now()
                    .millisecondsSinceEpoch,

        updatedAt =
            updatedAt ??
                DateTime.now()
                    .millisecondsSinceEpoch;

  factory RecipeUpload.fromJson(
      Map<String, dynamic> json,
      ) {

    return RecipeUpload(

      recipeId:
      json["recipeId"] ?? "",

      uid:
      json["uid"] ?? "",

      userName:
      json["userName"] ?? "",

      userImage:
      json["userImg"] ?? "",

      mealName:
      json["mealName"] ?? "",

      category:
      json["category"] ?? "",

      area:
      json["area"] ?? "",

      tags:
      json["tags"] ?? "",

      youtubeLink:
      json["youtubeLink"] ?? "",

      instructions:
      json["instructions"] ?? "",

      ingredients:
      (json["ingredients"] as List?)

          ?.map(
            (e) =>
        Map<String, String>.from(e),
      )

          .toList()

          ?? [],

      mealImageUrl:
      json["mealImageUrl"] ?? "",

      videoUrl:
      json["videoUrl"] ?? "",

      status:
      json["status"] ?? "draft",

      createdAt:
      json["createdAt"] ?? 0,

      updatedAt:
      json["updatedAt"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {

    return {

      "recipeId":
      recipeId,

      "uid":
      uid,

      "userName":
      userName,

      "userImg":
      userImage,

      "mealName":
      mealName,

      "category":
      category,

      "area":
      area,

      "tags":
      tags,

      "youtubeLink":
      youtubeLink,

      "instructions":
      instructions,

      "ingredients":
      ingredients,

      "mealImageUrl":
      mealImageUrl,

      "videoUrl":
      videoUrl,

      "status":
      status,

      "createdAt":
      createdAt,

      "updatedAt":
      updatedAt,
    };
  }

  RecipeUpload copyWith({

    String? recipeId,

    String? uid,

    String? userName,

    String? userImage,

    String? mealName,

    String? category,

    String? area,

    String? tags,

    String? youtubeLink,

    String? instructions,

    List<Map<String, String>>?
    ingredients,

    String? mealImageUrl,

    String? videoUrl,

    String? status,

    int? createdAt,

    int? updatedAt,
  }) {

    return RecipeUpload(

      recipeId:
      recipeId ??
          this.recipeId,

      uid:
      uid ?? this.uid,

      userName:
      userName ??
          this.userName,

      userImage:
      userImage ??
          this.userImage,

      mealName:
      mealName ??
          this.mealName,

      category:
      category ??
          this.category,

      area:
      area ?? this.area,

      tags:
      tags ?? this.tags,

      youtubeLink:
      youtubeLink ??
          this.youtubeLink,

      instructions:
      instructions ??
          this.instructions,

      ingredients:
      ingredients ??
          this.ingredients,

      mealImageUrl:
      mealImageUrl ??
          this.mealImageUrl,

      videoUrl:
      videoUrl ??
          this.videoUrl,

      status:
      status ??
          this.status,

      createdAt:
      createdAt ??
          this.createdAt,

      updatedAt:
      updatedAt ??
          this.updatedAt,
    );
  }
}
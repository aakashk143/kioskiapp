import 'dart:convert';

import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  String id;
  String name;
  double price;
  String category;
  String description;
  double ratings;
  int quantity;
  List<String> videos;
  List<String> images;
  List<String> suggestions;
  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.description,
    required this.ratings,
    required this.quantity,
    required this.videos,
    required this.images,
    required this.suggestions,
  });

  Product copyWith({
    String? id,
    String? name,
    double? price,
    String? category,
    String? description,
    double? ratings,
    int? quantity,
    List<String>? videos,
    List<String>? images,
    List<String>? suggestions,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      category: category ?? this.category,
      description: description ?? this.description,
      ratings: ratings ?? this.ratings,
      quantity: quantity ?? this.quantity,
      videos: videos ?? this.videos,
      images: images ?? this.images,
      suggestions: suggestions ?? this.suggestions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'category': category,
      'description': description,
      'ratings': ratings,
      'quantity': quantity,
      'videos': videos,
      'images': images,
      'suggestions': suggestions,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as String,
      name: map['name'] as String,
      price: map['price'] as double,
      category: map['category'] as String,
      description: map['description'] as String,
      ratings: map['ratings'] as double,
      quantity: map['quantity'] as int,
      videos: List<String>.from(map['videos'] as List<String>),
      images: List<String>.from(map['images'] as List<String>),
      suggestions: List<String>.from(map['suggestions'] as List<String>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(id: $id, name: $name, price: $price, category: $category, description: $description, ratings: $ratings, quantity: $quantity, videos: $videos, images: $images)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.price == price &&
        other.category == category &&
        other.description == description &&
        other.ratings == ratings &&
        other.quantity == quantity &&
        listEquals(other.videos, videos) &&
        listEquals(other.images, images);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        price.hashCode ^
        category.hashCode ^
        description.hashCode ^
        ratings.hashCode ^
        quantity.hashCode ^
        videos.hashCode ^
        images.hashCode;
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String title;
  final String authername;
  final double rating;
  final int price;
  final String courseSubtitle;
  final Timestamp date;
  final String whatLearn;
  final String courseIncludes;
  final String requirements;
  final String description;
  final String img;
  ProductModel({
    required this.title,
    required this.authername,
    required this.rating,
    required this.price,
    required this.courseSubtitle,
    required this.date,
    required this.whatLearn,
    required this.courseIncludes,
    required this.requirements,
    required this.description,
    required this.img,
  });

  ProductModel copyWith({
    String? title,
    String? authername,
    double? rating,
    int? price,
    String? courseSubtitle,
    Timestamp? date,
    String? whatLearn,
    String? courseIncludes,
    String? requirements,
    String? description,
    String? img,
  }) {
    return ProductModel(
      title: title ?? this.title,
      authername: authername ?? this.authername,
      rating: rating ?? this.rating,
      price: price ?? this.price,
      courseSubtitle: courseSubtitle ?? this.courseSubtitle,
      date: date ?? this.date,
      whatLearn: whatLearn ?? this.whatLearn,
      courseIncludes: courseIncludes ?? this.courseIncludes,
      requirements: requirements ?? this.requirements,
      description: description ?? this.description,
      img: img ?? this.img,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'authername': authername,
      'rating': rating,
      'price': price,
      'courseSubtitle': courseSubtitle,
      'date': date,
      'whatLearn': whatLearn,
      'courseIncludes': courseIncludes,
      'requirements': requirements,
      'description': description,
      'img': img,
    };
  }

  factory ProductModel.fromDoc(DocumentSnapshot doc) {
    return ProductModel(
      title: doc['title'] as String,
      authername: doc['authername'] as String,
      rating: doc['rating'] as double,
      price: doc['price'] as int,
      courseSubtitle: doc['courseSubtitle'] as String,
      date: doc['date'],
      whatLearn: doc['whatLearn'] as String,
      courseIncludes: doc['courseIncludes'] as String,
      requirements: doc['requirements'] as String,
      description: doc['description'] as String,
      img: doc['img'] as String,
    );
  }
}

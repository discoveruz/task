import 'dart:convert';
import 'package:equatable/equatable.dart';

class Pupils extends Equatable {
   Pupils({
    this.students,
    this.marks,
    this.avarage=0.0,
  });

   List<Student>? students;
   List<Mark>? marks;
   double? avarage;

  factory Pupils.fromJson(String str) => Pupils.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pupils.fromMap(Map<String, dynamic> json) => Pupils(
        students:
            List<Student>.from(json["students"].map((x) => Student.fromMap(x))),
        marks: List<Mark>.from(json["marks"].map((x) => Mark.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "students": List<dynamic>.from(students!.map((x) => x.toMap())),
        "marks": List<dynamic>.from(marks!.map((x) => x.toMap())),
      };

  @override
  List<Object?> get props => [students, marks];
}

class Mark extends Equatable {
   Mark({
    this.userId,
    this.score,
  });

   int? userId;
   int? score;

  factory Mark.fromJson(String str) => Mark.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Mark.fromMap(Map<String, dynamic> json) => Mark(
        userId: json["user_id"],
        score: json["score"],
      );

  Map<String, dynamic> toMap() => {
        "user_id": userId,
        "score": score,
      };

  @override
  List<Object?> get props => [userId, score];
}

class Student extends Equatable {
   Student({
    this.id,
    this.name,
    this.score = 0,
  });

   int? id;
   String? name;
   int? score;

  factory Student.fromJson(String str) => Student.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Student.fromMap(Map<String, dynamic> json) => Student(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
      };
  Student copyWith(int? newScore) => Student(
        id: id,
        name: name,
        score: score! + newScore!,
      );

  @override
  List<Object?> get props => [id, name, score];
}

class ErorrModel {
   ErorrModel(this.message);
   String message;
}

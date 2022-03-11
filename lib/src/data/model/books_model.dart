import 'dart:convert';
import 'package:equatable/equatable.dart';

class BookStore extends Equatable {
   BookStore({
    this.books,
    this.sold,
    this.percentage=0,
  });

   List<Book>? books;
   List<Sold>? sold;
   double percentage;

  factory BookStore.fromJson(String str) => BookStore.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BookStore.fromMap(Map<String, dynamic> json) => BookStore(
        books: List<Book>.from(json["books"].map((x) => Book.fromMap(x))),
        sold: List<Sold>.from(json["sold"].map((x) => Sold.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "books": List<dynamic>.from(books!.map((x) => x.toMap())),
        "sold": List<dynamic>.from(sold!.map((x) => x.toMap())),
      };

  @override
  List<Object?> get props => [books, sold];
}

class Book extends Equatable {
   Book({
    this.id,
    this.name,
    this.count = 0,
  });

   int? id;
   String? name;
   int? count;

  factory Book.fromJson(String str) => Book.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Book.fromMap(Map<String, dynamic> json) => Book(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
      };
  Book copyWith({int i = 0}) => Book(id: id, name: name, count: count! + i);

  @override
  List<Object?> get props => [id, name, count];
}

class Sold extends Equatable {
   Sold({
    this.bookId,
    this.date,
  });

   int? bookId;
   DateTime? date;

  factory Sold.fromJson(String str) => Sold.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Sold.fromMap(Map<String, dynamic> json) => Sold(
        bookId: json["book_id"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toMap() => {
        "book_id": bookId,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
      };

  @override
  List<Object?> get props => [bookId, date];
}

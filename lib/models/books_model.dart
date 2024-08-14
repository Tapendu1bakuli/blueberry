class BooksModel {
  List<BooksLists>? data;

  BooksModel({this.data});

  BooksModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <BooksLists>[];
      json['data'].forEach((v) {
        data!.add(new BooksLists.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BooksLists {
  dynamic? id;
  dynamic? year;
  dynamic? title;
  dynamic? handle;
  dynamic? publisher;
  dynamic? iSBN;
  dynamic? pages;

  BooksLists(
      {this.id,
        this.year,
        this.title,
        this.handle,
        this.publisher,
        this.iSBN,
        this.pages});

  BooksLists.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    year = json['Year'];
    title = json['Title'];
    handle = json['handle'];
    publisher = json['Publisher'];
    iSBN = json['ISBN'];
    pages = json['Pages'];
  }
  Map<String, dynamic> toMap() {
    return {
      'book_id': id,
      'Year': year,
      'Title': title,
      'handle': handle,
      'Publisher': publisher,
      'ISBN': iSBN,
      'Pages':pages
      //  'percentage': percentage,
      //'remarks': remarks,
    };
  }
  factory BooksLists.fromMap(Map<String, dynamic> map) {
    return BooksLists(
      id: map['id'],
      year: map['Year'],
      title: map['Title'],
      handle: map['handle'],
      publisher: map['Publisher'],
      iSBN: map['ISBN'],
      pages: map['Pages']
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Year'] = this.year;
    data['Title'] = this.title;
    data['handle'] = this.handle;
    data['Publisher'] = this.publisher;
    data['ISBN'] = this.iSBN;
    data['Pages'] = this.pages;
    return data;
  }
}

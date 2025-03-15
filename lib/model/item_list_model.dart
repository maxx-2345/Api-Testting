class itemListModel {
  List<Products>? products;
  int? total;
  int? skip;
  int? limit;

  itemListModel({this.products, this.total, this.skip, this.limit});

  itemListModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    total = json['total'] as int;
    skip = json['skip'];
    limit = json['limit'] as int;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['skip'] = this.skip;
    data['limit'] = this.limit;
    return data;
  }
}

class Products{
  final int id;
  final List<String> images;
  final String title;
  final String description;
  final double price;
  final double discountPercentage;
  final String category;
  final int stock;
  final String brand;
  // final List tags;


  Products(
  {required this.id,
  required this.images,
  required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.category,
    required this.stock,
    required this.brand
    // required this.tags

  });

  factory Products.fromJson(Map<String,dynamic> json){
    List<String> processedImages = [];
    try{
      if(json['images'] != null){
        processedImages = (json['images'] as List)
            .map((image)=> image != null ? image.toString():'')
            .toList();
      }
    }catch(e){
      processedImages = [];

    }

    return Products(
        id: json['id'] ?? 0,
        images: processedImages,
        title: json['title'] ?? '',
      brand: json['brand'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] as double ?? 0.0,
        discountPercentage: json['discountPercentage'] == null
            ? 0.0
            : (json['discountPercentage'] is int
            ? (json['discountPercentage'] as int).toDouble()
            : json['discountPercentage'] as double
        ),
      category: json['category'] ?? '',
     stock: json['stock'] ?? 0,
      // tags: json['tags'] ?? []
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['images'] = this.images;
    data['brand'] = this.brand;
    data['title'] = this.title;
    data['description']= this.description;
    data['price'] = this.price;
    data['discountPercentage'] = this.discountPercentage;
    data['category'] = this.category;
    data['stock'] = this.stock;
    // data['tags'] = this.tags;
    return data;
  }
}

class Dimensions {
  double? width;
  double? height;
  double? depth;

  Dimensions({this.width, this.height, this.depth});

  Dimensions.fromJson(Map<String, dynamic> json) {
    width = json['width'];
    height = json['height'];
    depth = json['depth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['width'] = this.width;
    data['height'] = this.height;
    data['depth'] = this.depth;
    return data;
  }
}

class Reviews {
  int? rating;
  String? comment;
  String? date;
  String? reviewerName;
  String? reviewerEmail;

  Reviews(
      {this.rating,
        this.comment,
        this.date,
        this.reviewerName,
        this.reviewerEmail});

  Reviews.fromJson(Map<String, dynamic> json) {
    rating = json['rating'];
    comment = json['comment'];
    date = json['date'];
    reviewerName = json['reviewerName'];
    reviewerEmail = json['reviewerEmail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rating'] = this.rating;
    data['comment'] = this.comment;
    data['date'] = this.date;
    data['reviewerName'] = this.reviewerName;
    data['reviewerEmail'] = this.reviewerEmail;
    return data;
  }
}

class Meta {
  String? createdAt;
  String? updatedAt;
  String? barcode;
  String? qrCode;

  Meta({this.createdAt, this.updatedAt, this.barcode, this.qrCode});

  Meta.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    barcode = json['barcode'];
    qrCode = json['qrCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['barcode'] = this.barcode;
    data['qrCode'] = this.qrCode;
    return data;
  }
}

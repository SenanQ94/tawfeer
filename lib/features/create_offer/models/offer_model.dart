class Offer {
  Offer({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.priceType = 'Fixed Price',
    this.offerType = 'I offer',
    this.images = const [],
    this.createdAt,
  });

  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      price: json['price'],
      priceType: json['priceType'],
      offerType: json['offerType'],
      images: List<String>.from(json['images'] ?? []),
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
    );
  }

  String? id;
  String? title;
  String? description;
  String? category;
  double? price;
  String? priceType;
  String? offerType; // "Ich biete" or "Ich suche"
  List<String> images;
  DateTime? createdAt;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'price': price,
      'priceType': priceType,
      'offerType': offerType,
      'images': images,
      'createdAt': createdAt?.toIso8601String(),
    };
  }
}

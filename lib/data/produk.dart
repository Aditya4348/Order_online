class Produk {
  final int id;
  final String title;
  final int price;

  Produk({required this.id, required this.title, required this.price});

  factory Produk.fromJson(Map<String, dynamic> json) {
    return Produk(
      id: json['id'], 
      title: json['title'], 
      price: json['price']);
  }
}

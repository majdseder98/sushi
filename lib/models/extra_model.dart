
class ExtraModel  {
 final String name;
  final String price;
  factory ExtraModel.fromJson(Map<String, dynamic> json) =>
      ExtraModel(name: json['name'], price: json['price']);

  ExtraModel({required this.name, required this.price});
  toMap() => {"name": name, "price": price};
}

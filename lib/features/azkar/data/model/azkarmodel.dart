class Azkarmodel {
  final int id;
  final String text;
  final int count;

  Azkarmodel({required this.id, required this.text, required this.count});

  factory Azkarmodel.fromJson(Map<String, dynamic> json) {
    return Azkarmodel(
      id: json['id'],
      text: json['text'],
      count: json['count'],
    );
  }
}

class Month {
  final int number;
  final String en;
  final String ar;
  final int days;

  Month({
    required this.number,
    required this.en,
    required this.ar,
    required this.days,
  });

  factory Month.fromJson(Map<String, dynamic> json) {
    return Month(
      number: json['number'],
      en: json['en'],
      ar: json['ar'],
      days: json['days'],
    );
  }
}

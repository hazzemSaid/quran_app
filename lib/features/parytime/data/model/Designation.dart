class Designation {
  final String abbreviated;
  final String expanded;

  Designation({
    required this.abbreviated,
    required this.expanded,
  });

  factory Designation.fromJson(Map<String, dynamic> json) {
    return Designation(
      abbreviated: json['abbreviated'],
      expanded: json['expanded'],
    );
  }
}

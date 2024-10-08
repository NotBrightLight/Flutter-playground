class Pdf {
  final String? chapter2;
  final String? chapter5;

  Pdf({this.chapter2, this.chapter5});

  factory Pdf.fromJson(Map<String, dynamic> json) {
    return Pdf(
      chapter2: json['Chapter 2'] ?? 'No Data',
      chapter5: json['Chapter 5'] ?? 'No Data',
    );
  }
}

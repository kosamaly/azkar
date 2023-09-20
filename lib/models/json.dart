class SurahData {
  final int ayahCount;
  final double headerPosition;
  final int juzNumber;
  final String nameArabic;
  final String nameEnglish;
  final String nameTranslation;
  final int number;
  final int pageNumber;
  final String text;

  SurahData({
    required this.text,
    required this.ayahCount,
    required this.headerPosition,
    required this.juzNumber,
    required this.nameArabic,
    required this.nameEnglish,
    required this.nameTranslation,
    required this.number,
    required this.pageNumber,
  });

  factory SurahData.fromJson(Map<String, dynamic> json) {
    return SurahData(
      text: json['text'],
      ayahCount: json['ayahCount'],
      headerPosition: json['headerPosition'],
      juzNumber: json['juzNumber'],
      nameArabic: json['nameArabic'],
      nameEnglish: json['nameEnglish'],
      nameTranslation: json['nameTranslation'],
      number: json['number'],
      pageNumber: json['pageNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'ayahCount': ayahCount,
      'headerPosition': headerPosition,
      'juzNumber': juzNumber,
      'nameArabic': nameArabic,
      'nameEnglish': nameEnglish,
      'nameTranslation': nameTranslation,
      'number': number,
      'pageNumber': pageNumber,
    };
  }
}

class Slide {
  final int id;
  final String url;
  final String gambar;

  Slide({
    required this.id,
    required this.url,
    required this.gambar,
  });
  factory Slide.fromJson(Map<String, dynamic> json) {
    return Slide(
      id: json['id'],
      url: json['url'],
      gambar: json['gambar '],
    );
  }
}

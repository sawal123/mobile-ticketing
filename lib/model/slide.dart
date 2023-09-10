class Slide {
  final int id;
  final String uid;
  final String sort;
  final String title;
  final String gambar;

  Slide({
    required this.id,
    required this.uid,
    required this.sort,
    required this.title,
    required this.gambar,
  });
  factory Slide.fromJson(Map<String, dynamic> json) {
    return Slide(
      id: json['id'],
      uid: json['uid'],
      sort: json['sort'],
      title: json['title'],
      gambar: json['gambar'],
    );
  }
}

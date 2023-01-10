class NoteModel {

  String title ;
  String id ;
  String descreption ;
  int date ;

  NoteModel({required this.title , required this.descreption , required this.date , this.id = ""});

  NoteModel.fromJson(Map<String, Object?> json)
      : this(
    title: json['title']! as String,
    descreption: json['description']! as String,
    date: json['date']! as int,
    id: json['id']! as String,
  );

  Map<String, Object?> toJson() {
    return {
      'title': title,
      'description': descreption,
      'date': date,
      'id': id,
    };
  }

}
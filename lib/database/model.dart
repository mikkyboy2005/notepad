class Note {
  int id;
  String title;
  String content;
  String dateTime;

  Note({this.id, this.title, this.content, this.dateTime});

  Note.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    dateTime = json['dateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    data['dateTime'] = this.dateTime;
    return data;
  }
}


class DadJokesModel {
  final String id;
  final String setup;
  final String punchline;
  final String type;
  final List likes;
  final bool approved;
  final int date;
  final bool? nsfw;
  DadJokesModel(this.id, this.setup, this.punchline, this.type, this.likes,
       this.approved, this.date, this.nsfw);

  factory DadJokesModel.fromJson(Map<String, dynamic> json) => DadJokesModel(
      json['id'] ?? '',
      json['setup'] ?? '',
      json['punchline'] ?? '',
      json['type'],
      json['likes'],
      json['approved'],
      json['date'],
      json['nsfw']);
}

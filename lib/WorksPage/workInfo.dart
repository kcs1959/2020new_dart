import 'package:kcs_2020_shinkan_web/mainWorksView.dart';

class WorkInfo {
  final int id;
  final String title;
  final String head;
  final String author;
  final String faculty;
  final String comment;
  final List<String> image;
  final String link;
  final List<WorkGenre> genres;
  final String tool;
  final String language;
  final String embed;

  const WorkInfo(this.id, this.title, this.head, this.author, this.faculty, this.comment, this.image, this.link, this.genres, this.tool, this.language, {this.embed});
}
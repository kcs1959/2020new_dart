import 'package:kcs_2020_shinkan_web/mainWorksView.dart';

class WorkInfo {
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

  const WorkInfo(this.title, this.head, this.author, this.faculty, this.comment, this.image, this.link, this.genres, this.tool, this.language);
}
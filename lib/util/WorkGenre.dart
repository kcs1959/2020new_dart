enum WorkGenre {
  WEB, AI, UNITY, BLENDER, DTM, OTHERS,
  STUDY, GAME, TOOL, CG, MUSIC
}

extension WorkGenreExtension on WorkGenre {
  String getString() {
    switch(this) {
      case WorkGenre.WEB:
        return "Web";
      case WorkGenre.AI:
        return "AI";
      case WorkGenre.UNITY:
        return "Unity";
      case WorkGenre.BLENDER:
        return "Blender";
      case WorkGenre.DTM:
        return "DTM";
      case WorkGenre.OTHERS:
        return "Others";
      case WorkGenre.STUDY:
        return "Study";
      case WorkGenre.GAME:
        return "Game";
      case WorkGenre.TOOL:
        return "Tool";
      case WorkGenre.CG:
        return "CG";
      case WorkGenre.MUSIC:
        return "Music";
      default:
        return this.toString().substring(10);
    }
  }
}
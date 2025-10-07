import 'dart:io';

class ImagePathUtil {
  static String getImagePath(String fileName) {
    final String baseDir = 'c:/Users/anura/Downloads/AICTE/indigames';
    final String filePath = '$baseDir/Gamesimages/$fileName';
    if (File(filePath).existsSync()) {
      return filePath;
    } else {
      return 'assets/images/placeholder_game.svg';
    }
  }
}
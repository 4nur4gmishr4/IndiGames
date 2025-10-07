class GameModel {
  final String id;
  final String title;
  final String developer;
  final String imageUrl;
  final String thumbnailUrl;
  final String description;
  final double rating;
  final String category;
  final bool isFeatured;
  final bool isDailyChallenge;

  GameModel({
    required this.id,
    required this.title,
    required this.developer,
    required this.imageUrl,
    required this.thumbnailUrl,
    required this.description,
    this.rating = 0.0,
    required this.category,
    this.isFeatured = false,
    this.isDailyChallenge = false,
  });

  // Sample data for testing
  static List<GameModel> getSampleGames() {
    return [
      GameModel(
        id: '1',
        title: 'Cosmic Voyage',
        developer: 'Stellar Studios',
        imageUrl: 'Cosmicvoyage.png',
        thumbnailUrl: 'Cosmicvoyage.png',
        description: 'Embark on an interstellar journey through unexplored galaxies. Discover alien civilizations and unravel cosmic mysteries in this immersive space adventure.',
        rating: 4.8,
        category: 'Adventure',
        isFeatured: true,
      ),
      GameModel(
        id: '2',
        title: 'Neon Racer',
        developer: 'Velocity Games',
        imageUrl: 'Neonracer.png',
        thumbnailUrl: 'Neonracer.png',
        description: 'Race through futuristic neon-lit cities at breakneck speeds. Customize your hover vehicle and compete against the best racers in the galaxy.',
        rating: 4.5,
        category: 'Racing',
      ),
      GameModel(
        id: '3',
        title: 'Mystic Quest',
        developer: 'Enchanted Realms',
        imageUrl: 'Mysticquest.png',
        thumbnailUrl: 'Mysticquest.png',
        description: 'Dive into a world of magic and mystery. Master ancient spells, defeat legendary creatures, and restore balance to the enchanted kingdom.',
        rating: 4.7,
        category: 'RPG',
        isDailyChallenge: true,
      ),
      GameModel(
        id: '4',
        title: 'Pixel Defenders',
        developer: 'Retro Arcade',
        imageUrl: 'Pixeldefenders.png',
        thumbnailUrl: 'Pixeldefenders.png',
        description: 'Protect your 8-bit world from invading forces. Build towers, deploy units, and strategize your defense in this addictive tower defense game.',
        rating: 4.3,
        category: 'Strategy',
      ),
      GameModel(
        id: '5',
        title: 'Shadow Ninja',
        developer: 'Stealth Works',
        imageUrl: 'Shadowninja.png',
        thumbnailUrl: 'Shadowninja.png',
        description: 'Master the arts of stealth and combat as an elite ninja warrior. Infiltrate enemy strongholds, eliminate targets, and uncover a conspiracy that threatens the entire realm.',
        rating: 4.6,
        category: 'Action',
        isFeatured: true,
      ),
    ];
  }

  static List<GameModel> getDailyChallenges() {
    return getSampleGames().where((game) => game.isDailyChallenge).toList();
  }

  static List<GameModel> getFeaturedGames() {
    return getSampleGames().where((game) => game.isFeatured).toList();
  }

  static List<GameModel> getContinuePlaying() {
    // Return first 3 games as "continue playing" for demo purposes
    return getSampleGames().take(3).toList();
  }

  static Future<List<GameModel>> getAllGames() async {
    return Future.value(getSampleGames());
  }

  factory GameModel.empty() {
    return GameModel(
      id: '',
      title: '',
      developer: '',
      imageUrl: '',
      thumbnailUrl: '',
      rating: 0.0,
      description: '',
      category: '',
    );
  }
}
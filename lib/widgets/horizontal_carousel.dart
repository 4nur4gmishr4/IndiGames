import 'package:flutter/material.dart';
import '../models/game_model.dart';
import 'game_card.dart';
import 'liquid_glass_container.dart';

class HorizontalCarousel extends StatelessWidget {
  final String title;
  final List<GameModel> games;
  final Function(BuildContext context, GameModel game) onGameTap;
  final double cardWidth;
  final double cardHeight;
  final bool isLoading;

  const HorizontalCarousel({
    super.key,
    required this.title,
    required this.games,
    required this.onGameTap,
    this.cardWidth = 160.0,
    this.cardHeight = 220.0,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section title
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 12.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontFamily: 'NewYork',
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        
        // Game cards carousel
        SizedBox(
          height: cardHeight,
          child: games.isEmpty && !isLoading
              ? _buildEmptyState(context)
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: isLoading ? 3 : games.length,
                  itemBuilder: (context, index) {
                    final game = games[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: GameCard(
                        game: game,
                        onTap: () => onGameTap(context, game),
                      ),
                    );
                  },
                ),
        ),
        
        const SizedBox(height: 24.0),
      ],
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: LiquidGlassContainer(
        blur: 10,
        borderRadius: 16,
        color: Theme.of(context).colorScheme.surface,
        opacity: 0.5,
        child: Center(
          child: Text(
            'No games available',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:indigames/models/game_model.dart';
import 'package:indigames/services/image_path_util.dart';
import 'package:indigames/widgets/liquid_glass_container.dart';

class GameCard extends StatelessWidget {
  final GameModel game;
  final double height;
  final double width;
  final bool showDescription;
  final VoidCallback? onTap;

  const GameCard({
    super.key,
    required this.game,
    this.height = 120,
    this.width = 120,
    this.showDescription = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: height,
        width: width,
        child: LiquidGlassContainer(
          borderRadius: 10.0, // Set consistent 10px border radius
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0), // Match 10px border radius
                child: ImagePathUtil.getImagePath(game.thumbnailUrl).endsWith('.svg')
                    ? SvgPicture.asset(
                        ImagePathUtil.getImagePath(game.thumbnailUrl),
                        height: height,
                        width: width,
                        fit: BoxFit.contain, // Use contain to maintain aspect ratio
                        placeholderBuilder: (BuildContext context) => Container(
                          color: Theme.of(context).colorScheme.primary.withAlpha(51),
                          child: Center(
                            child: Icon(
                              Icons.videogame_asset,
                              color: Theme.of(context).colorScheme.primary,
                              size: 40,
                            ),
                          ),
                        ),
                      )
                    : Image.asset(
                        ImagePathUtil.getImagePath(game.thumbnailUrl),
                        height: height,
                        width: width,
                        fit: BoxFit.contain, // Use contain to maintain aspect ratio
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Theme.of(context).colorScheme.primary.withAlpha(51),
                            child: Center(
                              child: Icon(
                                Icons.videogame_asset,
                                color: Theme.of(context).colorScheme.primary,
                                size: 40,
                              ),
                            ),
                          );
                        },
                      ),
              ),
              if (game.rating > 0)
                Positioned(
                  top: 8,
                  right: 8,
                  child: LiquidGlassContainer(
                    blur: 5,
                    borderRadius: 12,
                    color: Colors.black,
                    opacity: 0.5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 4.0,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            game.rating.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withAlpha((255 * 0.7).round()),
                        Colors.transparent,
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        game.title,
                        style: const TextStyle(
                          fontFamily: 'NewYork',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (showDescription)
                        Text(
                          game.developer,
                          style: TextStyle(
                            fontFamily: 'NewYork',
                            fontSize: 14,
                            color: Colors.white.withAlpha((255 * 0.7).round()),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

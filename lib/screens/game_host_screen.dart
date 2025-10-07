import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flame/game.dart';
import '../models/game_model.dart';
import '../game/placeholder_game.dart';
import '../widgets/pause_menu_overlay.dart';
import '../widgets/liquid_glass_container.dart';

class GameHostScreen extends StatefulWidget {
  final GameModel game;

  const GameHostScreen({super.key, required this.game});

  @override
  State<GameHostScreen> createState() => _GameHostScreenState();
}

class _GameHostScreenState extends State<GameHostScreen> {
  late PlaceholderGame _game;
  bool _showPauseMenu = false;

  @override
  void initState() {
    super.initState();
    _game = PlaceholderGame();
  }

  void _togglePauseMenu() {
    setState(() {
      _showPauseMenu = !_showPauseMenu;
      _game.togglePause();
    });
  }

  void _exitGame() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _showPauseMenu, // Allow pop only if pause menu is showing (to exit game)
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) { // If the pop was prevented (meaning canPop was false)
          _togglePauseMenu(); // Show the pause menu
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            // Game widget
            GameWidget(
              game: _game,
              loadingBuilder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: Color(0xFFFF0436),
                ),
              ),
              errorBuilder: (context, error) => Center(
                child: LiquidGlassContainer(
                  blur: 10,
                  borderRadius: 16,
                  color: Colors.black,
                  opacity: 0.7,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.error_outline,
                          color: Color(0xFFFF0436),
                          size: 48,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Error loading game',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          error.toString(),
                          style: TextStyle(
                            color: Colors.white.withAlpha((255 * 0.7).round()),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            
            // Back button
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: IconButton( // Changed from CupertinoNavigationBarBackButton
                  icon: const Icon(Icons.arrow_back), // Or a custom icon
                  color: Colors.white,
                  onPressed: () {
                    if (_showPauseMenu) {
                      _exitGame(); // Exit game if pause menu is showing
                    } else {
                      _togglePauseMenu(); // Show pause menu if game is running
                    }
                  },
                ),
              ),
            ),
            // Game info overlay
            Positioned(
              top: MediaQuery.of(context).padding.top + 16,
              left: 16,
              right: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Game title
                  LiquidGlassContainer(
                    blur: 10,
                    borderRadius: 12,
                    color: Colors.black,
                    opacity: 0.5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(
                        widget.game.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  
                  // Pause button
                  GestureDetector(
                    onTap: _togglePauseMenu,
                    child: LiquidGlassContainer(
                      blur: 10,
                      borderRadius: 12,
                      color: Colors.black,
                      opacity: 0.5,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          CupertinoIcons.pause,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // Pause menu overlay
            if (_showPauseMenu)
              PauseMenuOverlay(
                onResume: _togglePauseMenu,
                onExit: _exitGame,
              ),
          ],
        ),
      ),
    );
  }
}
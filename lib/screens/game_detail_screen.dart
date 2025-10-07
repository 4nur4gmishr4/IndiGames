import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../models/game_model.dart';
import '../widgets/liquid_glass_container.dart';
import 'game_host_screen.dart';


class GameDetailScreen extends StatefulWidget {
  final GameModel game;

  const GameDetailScreen({super.key, required this.game});

  @override
  State<GameDetailScreen> createState() => _GameDetailScreenState();
}

class _GameDetailScreenState extends State<GameDetailScreen> {
  Future<void> _onRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
    // TODO: Implement actual refresh logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background image with Hero animation
          Hero(
            tag: 'game-${widget.game.id}',
            child: Container(color: Colors.red,),
          ),
          
          // Back button
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: CupertinoNavigationBarBackButton(
                onPressed: () => Navigator.pop(context),
                color: Colors.white,
              ),
            ),
          ),
          
          // Content container
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: LiquidGlassContainer(
              blur: 20,
              borderRadius: 32,
              color: Colors.black,
              opacity: 0.7,
              child: Container(
                padding: const EdgeInsets.all(24.0),
                height: MediaQuery.of(context).size.height * 0.55,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Game title
                    Text(
                      widget.game.title,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontFamily: 'NewYork',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    
                    const SizedBox(height: 8),
                    
                    // Developer
                    Text(
                      widget.game.developer,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white.withAlpha(179),
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Rating
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 20,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          widget.game.rating.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white.withAlpha(26),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            widget.game.category,
                            style: TextStyle(
                              color: Colors.white.withAlpha(229),
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Description
                    Expanded(
                      child: CupertinoScrollbar(
                        child: CustomScrollView(
                          physics: const BouncingScrollPhysics(),
                          slivers: [
                            CupertinoSliverRefreshControl(
                              onRefresh: _onRefresh,
                            ),
                            SliverToBoxAdapter(
                              child: Text(
                                widget.game.description,
                                style: TextStyle(
                                  color: Colors.white.withAlpha(229),
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Play button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GameHostScreen(game: widget.game),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF0436),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text(
                          'PLAY',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
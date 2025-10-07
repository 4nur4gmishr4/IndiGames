import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class PlaceholderGame extends FlameGame with TapDetector, HasGameReference {
  late TextComponent gameTitle;
  late TextComponent tapInstruction;
  late SpriteComponent character;
  
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    
    // Add background
    final background = RectangleComponent(
      size: size,
      paint: Paint()..color = const Color(0xFF121212),
    );
    add(background);
    
    // Add game title
    gameTitle = TextComponent(
      text: 'IndiGames Demo',
      textRenderer: TextPaint(
        style: const TextStyle(
          color: Colors.white,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
    gameTitle.position = Vector2(size.x / 2, size.y / 3);
    gameTitle.anchor = Anchor.center;
    add(gameTitle);
    
    // Add tap instruction
    tapInstruction = TextComponent(
      text: 'Tap anywhere to interact',
      textRenderer: TextPaint(
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 18,
        ),
      ),
    );
    tapInstruction.position = Vector2(size.x / 2, size.y / 2);
    tapInstruction.anchor = Anchor.center;
    add(tapInstruction);
    
    // Add a simple animated character (placeholder)
    try {
      final sprite = await Sprite.load('game_character.png');
      character = SpriteComponent(
        sprite: sprite,
        size: Vector2(100, 100),
        position: Vector2(size.x / 2, size.y * 0.7),
        anchor: Anchor.center,
      );
      add(character);
    } catch (e) {
      // Fallback if sprite loading fails
      final placeholderCharacter = CircleComponent(
        radius: 50,
        paint: Paint()..color = const Color(0xFFFF0436),
        position: Vector2(size.x / 2, size.y * 0.7),
        anchor: Anchor.center,
      );
      add(placeholderCharacter);
    }
  }
  
  @override
  void onTap() {
    super.onTap();
    if (!paused) {
      // Simple animation on tap
      character.scale = Vector2.all(1.2);
      Future.delayed(const Duration(milliseconds: 150), () {
        if (!paused && character.isMounted) {
          character.scale = Vector2.all(1.0);
        }
      });
    }
  }
  
  @override
  void update(double dt) {
    super.update(dt);
    if (!paused && character.isMounted) {
      // Simple floating animation
      final time = DateTime.now().millisecondsSinceEpoch / 1000;
      character.position.y = size.y * 0.7 + (sin(time * 2) * 10);
    }
  }
  
  void togglePause() {
    if (paused) {
      resumeEngine();
    } else {
      pauseEngine();
    }
    paused = !paused;
  }
}
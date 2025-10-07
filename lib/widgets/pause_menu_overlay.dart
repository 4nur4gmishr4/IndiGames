import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'liquid_glass_container.dart';

class PauseMenuOverlay extends StatefulWidget {
  final VoidCallback onResume;
  final VoidCallback onExit;

  const PauseMenuOverlay({
    super.key,
    required this.onResume,
    required this.onExit,
  });

  @override
  State<PauseMenuOverlay> createState() => _PauseMenuOverlayState();
}

class _PauseMenuOverlayState extends State<PauseMenuOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );

    _opacityAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _closeOverlay() async {
    await _controller.reverse();
    if (mounted) {
      widget.onResume();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _opacityAnimation.value,
          child: GestureDetector(
            onTap: () {}, // Prevent taps from passing through
            child: Container(
              color: Colors.black.withAlpha((0.5 * _opacityAnimation.value * 255).toInt()),
              child: Center(
                child: Transform.scale(
                  scale: _scaleAnimation.value,
                  child: child,
                ),
              ),
            ),
          ),
        );
      },
      child: LiquidGlassContainer(
        blur: 20,
        borderRadius: 32,
        color: Colors.black,
        opacity: 0.7,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.85,
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'PAUSED',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontFamily: 'NewYork',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 32),
              _buildMenuButton(
                icon: CupertinoIcons.play_fill,
                label: 'Resume',
                onTap: _closeOverlay,
              ),
              const SizedBox(height: 16),
              _buildMenuButton(
                icon: CupertinoIcons.refresh,
                label: 'Restart',
                onTap: () {
                  _closeOverlay();
                  // Add restart logic here
                },
              ),
              const SizedBox(height: 16),
              _buildMenuButton(
                icon: CupertinoIcons.settings,
                label: 'Settings',
                onTap: () {
                  // Add settings logic here
                },
              ),
              const SizedBox(height: 16),
              _buildMenuButton(
                icon: CupertinoIcons.xmark,
                label: 'Exit Game',
                isDestructive: true,
                onTap: () async {
                  await _controller.reverse();
                  if (mounted) {
                    widget.onExit();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) {
    final color = isDestructive ? const Color(0xFFFF0436) : Colors.white;

    return GestureDetector(
      onTap: onTap,
      child: LiquidGlassContainer(
        blur: 10,
        borderRadius: 16,
        color: isDestructive
            ? const Color(0xFFFF0436).withAlpha(51) // 0.2 * 255 = 51
            : Colors.white.withAlpha(26), // 0.1 * 255 = 25.5 ≈ 26
        opacity: 0.3,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Row(
            children: [
              Icon(icon, color: color),
              const SizedBox(width: 16),
              Text(
                label,
                style: TextStyle(
                  color: color,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              Icon(
                CupertinoIcons.chevron_right,
                color: color.withAlpha(179), // 0.7 * 255 = 178.5 ≈ 179
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

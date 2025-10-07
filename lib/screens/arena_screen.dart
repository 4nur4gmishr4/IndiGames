import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/liquid_glass_container.dart';
import 'profile_screen.dart';

class ArenaScreen extends StatelessWidget {
  const ArenaScreen({super.key});

  void _navigateToProfile(BuildContext context) {
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (context) => const ProfileScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            expandedHeight: 100,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
              title: Text(
                'Arena',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            actions: [
              CupertinoButton(
                child: const Icon(CupertinoIcons.profile_circled),
                onPressed: () {
                  _navigateToProfile(context);
                },
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  LiquidGlassContainer(
                    blur: 10,
                    borderRadius: 24,
                    color: Theme.of(context).colorScheme.surface,
                    opacity: 0.5,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Competitions',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 16),
                          Center(
                            child: Text(
                              'Join gaming tournaments and challenges',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
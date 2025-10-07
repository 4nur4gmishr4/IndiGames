import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({super.key});

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  Future<void> _onRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
    // Implement your refresh logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          // Removed GestureDetector that called _showProfileBottomSheet
        ],
      ),
      body: Stack(
        children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.blue.withValues(alpha: 0.3), // Start with a semi-transparent blue
                      Colors.transparent, // Fade to transparent
                    ],
                    stops: [0.0, 0.3], // Adjust the fade intensity and length
                  ),
                ),
              ),
            ),
            CustomScrollView(
                slivers: [
                  CupertinoSliverRefreshControl(
                    onRefresh: _onRefresh,
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 60), // Space for status bar
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            'Today',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).textTheme.bodyLarge?.color,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        
                        // Featured Game - Purple Box (NOW AVAILABLE)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Container(
                              width: double.infinity,
                              height: 380,
                              decoration: BoxDecoration(
                                color: const Color(0xFF6A1B9A), // Purple color
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Stack(
                                children: [
                                  // Game Image
                                  Positioned.fill(
                                    child: Image.asset(
                                      'assets/images/Cosmicvoyage.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  // NOW AVAILABLE banner
                                  Positioned(
                                    top: 16,
                                    left: 16,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                      decoration: BoxDecoration(
                                        color: Colors.purple.shade800,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: const Text(
                                        'NOW AVAILABLE',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                  // NEW SEASON text
                                  Positioned(
                                    bottom: 80,
                                    left: 16,
                                    child: Text(
                                      'NEW SEASON',
                                      style: TextStyle(
                                        color: Colors.white.withValues(alpha: 0.7),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  // Game title
                                  Positioned(
                                    bottom: 50,
                                    left: 16,
                                    right: 16,
                                    child: const Text(
                                      'Fight off a cosmic curse',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  // Game description
                                  Positioned(
                                    bottom: 24,
                                    left: 16,
                                    right: 16,
                                    child: Text(
                                      'This year\'s Clash-O-Ween is out of this world.',
                                      style: TextStyle(
                                        color: Colors.white.withValues(alpha: 0.9),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  // Game logo and Open button
                                  Positioned(
                                    bottom: 16,
                                    left: 16,
                                    right: 16,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            image: const DecorationImage(
                                              image: AssetImage('assets/images/app_logo.png'),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        const Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Clash of Clans',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                            ),
                                            Text(
                                              'Build, Battle, Defend & Rise!',
                                              style: TextStyle(
                                                color: Colors.white70,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                                          decoration: BoxDecoration(
                                            color: Colors.white.withValues(alpha: 0.2),
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          child: const Text(
                                            'Open',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        
                        // Hot this week section
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        'NOW TRENDING',
                                        style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                  child: Text(
                                    'Hot this week',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                
                                // App tiles
                                _buildAppTile(
                                  'YouTube',
                                  'Videos, Music and Live Streams',
                                  'assets/images/app_logo.png',
                                  Colors.red,
                                  'Open',
                                ),
                                const Divider(height: 1),
                                _buildAppTile(
                                  'JioHotstar',
                                  'Cricket, Movies and Shows',
                                  'assets/images/app_logo.png',
                                  Colors.blue,
                                  'Download',
                                  isDownload: true,
                                ),
                                const Divider(height: 1),
                                _buildAppTile(
                                  'Snapchat: Chat with friends',
                                  'Share the moment',
                                  'assets/images/app_logo.png',
                                  Colors.yellow,
                                  'Open',
                                ),
                                const Divider(height: 1),
                                _buildAppTile(
                                  'Hinge Dating App: Match & Date',
                                  'Chat to Single People Online',
                                  'assets/images/app_logo.png',
                                  Colors.grey,
                                  'Get',
                                  showInAppPurchases: true,
                                ),
                                const Divider(height: 1),
                                _buildAppTile(
                                  'Blinkit: Grocery in 10 minutes',
                                  'Fruits, vegetables & groceries',
                                  'assets/images/app_logo.png',
                                  Colors.amber,
                                  'Download',
                                  isDownload: true,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        
                        // Add to Your Watch List section
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            'Add to Your Watch List',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).textTheme.bodyLarge?.color,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        
                        // Watch List Game Card
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Container(
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(16),
                              image: const DecorationImage(
                                image: AssetImage('assets/images/Shadowninja.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 16,
                                  left: 16,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                    decoration: BoxDecoration(
                                      color: Colors.green.shade800,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: const Text(
                                      'NOW AVAILABLE',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 100), // Space for bottom navigation
                      ],
                    ), // Closing for Column
                  ), // Closing for SliverToBoxAdapter
                ], // Closing for slivers list
              ),
          ], // Closing for Stack's children list
        ), // Closing for Stack
      ); // Closing for Scaffold
  }

  Widget _buildAppTile(String title, String subtitle, String imagePath, Color logoColor, String buttonText, {bool isDownload = false, bool showInAppPurchases = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: logoColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Image.asset(
                imagePath,
                width: 40,
                height: 40,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                if (showInAppPurchases)
                  const Text(
                    'In-app purchases',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              // Handle button press
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.pinkAccent, // Red-pink theme
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text(
              'Play', // Changed to 'Play'
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
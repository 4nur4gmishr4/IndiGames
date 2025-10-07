import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:indigames/theme/colors.dart'; // Import the colors.dart file
import '../widgets/liquid_glass_container.dart';
import 'play_screen.dart';
import 'arena_screen.dart';
import 'collection_screen.dart';
import 'categories_screen.dart';
import 'search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  late AnimationController _animationController;

  final List<Widget> _screens = [
    const PlayScreen(),
    const CategoriesScreen(),
    const ArenaScreen(),
    const CollectionScreen(),
    const SearchScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
      // Reset and play animation for smooth transition
      _animationController.reset();
      _animationController.forward();
    });
  }

  void _onTabTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          // PageView for tab screens
          FadeTransition(
            opacity: _animationController,
            child: PageView(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              physics: const NeverScrollableScrollPhysics(),
              children: _screens,
            ),
          ),
          
          // Floating bottom navigation bar
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: LiquidGlassContainer(
              blur: 10,
              opacity: 0.5,
              borderRadius: 30,
              color: Theme.of(context).colorScheme.surface,
              child: Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom,
                  top: 4,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildNavItem(0, CupertinoIcons.play_fill, 'Play'),
                    _buildNavItem(1, CupertinoIcons.square_grid_2x2, 'Categories'),
                    _buildNavItem(2, CupertinoIcons.game_controller, 'Arena'),
                    _buildNavItem(3, CupertinoIcons.collections, 'Collection'),
                    _buildSearchNavItem(4, CupertinoIcons.search, 'Search'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final isSelected = _currentIndex == index;
    final selectedIcon = _getFilledIcon(icon, isSelected);
    final unselectedIcon = _getOutlinedIcon(icon, isSelected);

    return GestureDetector(
      onTap: () => _onTabTapped(index),
      behavior: HitTestBehavior.opaque,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(25),
        ),
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isSelected ? selectedIcon : unselectedIcon,
              color: isSelected ? accentColor : inactiveColor,
              size: 26,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? accentColor : inactiveColor,
                fontSize: 11,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  IconData _getFilledIcon(IconData icon, bool isSelected) {
    if (icon == CupertinoIcons.play_fill) return CupertinoIcons.play_fill;
    if (icon == CupertinoIcons.square_grid_2x2) return CupertinoIcons.square_grid_2x2_fill;
    if (icon == CupertinoIcons.game_controller) return CupertinoIcons.gamecontroller_fill;
    if (icon == CupertinoIcons.collections) return CupertinoIcons.folder_fill;
    if (icon == CupertinoIcons.search) return CupertinoIcons.search_circle_fill;
    return icon;
  }

  IconData _getOutlinedIcon(IconData icon, bool isSelected) {
    if (icon == CupertinoIcons.play_fill) return CupertinoIcons.play;
    if (icon == CupertinoIcons.square_grid_2x2) return CupertinoIcons.square_grid_2x2;
    if (icon == CupertinoIcons.game_controller) return CupertinoIcons.game_controller;
    if (icon == CupertinoIcons.collections) return CupertinoIcons.folder_fill; // Always show filled icon for collection
    if (icon == CupertinoIcons.search) return CupertinoIcons.search;
    return icon;
  }

  Widget _buildSearchNavItem(int index, IconData icon, String label) {
    final isSelected = _currentIndex == index;
    // final selectedContentColor = Colors.white; // This line is no longer needed

    return GestureDetector(
      onTap: () => _onTabTapped(index),
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent,
        ),
        child: Icon(
          isSelected ? CupertinoIcons.search_circle_fill : CupertinoIcons.search,
          color: isSelected ? accentColor : inactiveColor,
          size: 26,
        ),
      ),
    );
  }
}
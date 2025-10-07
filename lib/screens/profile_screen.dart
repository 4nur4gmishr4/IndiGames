import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:indigames/widgets/liquid_glass_container.dart';
import 'package:provider/provider.dart';
import 'package:indigames/theme/theme_provider.dart';

import 'package:flutter_svg/flutter_svg.dart'; // Import for SvgPicture

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Widget _buildProfileSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontFamily: 'NewYork',
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        LiquidGlassContainer(
          blur: 10,
          borderRadius: 12,
          color: Colors.white, // #ffffff for profile sections
          opacity: 0.5,
          child: Column(
            children: items,
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildProfileItem({
    required IconData icon,
    required String title,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Row(
          children: [
            Icon(icon, size: 24, color: Theme.of(context).colorScheme.onSurface),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            if (trailing != null) trailing,
            const Icon(CupertinoIcons.chevron_right, size: 18, color: CupertinoColors.systemGrey),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: const Color(0xFFF2F1F6), // #f2f1f6 for profile background
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          CupertinoSliverRefreshControl(
            onRefresh: () async {
              await Future.delayed(const Duration(seconds: 1));
            },
          ),
          SliverAppBar(
            expandedHeight: 120.0,
            floating: false,
            pinned: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            stretch: true,
            leading: Container(), // Remove the back button
            actions: [
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  CupertinoIcons.xmark,
                  color: Theme.of(context).textTheme.titleLarge?.color,
                  size: 28,
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Account',
                style: TextStyle(
                  fontFamily: 'NewYork',
                  color: Theme.of(context).textTheme.titleLarge?.color,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
              titlePadding: const EdgeInsets.only(bottom: 16.0),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8.0),
                        // User Profile Section
                        LiquidGlassContainer(
                          blur: 10,
                          borderRadius: 12,
                          color: Theme.of(context).colorScheme.surface.withAlpha(26),
                          opacity: 0.5,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  child: SvgPicture.asset('assets/images/profile_placeholder.svg'), // Use SvgPicture.asset for SVG
                                ),
                                const SizedBox(width: 16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Anurag Mishra',
                                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                            fontFamily: 'NewYork',
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Text(
                                      '+91 93027 86886',
                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                            color: CupertinoColors.systemGrey,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        _buildProfileSection(
                          '',
                          [
                            _buildProfileItem(
                              icon: CupertinoIcons.app,
                              title: 'Apps',
                              onTap: () {},
                            ),
                            _buildProfileItem(
                              icon: CupertinoIcons.bag,
                              title: 'Purchase History',
                              onTap: () {},
                            ),
                            _buildProfileItem(
                              icon: CupertinoIcons.bell,
                              title: 'Notifications',
                              onTap: () {},
                            ),
                            _buildProfileItem(
                              icon: CupertinoIcons.moon_fill,
                              title: 'Dark Mode',
                              trailing: Consumer<ThemeProvider>(
                                builder: (context, themeProvider, _) {
                                  final isDarkMode = themeProvider.themeMode == ThemeMode.dark;
                                  return CupertinoSwitch(
                                    value: isDarkMode,
                                    activeTrackColor: CupertinoColors.activeBlue,
                                    onChanged: (value) {
                                      themeProvider.toggleTheme(value);
                                    },
                                  );
                                },
                              ),
                              onTap: () {
                                final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
                                themeProvider.toggleTheme(themeProvider.themeMode != ThemeMode.dark);
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        LiquidGlassContainer(
                          blur: 10,
                          borderRadius: 12,
                          color: Theme.of(context).colorScheme.surface.withAlpha(26),
                          opacity: 0.5,
                          child: Column(
                            children: [
                              _buildProfileItem(
                                icon: CupertinoIcons.gift,
                                title: 'Redeem Gift Card or Code',
                                onTap: () {},
                              ),
                              _buildProfileItem(
                                icon: CupertinoIcons.mail,
                                title: 'Send Gift Card by Email',
                                onTap: () {},
                              ),
                              _buildProfileItem(
                                icon: CupertinoIcons.creditcard,
                                title: 'Add Funds to Apple Account',
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        _buildProfileSection(
                          '',
                          [
                            _buildProfileItem(
                              icon: CupertinoIcons.star,
                              title: 'Personalised Recommendations',
                              onTap: () {},
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        // Updated Recently Section (Placeholder)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                          child: Text(
                            'Updated Recently',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  fontFamily: 'NewYork',
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        LiquidGlassContainer(
                          blur: 10,
                          borderRadius: 12,
                          color: Theme.of(context).colorScheme.surface.withAlpha(26),
                          opacity: 0.5,
                          child: Column(
                            children: [
                              // Placeholder for app cards
                              _buildProfileItem(
                                icon: CupertinoIcons.play_rectangle,
                                title: 'YouTube',
                                trailing: CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {},
                                  child: Text('Open', style: TextStyle(color: Theme.of(context).colorScheme.primary)),
                                ),
                                onTap: () {},
                              ),
                              _buildProfileItem(
                                icon: CupertinoIcons.game_controller,
                                title: 'Clash of Clans',
                                trailing: CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {},
                                  child: Text('Open', style: TextStyle(color: Theme.of(context).colorScheme.primary)),
                                ),
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
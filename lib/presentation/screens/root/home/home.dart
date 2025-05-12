import 'package:flutter/material.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/core/configs/assets/app_images.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/presentation/screens/root/home/news.dart';
import 'package:spotify/presentation/widgets/app_bar.dart';
import 'package:spotify/presentation/widgets/svg_asset.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  final List<String> tabs = [
    "News",
    "Video",
    "Artists",
    "Podcast",
  ];

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: tabs.length, vsync: this, initialIndex: 0,);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        hideBack: true,
        title: Image(
          image: AssetImage(AppImages.logoPng),
          height: 35,
          fit: BoxFit.contain,
        ),
        actions: [
          SvgAsset(
            path: AppImages.verticalDots,
            height: 25,
            fit: BoxFit.contain,
            color: context.isDarkMode ? Colors.white : Colors.black,
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(height: 16),
          _buildHomeArtistCard(context),
          const SizedBox(height: 32),
          _buildTabBar(),
          const SizedBox(height: 16),
          _buildTabBarView(),
        ],
      ),
    );
  }

  Widget _buildHomeArtistCard(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = ((width - 32) * 118) / 334;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        children: [
          SvgAsset(
            path: AppImages.homeTopCard,
            width: width,
            height: height,
            fit: BoxFit.contain,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 64),
              child: Image.asset(AppImages.homeArtist, height: height),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBarView(){
    return SizedBox(
      height: 250,
      child: TabBarView(
        controller: _tabController,
        children: [
          NewsSongs(),
          Container(),
          Container(),
          Container(),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      controller: _tabController,
      isScrollable: true,
      //padding: EdgeInsets.symmetric(horizontal: 16),
      indicatorColor: AppColors.primary,
      dividerHeight: 0,
      tabAlignment: TabAlignment.start,
      labelPadding: EdgeInsets.symmetric(horizontal: 24),
      labelColor: context.isDarkMode ? Colors.white : Colors.black,
      unselectedLabelColor: AppColors.grey,
      tabs:
          tabs
              .map(
                (e) => Text(
                  e,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
              )
              .toList(),
    );
  }
}

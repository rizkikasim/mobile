import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propedia/presentation/auth/pages/profiles/profile_page.dart';
import 'package:propedia/presentation/home/pages/chats/chat_pages.dart';
import 'package:propedia/presentation/home/pages/logic/dashboard_logic.dart';
import 'package:propedia/presentation/home/widgets/custom_bottom_navigation_bar.dart';
import 'package:propedia/presentation/home/widgets/menu_section.dart';
import 'package:propedia/presentation/home/widgets/custom_search_bar.dart';
import 'package:propedia/presentation/home/widgets/snack_item_card.dart';
import 'package:propedia/presentation/home/widgets/banner_carousel.dart';
import 'package:propedia/presentation/home/widgets/flash_sale_card.dart';
import 'package:propedia/presentation/home/widgets/flash_sale_shimmer.dart';
import 'package:propedia/presentation/home/widgets/snack_item_shimmer.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardView extends StatefulWidget {
  final String userName;
  final String userEmail;
  final String userRole;
  final DashboardLogic dashboardLogic;

  const DashboardView({
    super.key,
    required this.userName,
    required this.userEmail,
    required this.userRole,
    required this.dashboardLogic,
  });

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();

  bool _isRefreshingData = false;

  File? _profileImage;

  @override
  void initState() {
    super.initState();
    _loadProfileImage();
  }

  void _loadProfileImage() async {
    final prefs = await SharedPreferences.getInstance();
    final path = prefs.getString('profileImagePath');
    if (path != null && File(path).existsSync()) {
      setState(() {
        _profileImage = File(path);
      });
    }
  }
  Future<void> _handleRefresh() async {
    debugPrint('Refreshing data (DashboardView)...');
    setState(() {
      _isRefreshingData = true;
    });

    await Future.delayed(const Duration(milliseconds: 1500));

    setState(() {
      _isRefreshingData = false;
    });
    debugPrint('Refresh complete (DashboardView)!');
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      _buildHomePageContent(context),
      const Center(child: Text('Activity Page Content')),
      const Center(child: Text('Payment Page Content')),
      const ChatPage(),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[widget.dashboardLogic.selectedIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: widget.dashboardLogic.selectedIndex,
        onItemTapped: widget.dashboardLogic.onItemTapped,
      ),
    );
  }

  Widget _buildHomePageContent(BuildContext context) {
    final String defaultProfileImageUrl =
        'https://cdn-icons-png.flaticon.com/512/3135/3135715.png';

    bool showShimmer =
        _isRefreshingData || widget.dashboardLogic.isLoadingHomePage;

    return SafeArea(
      child: LiquidPullToRefresh(
        key: _refreshIndicatorKey,
        onRefresh: _handleRefresh,
        showChildOpacityTransition: false,
        color: const Color(0xFFFF6B00),
        backgroundColor: Colors.white,
        height: 100,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => ProfilePage(
                                      userName: widget.userName,
                                      userEmail: widget.userEmail,
                                      userRole: widget.userRole,
                                    ),
                              ),
                            );
                            _loadProfileImage();
                          },
                          child: CircleAvatar(
                            radius: 25.w,
                            backgroundImage: _profileImage != null
                                ? FileImage(_profileImage!)
                                : NetworkImage(defaultProfileImageUrl) as ImageProvider,
                            onBackgroundImageError: (exception, stackTrace) {
                              debugPrint('Error loading profile image: $exception');
                            },
                            child: _profileImage == null
                              ? Icon(
                                  Icons.person,
                                  size: 25.w,
                                  color: Colors.white,
                                )
                              : null,
                            backgroundColor: _profileImage == null ? Colors.grey[300] : null,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.dashboardLogic.getGreeting(),
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.grey[700],
                              ),
                            ),
                            Text(
                              widget.userName,
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.notifications_none,
                        size: 28.w,
                        color: Colors.grey[700],
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    const Expanded(child: CustomSearchBar()),
                    SizedBox(width: 10.w),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 1.w,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            spreadRadius: 0,
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.menu_open,
                          color: Colors.grey.shade600,
                        ),
                        onPressed: widget.dashboardLogic.navigateToFilterPage,
                        iconSize: 24.w,
                        padding: EdgeInsets.all(12.w),
                        splashRadius: 24.w,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              showShimmer
                  ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: const MenuSectionShimmer(),
                  )
                  : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: MenuSection(
                      allMenuItems: widget.dashboardLogic.allMenuItems,
                      onItemTap: (index) {
                        widget.dashboardLogic.onMenuItemTapped(context, index);
                      },
                    ),
                  ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    Expanded(
                      child: _buildActionButton(
                        Icons.directions_bike_outlined,
                        'Ride to\nOffice',
                      ),
                    ),
                    SizedBox(width: 15.w),
                    Expanded(
                      child: _buildActionButton(
                        Icons.lightbulb_outline,
                        'Discover\nNew Deals!',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  'Rumah di Sekitarmu',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              SizedBox(
                height: 220.h,
                child:
                    showShimmer
                        ? ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(
                                left: index == 0 ? 20.w : 0,
                                right: 15.w,
                              ),
                              child: const SnackItemShimmer(),
                            );
                          },
                        )
                        : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(
                                left: index == 0 ? 20.w : 0,
                                right: 15.w,
                              ),
                              child: SnackItemCard(
                                productImageUrl:
                                    'assets/images/product_image_${index + 1}.jpg',
                                title: 'Nama Produk Super ${index + 1}',
                                price: '${(index + 1) * 1500000}',
                                location: 'Bandung, Jawa Barat',
                                discountPercentage: index.isEven ? '15%' : null,
                              ),
                            );
                          },
                        ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Flash Sale!',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.red.shade700,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color:
                            widget.dashboardLogic.getCountdownBackgroundColor(),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Text(
                        widget.dashboardLogic.getCountdownDisplayText(),
                        style: TextStyle(
                          color: widget.dashboardLogic.getCountdownTextColor(),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              SizedBox(
                height: 200.h,
                child:
                    showShimmer
                        ? ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(
                                left: index == 0 ? 20.w : 0,
                                right: 15.w,
                              ),
                              child: const FlashSaleShimmer(),
                            );
                          },
                        )
                        : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(
                                left: index == 0 ? 20.w : 0,
                                right: 15.w,
                              ),
                              child: FlashSaleCard(
                                productImageUrl:
                                    'assets/images/flash_sale_${index + 1}.jpg',
                                productName: 'Properti Flash Sale ${index + 1}',
                                originalPrice: 2000000 + (index * 500000),
                                discountedPrice: 1500000 + (index * 400000),
                                remainingStock: 10 - index,
                                progress: (8 - index) / 10,
                              ),
                            );
                          },
                        ),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, size: 30.w, color: const Color(0xFFFF6B00)),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

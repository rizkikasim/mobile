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

class DashboardView extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      _buildHomePageContent(context),
      const Center(child: Text('Activity Page Content')),
      const Center(child: Text('Payment Page Content')),
      const ChatPage(),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[dashboardLogic.selectedIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: dashboardLogic.selectedIndex,
        onItemTapped: dashboardLogic.onItemTapped,
      ),
    );
  }

  Widget _buildHomePageContent(BuildContext context) {
    final String defaultProfileImageUrl =
        'https://cdn-icons-png.flaticon.com/512/3135/3135715.png';

    return SafeArea(
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
                                    userName: userName,
                                    userEmail: userEmail,
                                    userRole: userRole,
                                  ),
                            ),
                          );
                        },
                        child: CircleAvatar(
                          radius: 25.w,
                          backgroundImage: NetworkImage(defaultProfileImageUrl),
                          onBackgroundImageError: (exception, stackTrace) {
                            debugPrint(
                              'Error loading profile image: $exception',
                            );
                          },
                          child:
                              defaultProfileImageUrl.isEmpty
                                  ? Icon(
                                    Icons.person,
                                    size: 25.w,
                                    color: Colors.white,
                                  )
                                  : null,
                          backgroundColor:
                              defaultProfileImageUrl.isEmpty
                                  ? Colors.grey[300]
                                  : null,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            dashboardLogic.getGreeting(),
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey[700],
                            ),
                          ),
                          Text(
                            userName,
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
                      icon: Icon(Icons.menu_open, color: Colors.grey.shade600),
                      onPressed: dashboardLogic.navigateToFilterPage,
                      iconSize: 24.w,
                      padding: EdgeInsets.all(12.w),
                      splashRadius: 24.w,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            dashboardLogic.isLoadingHomePage
                ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: const MenuSectionShimmer(),
                )
                : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: MenuSection(
                    allMenuItems: dashboardLogic.allMenuItems,
                    onItemTap: (index) {
                      dashboardLogic.onMenuItemTapped(context, index);
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
                  dashboardLogic.isLoadingHomePage
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
              child: Text(
                'Penawaran Spesial',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            SizedBox(height: 15.h),
            SizedBox(
              height: 180.h,
              child:
                  dashboardLogic.isLoadingHomePage
                      ? SizedBox(
                        height: 180.0,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      )
                      : BannerCarousel(imageUrls: dashboardLogic.bannerImages),
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
                      color: dashboardLogic.getCountdownBackgroundColor(),
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Text(
                      dashboardLogic.getCountdownDisplayText(),
                      style: TextStyle(
                        color: dashboardLogic.getCountdownTextColor(),
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
                  dashboardLogic.isLoadingHomePage
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

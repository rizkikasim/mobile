import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 24.w,
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Container(
                  height: 48.h,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      hintStyle: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.grey[600],
                      ),
                      prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 14.h),
                    ),
                    onSubmitted: (query) {
                      debugPrint('Searching for: $query');
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterChip('KFC', icon: Icons.refresh),
                  SizedBox(width: 10.w),
                  _buildFilterChip('Pizza Hut', icon: Icons.show_chart),
                  SizedBox(width: 10.w),
                  _buildFilterChip('McDonalds', icon: Icons.refresh),
                  SizedBox(width: 10.w),
                  _buildFilterChip('CZN Burak', icon: Icons.show_chart),
                  SizedBox(width: 10.w),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      size: 20.w,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              'Saved Rides',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15.h),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildSavedRideCard(
                    icon: Icons.home,
                    iconColor: Colors.green,
                    title: 'Home',
                    subtitle: 'House 405,School...',
                    cardColor: Colors.green.withOpacity(0.1),
                  ),
                  SizedBox(width: 15.w),
                  _buildSavedRideCard(
                    icon: Icons.work,
                    iconColor: Colors.orange,
                    title: 'Office',
                    subtitle: 'Ananda Tower, J...',
                    cardColor: Colors.orange.withOpacity(0.1),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            Text(
              'Book a ride',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15.h),
            _buildRideOption(
              'MAG Osmani Airport - Terminal 2',
              'Airport Road, Tea state, Khadim, Sylhet 3100',
            ),
            Divider(height: 25.h, thickness: 0.5, color: Colors.grey[300]),
            _buildRideOption(
              'Sylhet City Centre - Front Gate',
              'North Zindabazar, Sylhet 3100',
            ),
            Divider(height: 25.h, thickness: 0.5, color: Colors.grey[300]),
            _buildRideOption(
              'Sylhet International Cricket Stadium',
              'Lakkatura, Sylhet 3200',
            ),
            SizedBox(height: 30.h),
            Text(
              'Recommended',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15.h),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildRecommendedCard(
                    imageUrl:
                        'https://via.placeholder.com/150/FF5733/FFFFFF?text=Food1',
                    title: 'Cinevibes',
                    rating: '4.2',
                    reviews: '293+ review',
                    distance: '0.2 km',
                    time: '04 min',
                  ),
                  SizedBox(width: 15.w),
                  _buildRecommendedCard(
                    imageUrl:
                        'https://via.placeholder.com/150/33FF57/FFFFFF?text=Coffee',
                    title: 'Artisan Cafe',
                    rating: '4.6',
                    reviews: '2123+ review',
                    distance: '0.7 km',
                    time: '09 min',
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(
    String text, {
    IconData? icon,
    bool isActive = false,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFFFF6B00) : Colors.grey[200],
        borderRadius: BorderRadius.circular(20.r),
        border: isActive ? null : Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null)
            Icon(
              icon,
              size: 16.w,
              color: isActive ? Colors.white : Colors.black54,
            ),
          if (icon != null) SizedBox(width: 5.w),
          Text(
            text,
            style: TextStyle(
              fontSize: 14.sp,
              color: isActive ? Colors.white : Colors.black87,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSavedRideCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required Color cardColor,
  }) {
    return Container(
      width: 150.w,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(icon, color: iconColor, size: 24.w),
          ),
          SizedBox(height: 10.h),
          Text(
            title,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5.h),
          Text(
            subtitle,
            style: TextStyle(fontSize: 12.sp, color: Colors.grey[600]),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildRideOption(String title, String subtitle) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.location_on, color: Colors.grey[600], size: 20.w),
        SizedBox(width: 10.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
              Text(
                subtitle,
                style: TextStyle(fontSize: 12.sp, color: Colors.grey[600]),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        Icon(Icons.arrow_forward_ios, color: Colors.grey[400], size: 18.w),
      ],
    );
  }

  Widget _buildRecommendedCard({
    required String imageUrl,
    required String title,
    required String rating,
    required String reviews,
    required String distance,
    required String time,
  }) {
    return Container(
      width: 180.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10.r)),
            child: Image.network(
              imageUrl,
              height: 100.h,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 100.h,
                  width: double.infinity,
                  color: Colors.grey[200],
                  child: Icon(
                    Icons.image_not_supported,
                    size: 40.w,
                    color: Colors.grey[500],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 5.h),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 16.w),
                    SizedBox(width: 3.w),
                    Text(
                      '$rating ($reviews)',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.grey[600],
                      size: 14.w,
                    ),
                    SizedBox(width: 3.w),
                    Text(
                      '$distance • $time',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

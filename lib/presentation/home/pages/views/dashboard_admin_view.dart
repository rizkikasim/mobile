import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propedia/presentation/auth/cubit/auth_cubit.dart';
import 'package:propedia/presentation/auth/cubit/auth_state.dart';
import 'package:propedia/presentation/auth/pages/login_page.dart';
import 'package:propedia/presentation/auth/widgets/notify/custom_notification_card.dart';

import 'package:propedia/presentation/home/pages/chats/chat_pages.dart';
import 'package:propedia/presentation/home/pages/logic/dashboard_logic.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:propedia/presentation/home/widgets/admins/bar_chart_section.dart';
import 'package:propedia/presentation/home/widgets/admins/trading_info_section.dart';

class DashboardAdminView extends StatefulWidget {
  final String userName;
  final String userEmail;
  final String userRole;
  final DashboardLogic dashboardLogic;

  const DashboardAdminView({
    super.key,
    required this.userName,
    required this.userEmail,
    required this.userRole,
    required this.dashboardLogic,
  });

  @override
  State<DashboardAdminView> createState() => _DashboardAdminViewState();
}

class _DashboardAdminViewState extends State<DashboardAdminView> {
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();

  Future<void> _handleRefresh() async {
    debugPrint('Refreshing data (DashboardAdminView)...');
    await Future.delayed(const Duration(milliseconds: 1500));
    debugPrint('Refresh complete (DashboardAdminView)!');
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 690));

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

    return SafeArea(
      child: LiquidPullToRefresh(
        key: _refreshIndicatorKey,
        onRefresh: _handleRefresh,
        showChildOpacityTransition: false,
        color: const Color(0xFF4DA8DA),
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
                          },
                          child: CircleAvatar(
                            radius: 25.w,
                            backgroundImage: NetworkImage(
                              defaultProfileImageUrl,
                            ),
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

              BarChartSection(),
              SizedBox(height: 20.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Top Campaign',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            debugPrint('View All Top Campaign tapped');
                          },
                          child: Row(
                            children: [
                              Text(
                                'View All',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.grey[700],
                                ),
                              ),
                              SizedBox(width: 5.w),
                              Icon(
                                Icons.arrow_forward,
                                size: 16.w,
                                color: Colors.grey[700],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(20.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(12.w),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(15.r),
                                ),
                                child: Icon(
                                  Icons.shopping_cart_outlined,
                                  color: const Color(0xFFFF6B00),
                                  size: 30.w,
                                ),
                              ),
                              SizedBox(width: 15.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Black Friday Sale',
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  Text(
                                    'Posted on 3 Aug 2024, 16:00',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildCampaignStat(
                                '5,974,123',
                                'Reach Account',
                                isWhiteBackground: true,
                              ),
                              _buildCampaignStat(
                                '5.72K',
                                'Delivered',
                                isWhiteBackground: true,
                              ),
                              _buildCampaignStat(
                                '60.5%',
                                'Opened',
                                isWhiteBackground: true,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: TradingInfoSection(),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCampaignStat(
    String value,
    String label, {
    bool isWhiteBackground = false,
  }) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: isWhiteBackground ? Colors.black87 : Colors.white,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: TextStyle(
            fontSize: 12.sp,
            color: isWhiteBackground ? Colors.grey[700] : Colors.grey[400],
          ),
        ),
      ],
    );
  }
}

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Chat Page Content'));
  }
}

class ProfilePage extends StatefulWidget {
  final String userName;
  final String userEmail;
  final String userRole;

  const ProfilePage({
    super.key,
    required this.userName,
    required this.userEmail,
    required this.userRole,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void _showSnackBar(String message, Color color, {String? title}) {
    Color? indicatorColor;
    Color? textColor;
    Color? backgroundColor;

    if (color == Colors.red) {
      indicatorColor = Colors.red;
      backgroundColor = Colors.white;
      textColor = Colors.black87;
      title = title ?? 'Error';
    } else if (color == Colors.green) {
      indicatorColor = Colors.green;
      backgroundColor = Colors.white;
      textColor = Colors.black87;
      title = title ?? 'Sukses';
    } else if (color == Colors.blue) {
      indicatorColor = Colors.blue;
      backgroundColor = Colors.white;
      textColor = Colors.black87;
      title = title ?? 'Informasi';
    } else {
      indicatorColor = Theme.of(context).primaryColor;
      backgroundColor = Colors.white;
      textColor = Colors.black87;
      title = title ?? 'Notifikasi';
    }

    showCustomSnackBar(
      context,
      message: message,
      title: title,
      backgroundColor: backgroundColor,
      textColor: textColor,
      indicatorColor: indicatorColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          loggedOut: () {
            _showSnackBar(
              'Anda telah berhasil keluar dari akun.',
              Colors.green,
              title: 'Berhasil Logout!',
            );
            Future.delayed(const Duration(seconds: 1), () {
              if (context.mounted) {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const LoginPage()),
                  (route) => false,
                );
              }
            });
          },
          error: (message) {
            _showSnackBar(
              'Logout gagal: $message',
              Colors.red,
              title: 'Gagal Logout',
            );
          },
        );
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Padding(
            padding: EdgeInsets.only(left: 15.w),
            child: Center(
              child: Container(
                width: 38.w,
                height: 38.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(3, 3),
                    ),
                  ],
                ),
                child: IconButton(
                  icon: Transform.translate(
                    offset: Offset(2.0, 0.0),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black87,
                      size: 20.w,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ),
          title: Text(
            'Profile',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProfileCard(),
              SizedBox(height: 30.h),
              Text(
                'Settings',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 15.h),
              _buildSettingsList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            spreadRadius: 3,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40.r,
            backgroundImage: const AssetImage(
              'assets/images/onboarding_1.jpeg',
            ),
            backgroundColor: Colors.grey[300],
          ),
          SizedBox(height: 15.h),
          Text(
            widget.userName,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 22.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            widget.userEmail,
            style: TextStyle(color: Colors.grey[600], fontSize: 14.sp),
          ),
          SizedBox(height: 15.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: const Color(0xFFFF6B00),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              widget.userRole.toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            'Premium member since 2023',
            style: TextStyle(color: Colors.grey[500], fontSize: 12.sp),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsList() {
    return Column(
      children: [
        _buildSettingsItem(
          icon: Icons.store,
          text: 'Buat Toko',
          onTap: () {
            debugPrint('Buat Toko clicked');
          },
        ),
        _buildSettingsItem(
          icon: Icons.edit_note,
          text: 'Bahasa',
          onTap: () {
            debugPrint('Update details clicked');
          },
        ),
        _buildSettingsItem(
          icon: Icons.work_outline,
          text: 'Pengaturan Akun',
          onTap: () {
            debugPrint('Manage account clicked');
          },
        ),
        _buildSettingsItem(
          icon: Icons.compare_arrows,
          text: 'Keluar',
          onTap: () {
            showGeneralDialog(
              context: context,
              barrierDismissible: true,
              barrierLabel:
                  MaterialLocalizations.of(context).modalBarrierDismissLabel,
              barrierColor: Colors.black.withOpacity(0.5),
              transitionDuration: const Duration(milliseconds: 300),
              transitionBuilder: (
                context,
                animation,
                secondaryAnimation,
                child,
              ) {
                return ScaleTransition(
                  scale: CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeOutBack,
                  ),
                  child: child,
                );
              },
              pageBuilder: (context, animation, secondaryAnimation) {
                return Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    padding: EdgeInsets.all(24.r),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Apakah kamu yakin ingin keluar dari akun ini?",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.grey[800],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 24.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () => Navigator.of(context).pop(),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey[200],
                                  foregroundColor: Colors.black87,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 12.h),
                                ),
                                child: Text(
                                  "Batal",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 15.w),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  context.read<AuthCubit>().logout();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFFF6B00),
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 12.h),
                                ),
                                child: Text(
                                  "Keluar",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.black87, size: 24.w),
            SizedBox(width: 15.w),
            Expanded(
              child: Text(
                text,
                style: TextStyle(color: Colors.black87, fontSize: 16.sp),
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.grey[500], size: 18.w),
          ],
        ),
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  final List<GlobalKey> _keys = List.generate(4, (_) => GlobalKey());
  double _indicatorWidth = 0.0;
  double _indicatorLeft = 0.0;

  final double _horizontalIndicatorPadding = 15.w;

  final double _itemHeight = 24.w + (10.h * 2);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateIndicatorPosition(widget.selectedIndex);
    });
  }

  @override
  void didUpdateWidget(covariant CustomBottomNavigationBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedIndex != oldWidget.selectedIndex) {
      _updateIndicatorPosition(widget.selectedIndex);
    }
  }

  void _updateIndicatorPosition(int index) {
    if (_keys[index].currentContext != null) {
      final RenderBox renderBoxItem =
          _keys[index].currentContext!.findRenderObject() as RenderBox;
      final RenderBox? renderBoxRow = context.findRenderObject() as RenderBox?;

      if (renderBoxRow != null) {
        final Offset itemPositionInRow = renderBoxRow.globalToLocal(
          renderBoxItem.localToGlobal(Offset.zero),
        );

        setState(() {
          _indicatorWidth =
              renderBoxItem.size.width - (2 * _horizontalIndicatorPadding);
          _indicatorLeft = itemPositionInRow.dx + _horizontalIndicatorPadding;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      padding: EdgeInsets.only(
        bottom: 20.h + MediaQuery.of(context).padding.bottom,
        top: 10.h,
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          if (_indicatorWidth > 0)
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              left: _indicatorLeft,
              width: _indicatorWidth,
              height: _itemHeight,
              top: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFADEED9),
                  borderRadius: BorderRadius.circular(50.r),
                ),
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(4, (index) {
              return _buildNavItem(
                context,
                key: _keys[index],
                icon: _getIconForIndex(index, false),
                selectedIcon: _getIconForIndex(index, true),
                index: index,
              );
            }),
          ),
        ],
      ),
    );
  }

  IconData _getIconForIndex(int index, bool isSelected) {
    switch (index) {
      case 0:
        return isSelected ? Icons.home : Icons.home_outlined;
      case 1:
        return isSelected ? Icons.favorite : Icons.favorite_border;
      case 2:
        return isSelected ? Icons.search : Icons.search;
      case 3:
        return isSelected ? Icons.person : Icons.person_outline;
      default:
        return Icons.error;
    }
  }

  Widget _buildNavItem(
    BuildContext context, {
    required Key key,
    required IconData icon,
    required IconData selectedIcon,
    required int index,
  }) {
    final bool isSelected = index == widget.selectedIndex;

    return Expanded(
      child: InkWell(
        key: key,
        onTap: () {
          widget.onItemTapped(index);
          _updateIndicatorPosition(index);
        },
        customBorder: const StadiumBorder(),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: Icon(
              isSelected ? selectedIcon : icon,
              key: ValueKey<int>(index),
              color: isSelected ? Colors.white : Colors.black54,
              size: 24.w,
            ),
          ),
        ),
      ),
    );
  }
}

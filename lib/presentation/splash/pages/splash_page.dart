import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propedia/constant/app_constant.dart';
import 'package:propedia/controller/splash_controller.dart';
import 'package:propedia/presentation/onboarding/pages/onboarding_page.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage>
    with TickerProviderStateMixin {
  final SplashController _controller = SplashController();

  @override
  void initState() {
    super.initState();
    _controller.init(
      vsync: this,
      onExplosionComplete: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const OnboardingPage()),
        );
      },
      triggerBounce: () => setState(() {}),
      triggerExplosion: () => setState(() {}),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          if (_controller.startExplosion)
            AnimatedBuilder(
              animation: _controller.circleExplosion,
              builder: (_, __) {
                return Positioned(
                  left: (screenSize.width / 2) -
                      (_controller.circleExplosion.value / 2),
                  top: (screenSize.height / 2) -
                      (_controller.circleExplosion.value / 2),
                  child: Container(
                    width: _controller.circleExplosion.value,
                    height: _controller.circleExplosion.value,
                    decoration: const BoxDecoration(
                      color: Colors.lightGreen,
                      shape: BoxShape.circle,
                    ),
                  ),
                );
              },
            ),
          if (!_controller.startExplosion)
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SlideTransition(
                    position: _controller.circleOffset,
                    child: ScaleTransition(
                      scale: _controller.showBounce
                          ? _controller.bounceScale
                          : const AlwaysStoppedAnimation(1.0),
                      child: Container(
                        width: 40.w,
                        height: 40.h,
                        margin: EdgeInsets.symmetric(horizontal: 10.w),
                        decoration: const BoxDecoration(
                          color: Colors.lightGreen,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                  SlideTransition(
                    position: _controller.textOffset,
                    child: Text(
                      kAppName,
                      style: TextStyle(
                        fontSize: 34.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: kMindHubFontFamily,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

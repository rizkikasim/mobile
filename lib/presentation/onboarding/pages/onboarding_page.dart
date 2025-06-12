import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propedia/presentation/auth/pages/login_page.dart';
import 'package:flutter/foundation.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage>
    with TickerProviderStateMixin {
  final PageController _pageController = PageController();
  late AnimationController _progressController;
  int _currentPage = 0;

  final List<String> images = [
    'assets/images/onboarding_1.jpeg',
    'assets/images/onboarding_2.jpeg',
    'assets/images/onboarding_1.jpeg',
    'assets/images/onboarding_2.jpeg',
    'assets/images/onboarding_1.jpeg',
    'assets/images/onboarding_2.jpeg',
  ];

  final List<Map<String, String>> onboardingContent = [
    {
      'title': 'Waktunya Cari Properti Impian!',
      'description':
          'Jangan FOMO! Temukan rumah, apartemen, atau tanah yang pas sama vibes dan budget lo di sini.',
    },
    {
      'title': 'Cek Properti Terbaru Tiap Hari!',
      'description':
          'Update listingan properti paling fresh biar nggak ketinggalan hidden gem. Scroll terus sampai nemu yang klik!',
    },
    {
      'title': 'Atur Filter Biar Makin Pas!',
      'description':
          'Mau rumah minimalis? Apartemen studio? Atau tanah buat investasi? Atur filter biar pencarian lo sat-set-sat-set!',
    },
    {
      'title': 'Investasi Properti? Gas Aja!',
      'description':
          'Dapatkan insight properti biar investasi lo makin cuan. Nggak cuma buat staycation, tapi juga buat masa depan!',
    },
    {
      'title': 'Jual Properti Anti Ribet!',
      'description':
          'Punya properti yang mau dijual? Pasang iklan di sini, dijamin cepet laku dan dapet harga terbaik. Nggak pake lama!',
    },
    {
      'title': 'Gabung Komunitas Sultan Properti!',
      'description':
          'Diskusi, sharing, dan dapet info properti eksklusif bareng komunitas kita. Biar makin jago nego dan cuan!',
    },
  ];

  @override
  void initState() {
    super.initState();
    _progressController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5))
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              if (_currentPage < images.length - 1) {
                _goToNextPage(auto: true);
              } else {
                debugPrint("Onboarding kelar (animasi)! Kuy, langsung login.");
              }
            }
          });
    _startProgress();
  }

  void _startProgress() {
    _progressController.forward(from: 0.0);
  }

  void _pauseProgress() {
    debugPrint("Progress pause dulu.");
    _progressController.stop();
  }

  void _resumeProgress() {
    debugPrint("Progress jalan lagi.");
    if (_progressController.value < 1.0) {
      _progressController.forward();
    }
  }

  void _goToNextPage({bool auto = false}) {
    if (_currentPage < images.length - 1) {
      setState(() {
        _currentPage++;
      });
      _pageController
          .animateToPage(
            _currentPage,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          )
          .then((_) {
            _progressController.reset();
            _progressController.forward();
          });
    } else if (auto) {}
  }

  void _goToPreviousPage() {
    if (_currentPage > 0) {
      setState(() {
        _currentPage--;
      });
      _pageController
          .animateToPage(
            _currentPage,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          )
          .then((_) {
            _progressController.reset();
            _progressController.forward();
          });
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _progressController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    if (_currentPage != index) {
      setState(() {
        _currentPage = index;
      });
      _progressController.reset();
      _progressController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: images.length,
            onPageChanged: _onPageChanged,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    images[index],
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey,
                        child: const Center(
                          child: Icon(
                            Icons.broken_image,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                      );
                    },
                  ),
                  Container(color: Colors.black.withOpacity(0.5)),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 40.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: List.generate(
                            images.length,
                            (i) => Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.w),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(2.r),
                                  child: LinearProgressIndicator(
                                    minHeight: 8.h,
                                    value:
                                        _currentPage == i
                                            ? _progressController.value
                                            : (_currentPage > i ? 1 : 0),
                                    backgroundColor: Colors.white24,
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                          Colors.white,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          onboardingContent[index]['title']!,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          onboardingContent[index]['description']!,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14.sp,
                          ),
                        ),
                        SizedBox(height: 30.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            if (_currentPage == images.length - 1)
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) => const LoginPage(),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF282C31),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.r),
                                    ),
                                    minimumSize: Size(double.infinity, 50.h),
                                    shadowColor: Colors.black.withOpacity(0.4),
                                    elevation: 8,
                                  ),
                                  child: Text(
                                    'gas, Login',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          Positioned.fill(
            child: GestureDetector(
              onLongPressStart: (_) => _pauseProgress(),
              onLongPressEnd: (_) => _resumeProgress(),
              behavior: HitTestBehavior.translucent,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        _goToPreviousPage();
                      },
                      behavior: HitTestBehavior.translucent,
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        if (_currentPage < images.length - 1) {
                          _goToNextPage();
                        } else {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        }
                      },
                      behavior: HitTestBehavior.translucent,
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

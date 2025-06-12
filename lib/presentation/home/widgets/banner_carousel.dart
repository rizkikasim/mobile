import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerCarousel extends StatefulWidget {
  final List<String> imageUrls;

  const BannerCarousel({super.key, required this.imageUrls});

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  final List<Map<String, String>> _bannerTexts = [
    {
      'title': 'Rumah Impian Anda!',
      'subtitle': 'Temukan properti terbaik di kota Anda dengan harga menarik.',
    },
    {
      'title': 'Diskon Spesial Hari Ini!',
      'subtitle':
          'Jangan lewatkan penawaran terbatas untuk berbagai jenis properti.',
    },
    {
      'title': 'Investasi Properti Cerdas',
      'subtitle': 'Mulai perjalanan investasi Anda dengan bimbingan ahli.',
    },
    {
      'title': 'Penawaran Eksklusif!',
      'subtitle': 'Dapatkan keuntungan lebih dengan penawaran khusus member.',
    },
    {
      'title': 'Promo Ramadhan Ceria!',
      'subtitle': 'Berkah Ramadhan, dapatkan properti dengan cicilan ringan.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: _controller,
          options: CarouselOptions(
            height: 180.h,
            autoPlay: true,
            viewportFraction: 0.85,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            aspectRatio: 16 / 9,
            autoPlayInterval: const Duration(seconds: 4),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
            scrollDirection: Axis.horizontal,
          ),
          items:
              widget.imageUrls.asMap().entries.map((entry) {
                int index = entry.key;
                String imageUrl = entry.value;

                String title =
                    (index < _bannerTexts.length)
                        ? _bannerTexts[index]['title']!
                        : 'Judul Default';
                String subtitle =
                    (index < _bannerTexts.length)
                        ? _bannerTexts[index]['subtitle']!
                        : 'Subjudul Default';

                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(15.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.r),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Image.asset(
                                imageUrl,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    color: Colors.grey[200],
                                    child: Center(
                                      child: Icon(
                                        Icons.broken_image,
                                        size: 50.w,
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.black.withOpacity(0.0),
                                      Colors.black.withOpacity(0.6),
                                    ],
                                    stops: const [0.0, 1.0],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 15.h,
                              left: 15.w,
                              right: 15.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    title,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        Shadow(
                                          blurRadius: 4.0,
                                          color: Colors.black.withOpacity(0.5),
                                          offset: const Offset(1.0, 1.0),
                                        ),
                                      ],
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 5.h),
                                  Text(
                                    subtitle,
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.8),
                                      fontSize: 12.sp,
                                      shadows: [
                                        Shadow(
                                          blurRadius: 3.0,
                                          color: Colors.black.withOpacity(0.4),
                                          offset: const Offset(1.0, 1.0),
                                        ),
                                      ],
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              widget.imageUrls.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap:
                      () => _controller.animateToPage(
                        entry.key,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      ),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                    width: _current == entry.key ? 24.w : 8.w,
                    height: 8.w,
                    margin: EdgeInsets.symmetric(
                      vertical: 8.h,
                      horizontal: 4.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4),
                    ),
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }
}

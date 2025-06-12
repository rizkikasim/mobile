import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propedia/presentation/home/pages/search_page.dart';
import 'package:shimmer/shimmer.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({Key? key}) : super(key: key);

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  late Timer _animationTimer;
  final TextEditingController _textController = TextEditingController();
  int _currentHintIndex = 0;
  int _currentCharIndex = 0;
  bool _isTyping = true;
  bool _isLoading = true;

  final List<String> _hintTexts = [
    'Mau cari apa hari ini?',
    'Cari kuliner lezat...',
    'Temukan properti impian...',
    'Butuh layanan pengiriman?',
    'Cari promo menarik...',
  ];

  @override
  void initState() {
    super.initState();
    _textController.text = '';
    _isLoading = true;
    print('CustomSearchBar initState: _isLoading = $_isLoading');

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
          print('CustomSearchBar delayed: _isLoading = $_isLoading');
          _startAnimationCycle();
        });
      }
    });
  }

  void _startAnimationCycle() {
    _animationTimer = Timer.periodic(const Duration(milliseconds: 100), (
      timer,
    ) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      _typeNextChar();
    });
  }

  void _typeNextChar() {
    setState(() {
      final currentFullText = _hintTexts[_currentHintIndex];

      if (_isTyping) {
        if (_currentCharIndex < currentFullText.length) {
          _textController.text = currentFullText.substring(
            0,
            _currentCharIndex + 1,
          );
          _currentCharIndex++;
        } else {
          _isTyping = false;
          _animationTimer.cancel();
          _animationTimer = Timer.periodic(const Duration(milliseconds: 70), (
            timer,
          ) {
            if (!mounted) {
              timer.cancel();
              return;
            }
            _eraseLastChar();
          });
        }
      }
    });
  }

  void _eraseLastChar() {
    setState(() {
      final currentFullText = _hintTexts[_currentHintIndex];

      if (!_isTyping) {
        if (_currentCharIndex > 0) {
          _textController.text = currentFullText.substring(
            0,
            _currentCharIndex - 1,
          );
          _currentCharIndex--;
        } else {
          _animationTimer.cancel();
          _isTyping = true;
          _currentHintIndex = (_currentHintIndex + 1) % _hintTexts.length;
          _currentCharIndex = 0;
          Timer(const Duration(milliseconds: 500), () {
            if (mounted) {
              _startAnimationCycle();
            }
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _animationTimer.cancel();
    _textController.dispose();
    super.dispose();
  }

  void _navigateToSearchPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SearchPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigateToSearchPage(context),
      child: AbsorbPointer(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: Colors.grey.shade300, width: 1.w),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                spreadRadius: 0,
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              TextField(
                controller: _textController,
                readOnly: true,
                style: TextStyle(fontSize: 16.sp, color: Colors.grey.shade700),
                decoration: InputDecoration(
                  hintText: '',
                  prefixIcon: Icon(Icons.search, color: Colors.grey.shade600),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10.h,
                    horizontal: 10.w,
                  ),
                ),
              ),
              if (_isLoading)
                Positioned(
                  left: 50.w,
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[400]!,
                    highlightColor: Colors.grey[100]!,
                    child: Text(
                      'Memuat...',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

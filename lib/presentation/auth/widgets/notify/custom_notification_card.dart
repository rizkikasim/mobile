import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomNotificationCard extends StatelessWidget {
  final String message;
  final String? title;
  final Color? backgroundColor;
  final Color? textColor;
  final VoidCallback? onClosePressed;

  final Color? indicatorColor;
  final TextStyle? titleStyle;
  final TextStyle? messageStyle;
  final double borderRadiusValue;
  final List<BoxShadow>? customBoxShadow;

  const CustomNotificationCard({
    Key? key,
    required this.message,
    this.title,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black87,
    this.onClosePressed,
    this.indicatorColor,
    this.titleStyle,
    this.messageStyle,
    this.borderRadiusValue = 12.0,
    this.customBoxShadow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color actualBackgroundColor = backgroundColor ?? Colors.white;
    final Color actualTextColor = textColor ?? Colors.black87;
    final Color actualIndicatorColor = indicatorColor ?? Colors.red;

    return Container(
      decoration: BoxDecoration(
        color: actualBackgroundColor,
        borderRadius: BorderRadius.circular(borderRadiusValue.r),
        boxShadow:
            customBoxShadow ??
            [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 5.w,
              decoration: BoxDecoration(
                color: actualIndicatorColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(borderRadiusValue.r),
                  bottomLeft: Radius.circular(borderRadiusValue.r),
                ),
              ),
            ),
            SizedBox(width: 16.w),

            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title ?? 'Peringatan',
                      style:
                          titleStyle ??
                          TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: actualTextColor,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      message,
                      style:
                          messageStyle ??
                          TextStyle(
                            fontSize: 13.sp,
                            color: actualTextColor.withOpacity(0.8),
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 12.w, top: 8.h),
              child: Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: onClosePressed,
                  child: Icon(
                    Icons.close,
                    size: 20.w,
                    color: actualTextColor.withOpacity(0.6),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void showCustomSnackBar(
  BuildContext context, {
  required String message,
  String? title,
  Color? backgroundColor,
  Color? textColor,
  Duration duration = const Duration(seconds: 3),
  Color? indicatorColor,
  TextStyle? titleStyle,
  TextStyle? messageStyle,
  double borderRadiusValue = 12.0,
  List<BoxShadow>? customBoxShadow,
}) {
  OverlayEntry? overlayEntry;

  overlayEntry = OverlayEntry(
    builder: (context) {
      return Positioned(
        top: MediaQuery.of(context).padding.top + 10.h,
        left: 20.w,
        right: 20.w,
        child: Material(
          color: Colors.transparent,
          child: CustomNotificationCard(
            message: message,
            title: title,
            backgroundColor: backgroundColor,
            textColor: textColor,
            onClosePressed: () {
              if (overlayEntry != null && overlayEntry.mounted) {
                overlayEntry?.remove();
              }
            },
            indicatorColor: indicatorColor,
            titleStyle: titleStyle,
            messageStyle: messageStyle,
            borderRadiusValue: borderRadiusValue,
            customBoxShadow: customBoxShadow,
          ),
        ),
      );
    },
  );

  Overlay.of(context).insert(overlayEntry);

  Future.delayed(duration, () {
    if (overlayEntry != null && overlayEntry.mounted) {
      overlayEntry?.remove();
    }
  });
}

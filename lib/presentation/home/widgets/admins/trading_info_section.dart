import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TradingInfoSection extends StatelessWidget {
  const TradingInfoSection({super.key});

  // Helper widget for Timeframe Buttons
  Widget _buildTimeframeButton(String text, bool isSelected) {
    return GestureDetector(
      onTap: () {
        debugPrint('$text timeframe selected');
        // Add logic to update selected timeframe state if needed
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.grey[200],
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : Colors.grey[700],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
          // Header: Bitcoin & BTC
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20.w,
                    backgroundColor: Colors.black,
                    child: Text(
                      'B', // Simple Bitcoin logo
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bitcoin',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        'BTC',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Icon(
                Icons.keyboard_arrow_down,
                size: 24.w,
                color: Colors.grey[700],
              ),
            ],
          ),
          SizedBox(height: 20.h),

          // Current Price and Time
          Text(
            '\$39983.38',
            style: TextStyle(
              fontSize: 32.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Text(
            '10:19 PM, Aug 10',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 20.h),

          // Graph Section (simplified using CustomPaint)
          SizedBox(
            height: 120.h, // Height for the graph
            width: double.infinity,
            child: CustomPaint(
              painter: _LineGraphPainter(),
            ),
          ),
          SizedBox(height: 20.h),

          // Timeframe Selectors
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildTimeframeButton('1H', true), // Assuming 1H is selected
              _buildTimeframeButton('1D', false),
              _buildTimeframeButton('1W', false),
              _buildTimeframeButton('1M', false),
              _buildTimeframeButton('1Y', false),
            ],
          ),
          SizedBox(height: 20.h),

          // Total Balance section (approximated from the image, likely a separate component)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Value',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              Text(
                '\$59776', // Updated from previous image
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF4DA8DA),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Custom Painter for the simplified line graph
class _LineGraphPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2.0.w
      ..style = PaintingStyle.stroke;

    final highPaint = Paint()
      ..color = Colors.green[600]!
      ..style = PaintingStyle.fill;

    final lowPaint = Paint()
      ..color = Colors.red[600]!
      ..style = PaintingStyle.fill;

    final Path path = Path();
    path.moveTo(0, size.height * 0.5); // Starting point
    path.lineTo(size.width * 0.15, size.height * 0.7);
    path.lineTo(size.width * 0.30, size.height * 0.4);
    path.lineTo(size.width * 0.45, size.height * 0.5); // Dot position
    path.lineTo(size.width * 0.60, size.height * 0.1); // High point
    path.lineTo(size.width * 0.75, size.height * 0.3);
    path.lineTo(size.width * 0.90, size.height * 0.2);
    path.lineTo(size.width, size.height * 0.4);

    canvas.drawPath(path, paint);

    // Draw the dot at the intersection (approximate)
    final intersectionPoint = Offset(size.width * 0.45, size.height * 0.5);
    canvas.drawCircle(intersectionPoint, 4.w, paint..color = Colors.black..style = PaintingStyle.fill);

    // Draw high value text and dot (approximate from image)
    final highValuePoint = Offset(size.width * 0.60, size.height * 0.1);
    canvas.drawCircle(highValuePoint, 4.w, highPaint); // Green dot
    final textPainterHigh = TextPainter(
      text: TextSpan(
        text: '40,300.00',
        style: TextStyle(
          color: Colors.green[600],
          fontSize: 10.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainterHigh.layout();
    textPainterHigh.paint(
      canvas,
      Offset(highValuePoint.dx + 10.w, highValuePoint.dy - 15.h),
    );

    // Draw low value text (approximate from image)
    final lowValuePoint = Offset(size.width * 0.05, size.height * 0.85);
    final textPainterLow = TextPainter(
      text: TextSpan(
        text: '\$39,778.81',
        style: TextStyle(
          color: Colors.red[600],
          fontSize: 10.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainterLow.layout();
    textPainterLow.paint(
      canvas,
      Offset(lowValuePoint.dx, lowValuePoint.dy),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

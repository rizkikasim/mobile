import 'package:flutter/material.dart';
import 'package:propedia/presentation/home/pages/logic/dashboard_logic.dart';
import 'package:propedia/presentation/home/pages/views/dashboard_view.dart';

class DashboardPage extends StatefulWidget {
  final String userName;
  final String userEmail;

  const DashboardPage({
    super.key,
    required this.userName,
    required this.userEmail,
  });

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late DashboardLogic _dashboardLogic;

  @override
  void initState() {
    super.initState();
    _dashboardLogic = DashboardLogic(
      onUpdate: () {
        if (mounted) {
          setState(() {});
        }
      },
      // --- Tambahkan callback onNavigate di sini ---
      onNavigate: (page) {
        if (mounted) { // Pastikan widget masih mounted sebelum navigasi
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        }
      },
    );
    _dashboardLogic.init();
  }

  @override
  void dispose() {
    _dashboardLogic.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DashboardView(
      userName: widget.userName,
      userEmail: widget.userEmail,
      dashboardLogic: _dashboardLogic, // Meneruskan instance DashboardLogic
    );
  }
}
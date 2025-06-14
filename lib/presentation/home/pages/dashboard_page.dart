import 'package:flutter/material.dart';
import 'package:propedia/presentation/home/pages/logic/dashboard_logic.dart';
import 'package:propedia/presentation/home/pages/views/dashboard_view.dart';
import 'package:propedia/presentation/home/pages/views/dashboard_seller_view.dart';
import 'package:propedia/presentation/home/pages/views/dashboard_admin_view.dart'; // ✅ Tambahkan import ini

class DashboardPage extends StatefulWidget {
  final String userName;
  final String userEmail;
  final String userRole;

  const DashboardPage({
    super.key,
    required this.userName,
    required this.userEmail,
    required this.userRole,
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
      onNavigate: (page) {
        if (mounted) {
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
    final role = widget.userRole.toLowerCase();

    if (role == 'penjual') {
      return DashboardPenjualView(
        userName: widget.userName,
        userEmail: widget.userEmail,
        userRole: widget.userRole,
        dashboardLogic: _dashboardLogic,
      );
    }

    if (role == 'admin') {
      return DashboardAdminView(
        userName: widget.userName,
        userEmail: widget.userEmail,
        userRole: widget.userRole,
        dashboardLogic: _dashboardLogic,
      );
    }

    return DashboardView(
      userName: widget.userName,
      userEmail: widget.userEmail,
      userRole: widget.userRole,
      dashboardLogic: _dashboardLogic,
    );
  }
}

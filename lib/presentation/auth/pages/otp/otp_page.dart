import 'package:flutter/material.dart';
import 'package:propedia/presentation/auth/widgets/otp/otp_page_state.dart';

class OtpPage extends StatefulWidget {
final String userName;
final String userEmail;
final String userRole;
final String phone;

const OtpPage({
  super.key,
  required this.phone,
  required this.userName,
  required this.userEmail,
  required this.userRole,
});


  @override
  State<OtpPage> createState() => OtpPageState();
}

import 'package:flutter/material.dart';

enum UserType { penjual, admin, pembeli }

class RegisterUtils {
  static Map<String, dynamic> checkPasswordStrength(String password) {
    if (password.isEmpty) {
      return {'strength': '', 'color': Colors.grey};
    }

    int score = 0;
    if (password.length >= 8) score++;
    if (password.contains(RegExp(r'[A-Z]'))) score++;
    if (password.contains(RegExp(r'[a-z]'))) score++;
    if (password.contains(RegExp(r'[0-9]'))) score++;
    if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) score++;

    if (score <= 2) {
      return {'strength': 'Weak', 'color': Colors.red};
    } else if (score <= 4) {
      return {'strength': 'Moderate', 'color': Colors.orange};
    } else {
      return {'strength': 'Strong', 'color': Colors.green};
    }
  }
}

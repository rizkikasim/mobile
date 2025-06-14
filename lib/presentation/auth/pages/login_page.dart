// lib/presentation/auth/pages/login_page.dart
import 'package:flutter/material.dart';
import 'package:propedia/presentation/auth/widgets/login/login_page_state.dart'; // Import state yang dipisahkan

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState(); // Menggunakan LoginPageState yang terpisah / logika semuanya ada disini
}
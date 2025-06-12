// lib/presentation/auth/pages/register_page.dart
import 'package:flutter/material.dart';
import 'package:propedia/presentation/auth/widgets/register/register_page_state.dart'; // Import state yang dipisahkan

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => RegisterPageState(); // Menggunakan RegisterPageState yang terpisah
}
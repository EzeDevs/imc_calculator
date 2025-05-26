import 'package:flutter/material.dart';
import 'package:calculadora_de_imc/core/app_colors.dart';
import 'package:calculadora_de_imc/screens/imc_home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.text,
          title: Text('Calculadora de IMC'),
        ),
        backgroundColor: AppColors.background,
        body: ImcHomeScreen(),
      ),
    );
  }
}

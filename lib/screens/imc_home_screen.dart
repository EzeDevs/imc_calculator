import 'package:flutter/material.dart';
import 'package:calculadora_de_imc/components/gender_selector.dart';
import 'package:calculadora_de_imc/components/height_selector.dart';
import 'package:calculadora_de_imc/components/number_selector.dart';
import 'package:calculadora_de_imc/core/app_colors.dart';
import 'package:calculadora_de_imc/core/text_styles.dart';
import 'package:calculadora_de_imc/screens/imc_result_screen.dart';

class ImcHomeScreen extends StatefulWidget {
  const ImcHomeScreen({super.key});

  @override
  State<ImcHomeScreen> createState() => _ImcHomeScreenState();
}

class _ImcHomeScreenState extends State<ImcHomeScreen> {
  int selectedAge = 20;
  int selectedWeight = 80;
  double selectedHeight = 170;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GenderSelector(),
        HeightSelector(
          selectedHeight: selectedHeight,
          onHeightChange: (newHeight) {
            setState(() {
              selectedHeight = newHeight;
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: NumberSelector(
                  title: 'Peso'.toUpperCase(),
                  value: selectedWeight,
                  onDecrement: () {
                    setState(() {
                      selectedWeight--;
                    });
                  },
                  onIncrement: () {
                    setState(() {
                      selectedWeight++;
                    });
                  },
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: NumberSelector(
                  title: 'Edad'.toUpperCase(),
                  value: selectedAge,
                  onDecrement: () {
                    setState(() {
                      selectedAge--;
                    });
                  },
                  onIncrement: () {
                    setState(() {
                      selectedAge++;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => ImcResultScreen(
                          height: selectedHeight,
                          weight: selectedWeight,
                        ),
                  ),
                );
              },
              style: ButtonStyle(
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                backgroundColor: WidgetStateProperty.all(AppColors.primary),
              ),
              child: Text('Calcular tu IMC', style: TextStyles.bodyText),
            ),
          ),
        ),
      ],
    );
  }
}

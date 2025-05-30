import 'package:flutter/material.dart';
import 'package:calculadora_de_imc/core/app_colors.dart';
import 'package:calculadora_de_imc/core/text_styles.dart';

class GenderSelector extends StatefulWidget {
  const GenderSelector({super.key});

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //Male
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedGender = 'Hombre';
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                top: 16,
                bottom: 16,
                right: 8,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color:
                      selectedGender == 'Hombre'
                          ? AppColors.backgroundComponentSelected
                          : AppColors.backgroundComponent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Image.asset('assets/images/male_symbol.png', height: 100),
                      SizedBox(height: 8),
                      Text('Hombre'.toUpperCase(), style: TextStyles.bodyText),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        //Female
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedGender = 'Mujer';
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(
                top: 16,
                bottom: 16,
                right: 16,
                left: 8,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color:
                      selectedGender == 'Mujer'
                          ? AppColors.backgroundComponentSelected
                          : AppColors.backgroundComponent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/female_symbol.png',
                        height: 100,
                      ),
                      SizedBox(height: 8),
                      Text('Mujer'.toUpperCase(), style: TextStyles.bodyText),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

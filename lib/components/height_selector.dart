import 'package:flutter/material.dart';
import 'package:calculadora_de_imc/core/app_colors.dart';
import 'package:calculadora_de_imc/core/text_styles.dart';

class HeightSelector extends StatefulWidget {
  final double selectedHeight;
  final Function(double) onHeightChange;
  const HeightSelector({
    super.key,
    required this.selectedHeight,
    required this.onHeightChange,
  });

  @override
  State<HeightSelector> createState() => _HeightSelectorState();
}

class _HeightSelectorState extends State<HeightSelector> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundComponent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text('Altura'.toUpperCase(), style: TextStyles.bodyText),
            ),
            Text(
              '${widget.selectedHeight.toStringAsFixed(0)} cm',
              style: TextStyle(
                color: AppColors.text,
                fontSize: 38,
                fontWeight: FontWeight.bold,
              ),
            ),
            Slider(
              value: widget.selectedHeight,
              onChanged: (newHeight) {
                widget.onHeightChange(newHeight);
              },
              min: 120,
              max: 220,
              divisions: 100,
              label: '${widget.selectedHeight.toStringAsFixed(0)} cm',
              activeColor: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}

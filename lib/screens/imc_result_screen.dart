import 'package:flutter/material.dart';
import 'package:calculadora_de_imc/core/app_colors.dart';
import 'package:calculadora_de_imc/core/text_styles.dart';

class ImcResultScreen extends StatelessWidget {
  final double height;
  final int weight;
  const ImcResultScreen({
    super.key,
    required this.height,
    required this.weight,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: toolbarResut(),
      body: bodyResult(context),
    );
  }

  Padding bodyResult(BuildContext context) {
    double fixedHeight = height / 100;
    double imcResult = weight / (fixedHeight * fixedHeight);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tu resultado',
            style: TextStyle(
              fontSize: 38,
              color: AppColors.text,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 32),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.backgroundComponent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      getTitleByImc(imcResult),
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: getColorByImc(imcResult),
                      ),
                    ),
                    Text(
                      imcResult.toStringAsFixed(2),
                      style: TextStyle(
                        fontSize: 76,
                        color: getColorByImc(imcResult),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        getInfoByImc(imcResult),
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w400,
                          color: AppColors.text,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ButtonStyle(
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                backgroundColor: WidgetStateProperty.all(AppColors.primary),
              ),
              child: Text('Finalizar', style: TextStyles.bodyText),
            ),
          ),
        ],
      ),
    );
  }

  AppBar toolbarResut() {
    return AppBar(
      title: Text('Resultado'),
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.text,
    );
  }

  Color getColorByImc(double imcResult) {
    return switch (imcResult) {
      < 17.99 => Colors.blue, //IMC Bajo
      < 24.99 => Colors.green, //IMC Normal
      < 29.99 => Colors.orangeAccent, //Sobrepeso
      < 34.99 => Colors.orange, //Obesidad grado 1
      < 39.99 => Colors.deepOrange, //Obesidad grado 2
      _ => Colors.red, //Obesidad grado 3
    };
  }

  String getTitleByImc(double imcResult) {
    return switch (imcResult) {
      < 17.99 => 'Peso Bajo',
      < 24.99 => 'Peso Normal',
      < 29.99 => 'Sobrepeso',
      < 34.99 => 'Obesidad grado 1',
      < 39.99 => 'Obesidad grado 2',
      _ => 'Obesidad grado 3',
    };
  }

  String getInfoByImc(double imcResult) {
    return switch (imcResult) {
      < 17.99 => 'Tu peso está por debajo de lo recomendado.', //IMC Bajo
      < 24.99 => 'Tu peso está en dentro del rango saludable.', //IMC Normal
      < 29.99 => 'Tienes sobrepeso, cuida tu alimentación.', //Sobrepeso
      < 34.99 =>
        'Tienes obesidad grado 1, consulta con un especialista dentro de lo posible.', //Obesidad
      < 39.99 =>
        'Tienes obesidad grado 2, consulta con un especialista prontamente.', //Obesidad
      _ =>
        'Tienes obesidad grado 3, consulta con un especialista urgentemente.', //Obesidad
    };
  }
}

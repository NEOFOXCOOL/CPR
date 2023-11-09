import 'package:catalogue_postes_radio/class/Colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'indecator.dart';

class ChartRadial extends StatefulWidget {

  final double? contentHF;
  final double? contentVHFC;
  final double? contentVHFP;
  final double? contentUHF;
  final double? contentSAT;


  const ChartRadial({required this.contentHF, required this.contentVHFC, required this.contentVHFP,
    required this.contentUHF, required this.contentSAT, super.key});

  @override
  State<ChartRadial> createState() => _ChartRadialState();
}

class _ChartRadialState extends State<ChartRadial> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 18,
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: PieChart(
                  PieChartData(
                    pieTouchData: PieTouchData(
                      touchCallback: (FlTouchEvent event, pieTouchResponse) {
                        setState(() {
                          if (!event.isInterestedForInteractions ||
                              pieTouchResponse == null ||
                              pieTouchResponse.touchedSection == null) {
                            touchedIndex = -1;
                            return;
                          }
                          touchedIndex = pieTouchResponse
                              .touchedSection!.touchedSectionIndex;
                        });
                      },
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 0,
                    centerSpaceRadius: 40,
                    sections: showingSections(),
                  ),
                ),
              ),
            ),
            SizedBox(height: 50.0,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Indicator(
                  color: PaletteColors.chartColorHF,
                  text: 'HF',
                  isSquare: true,
                ),
                SizedBox(
                  width: 18,
                ),
                Indicator(
                  color: PaletteColors.chartColorVHF,
                  text: "VHF",
                  isSquare: true,
                ),
                SizedBox(
                  width: 18,
                ),
                Indicator(
                  color: PaletteColors.chartColorUHF,
                  text: 'UHF',
                  isSquare: true,
                ),
                SizedBox(
                  width: 18,
                ),
                Indicator(
                  color: PaletteColors.chartColorSAT,
                  text: 'SAT',
                  isSquare: true,
                ),
              ],
            ),
            const SizedBox(
              width: 28,
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    double total =
    (widget.contentHF! + widget.contentVHFC! + widget.contentVHFP! + widget.contentUHF! + widget.contentSAT!);
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: PaletteColors.chartColorHF,
            value: widget.contentHF,
            title: (widget.contentHF! * 100 / total).toStringAsFixed(0) + "%",
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: PaletteColors.iconsColor,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: PaletteColors.chartColorVHF,
            value: widget.contentVHFC! + widget.contentVHFP!,
            title: ((widget.contentVHFC! + widget.contentVHFP!) * 100 / total).toStringAsFixed(0) + "%",
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: PaletteColors.iconsColor,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: PaletteColors.chartColorUHF,
            value: widget.contentUHF,
            title: (widget.contentUHF! * 100 / total).toStringAsFixed(0) + "%",
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: PaletteColors.iconsColor,
              shadows: shadows,
            ),
          );
        case 3:
          return PieChartSectionData(
            color: PaletteColors.chartColorSAT,
            value: widget.contentSAT,
            title: (widget.contentSAT! * 100 / total).toStringAsFixed(0) + "%",
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: PaletteColors.iconsColor,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }
}

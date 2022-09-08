import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: const [
          Text('Time spent in bed'),
          Chart(),
          Text('Sleep quality'),
          Chart(),
        ],
      ),
    );
  }
}

class Chart extends StatelessWidget {
  const Chart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.70,
      child: LineChart(
        LineChartData(
          minX: 0,
          minY: 1.5,
          borderData: FlBorderData(
            show: false,
          ),
          titlesData: FlTitlesData(
            show: false,
          ),
          gridData: FlGridData(
            show: false,
          ),
          clipData: FlClipData(top: false, bottom: true, left: true, right: false),
          lineBarsData: [
            LineChartBarData(
              spots: const [
                FlSpot(0, 3),
                FlSpot(2.6, 2),
                FlSpot(4.9, 5),
                FlSpot(6.8, 3.1),
                FlSpot(8, 4),
                FlSpot(9.5, 3),
                FlSpot(11, 4),
              ],
              isCurved: true,
              barWidth: 3,
              isStrokeCapRound: true,
              color: Theme.of(context).colorScheme.surface,
              dotData: FlDotData(
                show: false,
              ),
              belowBarData: BarAreaData(
                show: true,
                color: Theme.of(context).colorScheme.surface.withOpacity(0.2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

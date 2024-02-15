import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class GraphicsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gráficos'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Gráfico de Pizza
            buildPieChartCard(context),
            // Gráfico de Linha
            buildLineChartCard(context),
            // Gráfico de Colunas
            buildBarChartCard(context),
          ],
        ),
      ),
    );
  }

  Widget buildPieChartCard(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Gráfico de Pizza',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: 200, // Defina a altura que preferir
              child: PieChart(
                PieChartData(
                  sectionsSpace: 2,
                  centerSpaceRadius: 40,
                  sections: [
                    PieChartSectionData(
                      color: Colors.blue,
                      value: 40,
                      title: '40%',
                    ),
                    PieChartSectionData(
                      color: Colors.orange,
                      value: 30,
                      title: '30%',
                    ),
                    PieChartSectionData(
                      color: Colors.red,
                      value: 15,
                      title: '15%',
                    ),
                    PieChartSectionData(
                      color: Colors.green,
                      value: 15,
                      title: '15%',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLineChartCard(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Gráfico de Linha',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: 200, // Defina a altura que preferir
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(show: false),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 1),
                        FlSpot(1, 3),
                        FlSpot(2, 10),
                        FlSpot(3, 7),
                        FlSpot(4, 12),
                        FlSpot(5, 13),
                        FlSpot(6, 17),
                      ],
                      isCurved: true,
                      color: Colors.blue,
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBarChartCard(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Gráfico de Colunas',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: 200,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 20,
                  barTouchData: BarTouchData(enabled: false),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          const texts = ['Jan', 'Fev', 'Mar', 'Abr'];
                          return SideTitleWidget(
                            child: Text(texts[value.toInt()]),
                            axisSide: meta.axisSide,
                          );
                        },
                        reservedSize: 42,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  barGroups: [
                    BarChartGroupData(
                      x: 0,
                      barRods: [BarChartRodData(toY: 8, color: Colors.lightBlueAccent)],
                    ),
                    BarChartGroupData(
                      x: 1,
                      barRods: [BarChartRodData(toY: 10, color: Colors.greenAccent)],
                    ),
                    // Adicione mais BarChartGroupData conforme necessário
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

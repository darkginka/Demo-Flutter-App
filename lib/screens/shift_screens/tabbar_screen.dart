import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/charts/bar_chart_screen.dart';
import 'package:flutter_application_1/screens/charts/line_chart_screen.dart';
import 'package:flutter_application_1/screens/charts/pie_chart_screen.dart';
import 'package:flutter_application_1/utils/widgets_decoration.dart';

class TabPageScreen extends StatefulWidget {
  const TabPageScreen({Key? key}) : super(key: key);

  @override
  _TabPageScreenState createState() => _TabPageScreenState();
}

class _TabPageScreenState extends State<TabPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Widgets.tabBar(
      'Charts',
      const [
        Tab(icon: Icon(Icons.bar_chart), text: 'BarChart'),
        Tab(icon: Icon(Icons.stacked_line_chart), text: 'LineChart'),
        Tab(icon: Icon(Icons.pie_chart), text: 'PieChart'),
      ],
      [
        const BarChartDemo(),
        const LineChartDemo(),
        const PieChartDemo(),
      ],
    );
  }
}

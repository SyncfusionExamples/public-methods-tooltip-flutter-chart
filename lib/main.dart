import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  return runApp(ChartApp());
}

class ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chart Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late SfCartesianChart chart;
  late TooltipBehavior tooltip;
  final List<ChartData> chartData = [
    ChartData(10, 17),
    ChartData(20, 34),
    ChartData(30, 25),
    ChartData(40, 10),
    ChartData(50, 28)
// Add the required data
  ];

  @override
  void initState() {
    tooltip = TooltipBehavior(enable: true, shouldAlwaysShow: true);
    chart = SfCartesianChart(
        primaryXAxis: NumericAxis(interval: 10),
        tooltipBehavior: tooltip,
        series: <CartesianSeries>[
          ColumnSeries<ChartData, double>(
              enableTooltip: true,
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              name: 'Tooltip'),
        ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Public Methods')),
        body: Container(
            child: Column(children: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).primaryColor),
            child: Text('Show'),
            onPressed: show,
          ),
          Center(
            child: Container(height: 500, width: 320, child: chart),
          )
        ])));
  }

  void show() {
    tooltip.showByIndex(0, 1);
  }

  void hide() {
    tooltip.hide();
  }
}

class ChartData {
  ChartData(this.x, this.y);

  final double x;
  final double y;
}

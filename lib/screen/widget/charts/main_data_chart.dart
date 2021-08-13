import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:intl/intl.dart';
import 'package:website/data/network_cases_state.dart';

class MainDataChart extends StatefulWidget {
  const MainDataChart({Key? key}) : super(key: key);

  @override
  _MainDataChartState createState() => _MainDataChartState();
}

class _MainDataChartState extends State<MainDataChart> {
  var data = {};
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    await getMsiaTotalCases().then((value) {
      setState(() {
        data = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final staticTicks = <TickSpec<String>>[
      new TickSpec('2021-08-15',
          label: '15 Aug.',
          style: new TextStyleSpec(
              color: new Color(r: 0x255, g: 0x255, b: 0x255))),
      new TickSpec('2021-08-01',
          label: 'Aug.',
          style: new TextStyleSpec(
              color: new Color(r: 0x255, g: 0x255, b: 0x255))),
      new TickSpec('2021-07-15', label: "15 Jul. "),
    ];

    return AnimatedSwitcher(
      duration: Duration(milliseconds: 500),
      child: data.isNotEmpty ? BarChart(
        _createSampleData(data),
        animate: true,
        customSeriesRenderers: [
         LineRendererConfig(
    
            includeArea: true,
            stacked: false,
            includeLine: true,
          ),
        ],
        selectionModels: [
          SelectionModelConfig(
              type: SelectionModelType.info,
              changedListener: (SelectionModel model) {
                if (model.hasDatumSelection) {
                  var selectedDatum = [];
                  model.selectedDatum.forEach((SeriesDatum datumPair) {
                    selectedDatum.add({'color': Colors.grey, 'text': '"AVC'});
                  });
                }
              })
        ],
        behaviors: [
          SeriesLegend(
            position: BehaviorPosition.top,
            horizontalFirst: false,
            desiredMaxRows: 2,
            cellPadding: EdgeInsets.only(right: 4.0, bottom: 4.0),
          ),
          SelectNearest(eventTrigger: SelectionTrigger.tapAndDrag),
        ],
        domainAxis: new OrdinalAxisSpec(
            tickProviderSpec: StaticOrdinalTickProviderSpec(staticTicks),
            renderSpec: new SmallTickRendererSpec(
                minimumPaddingBetweenLabelsPx: 20,
                labelStyle: new TextStyleSpec(
                    fontSize: 12, // size in Pts.
                    color: MaterialPalette.black),
                lineStyle: new LineStyleSpec(color: MaterialPalette.black))),
        primaryMeasureAxis: new NumericAxisSpec(
          tickProviderSpec: new BasicNumericTickProviderSpec(),
        ),
      ) : CircularProgressIndicator(),
    );
  }

  List<Series<Cases, String>> _createSampleData(Map data) {
    final List<Cases> dailyCases = [];

    data.forEach((key, value) {
      var total = int.parse(value["Total"]);
      var x = new Cases(key, total);
      dailyCases.add(x);
    });

    var totalLength = dailyCases.length;

    List<Cases> newCases =
        List.from(dailyCases.getRange(totalLength - 30, totalLength));

    return [
      new Series<Cases, String>(
        seriesColor:  Color(r: 0x0, g: 0x0, b: 0x0),
        id: 'Malaysia Cases',
        domainFn: (Cases sales, _) => sales.date,
        measureFn: (Cases sales, _) => sales.sales,
        data: newCases,
      )
    ];
  }
}

/// Sample ordinal data type.
class Cases {
  final String date;
  final int sales;

  Cases(this.date, this.sales);
}


import 'package:grizzly_io/io_loader.dart';
import 'package:website/common/endpoint.dart';

Future<Map> getCasesByState() async {
  Map<String, Map> casesByDate = {};
  try {
    
    final tsv = await requestLTsv(casesByStateDomain);
    var casesData = tsv.rows;

    casesData.forEach((element) {

      var data = element[0].toString();
      var x = data.split(",");

      var _date = x[0];
      var _state = x[1];
      var _casesNumber = x[2];

      if (casesByDate.containsKey(_date)) {
        var cases = casesByDate[_date] ?? {};
        cases[_state] = _casesNumber;
      } else {
        casesByDate.putIfAbsent(_date, () => {_state: _casesNumber});
      }

      
    });

     
  } catch (e) {
    print(e);
  }
 return casesByDate;
}


Future<Map> getDeathByState() async {
  Map<String, Map> casesByDate = {};
  try {
    
    final tsv = await requestLTsv(deathByStateDomain);
    var casesData = tsv.rows;

    casesData.forEach((element) {

      var data = element[0].toString();
      var x = data.split(",");

      var _date = x[0];
      var _state = x[1];
      var _casesNumber = x[2];

      if (casesByDate.containsKey(_date)) {
        var cases = casesByDate[_date] ?? {};
        cases[_state] = _casesNumber;
      } else {
        casesByDate.putIfAbsent(_date, () => {_state: _casesNumber});
      }

      
    });

     
  } catch (e) {
    print(e);
  }
 return casesByDate;
}

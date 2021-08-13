
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


Future<Map> getMsiaTotalCases() async {
  Map<String, Map> casesByDate = {};
  try {
    
    final tsv = await requestLTsv(msiaCasesDomain);
    var casesData = tsv.rows;

    casesData.forEach((element) {

      var data = element[0].toString();
      var x = data.split(",");

      var _date = x[0];
      var _casesNumber = x[1];
      var _importCluster = x[2];
      var _religiousCluster = x[3];
      var _communityCluster = x[4];
      var _highRiskCluster = x[5];
      var _educationCluster = x[6];
      var _detentionCluster = x[7];
      var _workplaceCluster = x[8];

      
        casesByDate.putIfAbsent(_date, () => {
          "Total": _casesNumber,
          "cluster_import":_importCluster,
          "cluster_religious": _religiousCluster,
          "cluster_community": _communityCluster,
          "cluster_highRisk": _highRiskCluster,
          "cluster_education": _educationCluster,
          "cluster_detentionCentre": _detentionCluster,
          "cluster_workplace": _workplaceCluster
          });
      

      
    });

     
  } catch (e) {
    print(e);
  }
 return casesByDate;
}

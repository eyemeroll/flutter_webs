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

      casesByDate.putIfAbsent(
          _date,
          () => {
                "Total": _casesNumber,
                "cluster_import": _importCluster,
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

Future<Map> getIcuCasesByDate() async {
  Map<String, Map> icuCasesByDate = {};
  try {
    final tsv = await requestLTsv(icuCasesDomain);
    var casesData = tsv.rows;

    casesData.forEach((element) {
      var data = element[0].toString();
      var x = data.split(",");

      var _date = x[0];
      var _state = x[1];
      var _beds_icu = x[2];
      var _beds_icu_rep = x[3];
      var _beds_icu_total = x[4];
      var _beds_icu_covid = x[5];
      var _vent = x[6];
      var _vent_port = x[7];
      var _icu_covid = x[8];
      var _icu_pui = x[9];
      var _icu_noncovid = x[10];
      var _vent_covid = x[11];
      var _vent_pui = x[12];
      var _vent_noncovid = x[13];

      if (icuCasesByDate.containsKey(_date)) {
        var cases = icuCasesByDate[_date] ?? {};
        cases[_state] = {
          "bed_icu": _beds_icu,
          "bed_icu_rep": _beds_icu_rep,
          "bed_icu_total": _beds_icu_total,
          "bed_icu_covid": _beds_icu_covid,
          "vent": _vent,
          "vent_port": _vent_port,
          "icu_covid": _icu_covid,
          "icu_pui": _icu_pui,
          "icu_noncovid": _icu_noncovid,
          "vent_covid": _vent_covid,
          "vent_pui": _vent_pui,
          "vent_noncovid": _vent_noncovid
        };
      } else {
        icuCasesByDate.putIfAbsent(
            _date,
            () => {
                  _state: {
                    "bed_icu": _beds_icu,
                    "bed_icu_rep": _beds_icu_rep,
                    "bed_icu_total": _beds_icu_total,
                    "bed_icu_covid": _beds_icu_covid,
                    "vent": _vent,
                    "vent_port": _vent_port,
                    "icu_covid": _icu_covid,
                    "icu_pui": _icu_pui,
                    "icu_noncovid": _icu_noncovid,
                    "vent_covid": _vent_covid,
                    "vent_pui": _vent_pui,
                    "vent_noncovid": _vent_noncovid
                  }
                });
      }
    });
  } catch (e) {
    print(e);
  }
  return icuCasesByDate;
}

Future<Map> getVaccineByStateDate() async {
  Map<String, Map> casesByDate = {};
  try {
    final tsv = await requestLTsv(citfVaccineDomain);
    var casesData = tsv.rows;

    casesData.forEach((element) {
      var data = element[0].toString();
      var x = data.split(",");

      var _date = x[0];
      var _state = x[1];
      var _doseOneDaily = x[2];
      var _doseTwoDaily = x[3];
      var _totalDoseDaily = x[4];
      var _doseOneCumulative = x[5];
      var _doseTwoCumulative = x[6];
      var _totalDoseCumulative = x[7];

      if (casesByDate.containsKey(_date)) {
        var cases = casesByDate[_date] ?? {};
        cases[_state] = {
          "doseOneDaily": _doseOneDaily,
          "doseTwoDaily": _doseTwoDaily,
          "totalDoseDaily": _totalDoseDaily,
          "doseOneCumulative": _doseOneCumulative,
          "doseTwoCumulative": _doseTwoCumulative,
          "totalDoseCumulative": _totalDoseCumulative,
        };
      } else {
        casesByDate.putIfAbsent(
            _date,
            () => {
                  _state: {
                    "doseOneDaily": _doseOneDaily,
                    "doseTwoDaily": _doseTwoDaily,
                    "totalDoseDaily": _totalDoseDaily,
                    "doseOneCumulative": _doseOneCumulative,
                    "doseTwoCumulative": _doseTwoCumulative,
                    "totalDoseCumulative": _totalDoseCumulative,
                  }
                });
      }
    });
  } catch (e) {
    print(e);
  }
  return casesByDate;
}

Future<Map> getMalaysiaPop() async {
  Map<String, Map> casesByDate = {};
  try {
    final tsv = await requestLTsv(msiaPopDomain);
    var casesData = tsv.rows;

    casesData.forEach((element) {
      var data = element[0].toString();
      var x = data.split(",");

      var _state = x[0];
      var _idx = x[1];
      var _pop = x[2];
      var _popUnderEighteen = x[3];
      var _popOverSixty = x[4];

      casesByDate.putIfAbsent(
          _state,
          () => {
                "idx": _idx,
                "pop": _pop,
                "popUnderEighteen": _popUnderEighteen,
                "popOverSixty": _popOverSixty,
              });
    });
  } catch (e) {
    print(e);
  }
  return casesByDate;
}

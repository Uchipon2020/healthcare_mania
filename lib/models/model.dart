class model{
  int _id;
  String _title;
  double _height;      //
  double _weight;    //体重 *
  double _waist;      //腹囲 *
  double _rightEye;  //右視力 *
  double _leftEye;   //左視力 *
  double _hearingRight1000;//聴力右1000Hz *
  double _hearingLeft1000;  // *
  double _hearingRight4000; //*
  double _hearingLeft4000; //*
  double _xRay;
  double _lowBloodPressure;//下血圧 *
  double _highBloodPressure;//上血圧 *
  double _redBlood;    //貧血検査・赤血球数 *
  double _hemoglobin;   //貧血検査・血色素量 *
  double _got;          //肝機能検査 *
  double _gpt;          //肝機能検査 *
  double _gtp;          //ガンマ  *
  double _ldl;          //血中資質検査 *
  double _hdl;          //*
  double _neutralFat;  //中性脂肪 *
  double _bloodGlucose;//血統空腹時
  double _hA1c;         //血統A1c
  double _ecg;          //心電図
  DateTime _createDay;   //受診日
  DateTime _onTheDay;         //更新日
  int _priority;

  model(
      this._id,
      this._title,
      this._height,
      this._weight,
      this._waist,
      this._rightEye,
      this._leftEye,
      this._hearingRight1000,
      this._hearingLeft1000,
      this._hearingRight4000,
      this._hearingLeft4000,
      this._xRay,
      this._lowBloodPressure,
      this._highBloodPressure,
      this._redBlood,
      this._hemoglobin,
      this._got,
      this._gpt,
      this._gtp,
      this._ldl,
      this._hdl,
      this._neutralFat,
      this._bloodGlucose,
      this._hA1c,
      this._ecg,
      this._createDay,
      this._onTheDay,
      this._priority);

  int get priority => _priority;

  set priority(int value) {
    _priority = value;
  }

  DateTime get onTheDay => _onTheDay;

  set onTheDay(DateTime value) {
    _onTheDay = value;
  }

  DateTime get createDay => _createDay;

  set createDay(DateTime value) {
    _createDay = value;
  }

  double get ecg => _ecg;

  set ecg(double value) {
    _ecg = value;
  }

  double get hA1c => _hA1c;

  set hA1c(double value) {
    _hA1c = value;
  }

  double get bloodGlucose => _bloodGlucose;

  set bloodGlucose(double value) {
    _bloodGlucose = value;
  }

  double get neutralFat => _neutralFat;

  set neutralFat(double value) {
    _neutralFat = value;
  }

  double get hdl => _hdl;

  set hdl(double value) {
    _hdl = value;
  }

  double get ldl => _ldl;

  set ldl(double value) {
    _ldl = value;
  }

  double get gtp => _gtp;

  set gtp(double value) {
    _gtp = value;
  }

  double get gpt => _gpt;

  set gpt(double value) {
    _gpt = value;
  }

  double get got => _got;

  set got(double value) {
    _got = value;
  }

  double get hemoglobin => _hemoglobin;

  set hemoglobin(double value) {
    _hemoglobin = value;
  }

  double get redBlood => _redBlood;

  set redBlood(double value) {
    _redBlood = value;
  }

  double get highBloodPressure => _highBloodPressure;

  set highBloodPressure(double value) {
    _highBloodPressure = value;
  }

  double get lowBloodPressure => _lowBloodPressure;

  set lowBloodPressure(double value) {
    _lowBloodPressure = value;
  }

  double get xRay => _xRay;

  set xRay(double value) {
    _xRay = value;
  }

  double get hearingLeft4000 => _hearingLeft4000;

  set hearingLeft4000(double value) {
    _hearingLeft4000 = value;
  }

  double get hearingRight4000 => _hearingRight4000;

  set hearingRight4000(double value) {
    _hearingRight4000 = value;
  }

  double get hearingLeft1000 => _hearingLeft1000;

  set hearingLeft1000(double value) {
    _hearingLeft1000 = value;
  }

  double get hearingRight1000 => _hearingRight1000;

  set hearingRight1000(double value) {
    _hearingRight1000 = value;
  }

  double get leftEye => _leftEye;

  set leftEye(double value) {
    _leftEye = value;
  }

  double get rightEye => _rightEye;

  set rightEye(double value) {
    _rightEye = value;
  }

  double get waist => _waist;

  set waist(double value) {
    _waist = value;
  }

  double get weight => _weight;

  set weight(double value) {
    _weight = value;
  }

  double get height => _height;

  set height(double value) {
    _height = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }
}
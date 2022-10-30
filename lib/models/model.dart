class model{
  int _id;
  String _title;
  int _height;
  model(this._id, this._title, this._height);


  int get id => _id;
  set id(int value) {
    _id = value;
  }

  String get title => _title;
  set title(String value) {
    _title = value;
  }

  int get height => _height;
  set height(int value) {
    _height = value;
  }



}
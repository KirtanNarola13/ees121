class WorkModel {
  List workSet;
  List workRecived;

  WorkModel({required this.workRecived, required this.workSet});

  factory WorkModel.fromApi({required Map data}) {
    return WorkModel(
        workRecived: data['workRecived'], workSet: data['workSet']);
  }
}

class LoginDataModel {
  String email;
  String password;
  LoginDataModel({required this.email, required this.password});
}

class PromptDataModel {
  String prompt;
  String res;
  PromptDataModel({required this.prompt, required this.res});
}

class QueryModel {
  int counter = 0;
  late String dttm;
  final List<dynamic> data;
  QueryModel({required this.counter, required this.dttm, required this.data});
  factory QueryModel.fromJson(Map<String, dynamic> json) {
    return QueryModel(
        counter: json['counter'],
        dttm: json['dttm'],
        data: json['data']
            .map((value) => QueryModel.fromJson(value))
            .toList());
  }
}
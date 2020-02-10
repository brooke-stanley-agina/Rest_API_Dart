import 'package:my_app/my_app.dart';

class Read extends Serializable{
  String title;
  String author;
  int year;

  @override
  Map<String, dynamic> asMap() => {
       'title': title,
       'author': author,
       'year': year
     };
  

  @override
  void readFromMap(Map<String, dynamic> requestBody) {
   title = requestBody['title'] as String;
   author = requestBody['author'] as String;
   year = requestBody['title'] as int;
  }

}
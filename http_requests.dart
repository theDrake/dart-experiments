import 'package:http/http.dart' as http;

main() async {
  // Make a GET request:
  var url = 'http://httpbin.org/';
  var response = await http.get(url);
  print("Response status: ${response.statusCode}");
  print("Response body: ${response.body}");

  // Make a POST request:
  url = 'http://httpbin.org/post';
  response = await http.post(url, body: 'name=doodle&color=blue');
  print("Response status: ${response.statusCode}");
  print("Response body: ${response.body}");
}

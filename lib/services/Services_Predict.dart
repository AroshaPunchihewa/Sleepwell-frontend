import 'package:http/http.dart' as http;



Future<void> callPredictApi() async {
  final url = Uri.parse('http://127.0.0.1:5000/predict');
  final response = await http.post(url, body: [[3,2,3,0],[1,1,1,0]]);

  if (response.statusCode == 200) {
    // Handle the successful response
    print(response.body);
  } else {
    // Handle the error response
    print('Error: ${response.statusCode}');
  }
}


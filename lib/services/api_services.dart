import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:timbu_api_app/models/product.dart';
import 'package:timbu_api_app/providers/constants.dart';

class ApiService {

  Future<Product> fetchProducts() async {
    const url =
        '$kbaseUrl?organization_id=$korganizationId&reverse_sort=false&page=1&size=25&Appid=$kappId&Apikey=$kapiKey';
    
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      Product mapProducts = Product.fromJson(data);

      // print(mapProducts);

      // print('wahala ${data.map((items) => Product.fromJson(items)).toList()}');
      return mapProducts;
    } else {
      // print('Failed to load products: ${response.statusCode}');
      throw Exception('Failed to load products');
    }
  }
}
//   Future<List<Product>> fetchProducts() async {
//     final response = await http.get(
//       Uri.parse(baseUrl),
//       headers: {
//         'Authorization': 'Bearer $apiKey',
//       },
//     );

//     if (response.statusCode == 200) {
//       print('Response recieved: ${response.body}');
//       List<dynamic> data = json.decode(response.body)['data'];
//       return data.map((product) => Product.fromJson(product)).toList();
//     } else {
//       print('Failed to load products: ${response.statusCode}');
//       throw Exception('Failed to load products');
//     }
//   }
// }


// curl -H "Authorization: Bearer  ade3a017aae344c5b3f2fc32598cfd6e20240708233703962021" -H "Accept: application/json" https://api.timbu.cloud/products


  // Future<String> login() async {
  //   final response = await http.post(
  //     Uri.parse('https://api.timbu.cloud/auth/login'),
  //     headers: {'Content-Type': 'application/json'},
  //     body: json.encode({
  //       'email': 'michaelcee2000@gmail.com',
  //       'password': 'Mike12345',
  //     }),
  //   );

  //   if (response.statusCode == 200) {
  //     final data = json.decode(response.body);
  //     return data['access_token'];
  //   } else {
  //     throw Exception('Failed to login: ${response.statusCode}');
  //   }
  // }
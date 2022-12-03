import 'package:cards_app/data/model/card_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiService {
  Future<List<CardsModel>> getAllProducts() async {
    try {
      Response response = await http
          .get(Uri.parse("https://banking-api.free.mockoapp.net/user_cards"));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        List<CardsModel> categories = (jsonData as List?)
                ?.map((item) => CardsModel.fromJson(item))
                .toList() ??
            [];
        return categories;
      } else {
        throw Exception();
      }
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }
  }
}

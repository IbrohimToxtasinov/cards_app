import 'package:cards_app/data/api_service/api_sevice.dart';
import 'package:cards_app/data/model/card_model.dart';

class AppRepository {
  AppRepository({required ApiService apiService}) {
    _apiService = apiService;
  }

  late ApiService _apiService;

  Future<List<CardsModel>> getCardsInfo() => _apiService.getAllProducts();
}

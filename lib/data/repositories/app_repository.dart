import 'package:cards_app/data/api_service/api_sevice.dart';
import 'package:cards_app/data/local_db/local_db.dart';
import 'package:cards_app/data/model/card_model.dart';

class AppRepository {
  AppRepository({
    required ApiService apiService,
    required LocalDatabase localDatabase,
  }) {
    _apiService = apiService;
    _localDatabase = localDatabase;
  }

  late ApiService _apiService;
  late LocalDatabase _localDatabase;

  Future<List<CardsModel>> getCardsInfo() => _apiService.getAllProducts();
}
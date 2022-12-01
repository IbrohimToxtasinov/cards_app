import 'package:cards_app/data/model/card_model.dart';
import 'package:cards_app/data/repositories/app_repository.dart';
import 'package:flutter/foundation.dart';

class CardsViewModel extends ChangeNotifier {
  CardsViewModel({required AppRepository appRepository}) {
    _appRepository = appRepository;
  }

  late AppRepository _appRepository;

  bool isLoading = false;

  CardsModel? cardsData;

  fetchCardsInfo() async {
    notify(true);
    cardsData = (await _appRepository.getCardsInfo()) as CardsModel?;
    notify(false);
  }

  notify(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
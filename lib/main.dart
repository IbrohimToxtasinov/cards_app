import 'package:cards_app/data/api_service/api_sevice.dart';
import 'package:cards_app/data/local_db/local_db.dart';
import 'package:cards_app/data/repositories/app_repository.dart';
import 'package:cards_app/screens/home_page.dart';
import 'package:cards_app/view_model/cards_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  AppRepository appRepository = AppRepository(apiService: ApiService(), localDatabase: LocalDatabase());
  CardsViewModel cardsViewModel = CardsViewModel(appRepository: appRepository);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => cardsViewModel),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      
    );
  }
}

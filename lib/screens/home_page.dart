import 'package:cards_app/view_model/cards_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  hexColor(String colorhexcode) {
    String colornew = '0xff$colorhexcode';
    colornew = colornew.replaceAll("#", "");
    int colorint = int.parse(colornew);
    return colorint;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<CardsViewModel>(
            builder: (context, cardsViewModel, child) {
              return cardsViewModel.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : (cardsViewModel.cards.isEmpty
                      ? const Text("Hozircha malumot yo'q")
                      : Expanded(
                          child: ListView.builder(
                              itemCount: cardsViewModel.cards.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: const EdgeInsets.only(
                                      top: 15, bottom: 15, left: 20, right: 20),
                                  padding: const EdgeInsets.all(20),
                                  height: 200,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Color(hexColor(cardsViewModel
                                              .cards[index].colors.colorA)),
                                          Color(hexColor(cardsViewModel
                                              .cards[index].colors.colorB)),
                                        ]),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        cardsViewModel
                                            .cards[index].bankName,
                                        style: const TextStyle(
                                            fontSize: 22,
                                            color: Colors.white),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 20, top: 15),
                                        height: 30,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          color: Color(hexColor('F6E304')),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Column(
                                          children: [
                                            const Divider(thickness: 1, color: Colors.black, height: 12,),
                                            const Divider(thickness: 1, color: Colors.black, height: 2),
                                            const Divider(thickness: 1, color: Colors.black),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }),
                        ));
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CardsViewModel>().fetchCardsInfo();
        },
        child: const Icon(Icons.download),
      ),
    );
  }
}

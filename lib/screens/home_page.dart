import 'package:cards_app/utils/images.dart';
import 'package:cards_app/utils/styles.dart';
import 'package:cards_app/view_model/cards_view_model.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  hexColor(String colorhexcode) {
    String colornew = '0xff$colorhexcode';
    colornew = colornew.replaceAll("#", "");
    int colorint = int.parse(colornew);
    return colorint;
  }

  hexcardnumber(String colorhexcode) {
    String colornew = colorhexcode;
    colornew = colornew.replaceAll(" ", "  ");
    return colornew;
  }

  @override
  void initState() {
    Future.microtask(() => 
    context.read<CardsViewModel>().fetchCardsInfo());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cards"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<CardsViewModel>(
            builder: (context, cardsViewModel, child) {
              return cardsViewModel.isLoading
                  ? Center(child: Lottie.asset(AppImages.lottieLoading))
                  : (cardsViewModel.cards.isEmpty
                      ? const Text("Hozircha malumot yo'q")
                      : Expanded(
                          child: ListView.builder(
                              itemCount: cardsViewModel.cards.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: const EdgeInsets.only(
                                      top: 15, bottom: 15, left: 20, right: 20),
                                  padding: const EdgeInsets.only(
                                      top: 11, right: 20, left: 20, bottom: 14),
                                  height: 220,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          SizedBox(
                                            height: 40,
                                            child: Image.asset(
                                                AppImages.bankIcon[index]),
                                          ),
                                          Text(
                                            cardsViewModel
                                                .cards[index].bankName,
                                            style: const TextStyle(
                                                fontSize: 22,
                                                color: Colors.white),
                                          ),
                                          const Spacer(),
                                          Container(
                                              height: 40,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          cardsViewModel
                                                              .cards[index]
                                                              .iconImage)))),
                                        ],
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(
                                            left: 20, top: 15),
                                        height: 30,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          color: Color(hexColor('F6E304')),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Column(
                                          children: const [
                                            Divider(
                                              thickness: 0.5,
                                              color: Colors.black,
                                              height: 14,
                                            ),
                                            Divider(
                                                thickness: 0.5,
                                                color: Colors.black,
                                                height: 2),
                                            Divider(
                                                thickness: 0.5,
                                                color: Colors.black,
                                                height: 14),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(
                                            left: 18, top: 15),
                                        child: Text(
                                            hexcardnumber(cardsViewModel
                                                .cards[index].cardNumber),
                                            style: MyStyles.credic.copyWith(
                                                fontSize: 14,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400)),
                                      ),
                                      const SizedBox(height: 10),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                          horizontal: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2 -
                                              84,
                                        ),
                                        child: Text("01/24",
                                            style: MyStyles.credic.copyWith(
                                                fontSize: 14,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400)),
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                              left: 18,
                                            ),
                                            child: Text(
                                              "Ibrohim Toxtasinov",
                                              style: MyStyles.regular.copyWith(
                                                fontSize: 16,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          const Icon(Icons.more_vert,
                                              color: Colors.white, size: 36),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ));
            },
          )
        ],
      ),
    );
  }
}

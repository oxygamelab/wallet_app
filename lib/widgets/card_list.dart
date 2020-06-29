import 'package:flutter/material.dart';
import 'package:wallet_app/models/card_model.dart';
import 'package:wallet_app/screens/card_page.dart';
import 'package:wallet_app/widgets/card_view.dart';

class CardList extends StatelessWidget {
  final List<CardModel> cards;

  const CardList({Key key, this.cards}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(left: 20.0),
      scrollDirection: Axis.horizontal,
      children: getChildCards(context),
    );
  }

  List<Widget> getChildCards(context) {
    return cards
        .map(
          (e) => GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CardPage(card: e),
              ),
            ),
            child: CardView(
              card: e,
            ),
          ),
        )
        .toList();
  }
}

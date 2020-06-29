import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/models/card_model.dart';
import 'package:wallet_app/providers/card_provider.dart';
import 'package:wallet_app/widgets/card_view.dart';

class CardPage extends StatefulWidget {
  final CardModel card;

  CardPage({this.card});

  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  void _removeCard(CardModel card) {
    Provider.of<CardProvider>(context, listen: false).removeCard(card);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 241, 242, 1),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Card Page',
            style: TextStyle(
              color: Colors.black,
            )),
        backgroundColor: Color.fromRGBO(238, 241, 242, 1),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black45,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.black45,
            ),
            onPressed: () => _removeCard(widget.card),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Transform.translate(
            offset: Offset.fromDirection(0, 30.0),
            child: Container(
              height: 210.0,
              child: CardView(card: widget.card),
            ),
          ),
        ),
      ),
    );
  }
}

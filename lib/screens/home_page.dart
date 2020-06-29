import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/providers/card_provider.dart';
import 'package:wallet_app/widgets/card_list.dart';
import '../models/transaction_model.dart';
import '../screens/add_card.dart';
import '../widgets/transaction_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Provider.of<CardProvider>(context).initialState();

    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 241, 242, 1),
      appBar: AppBar(
        brightness: Brightness.light,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Home Page',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Color.fromRGBO(238, 241, 242, 1),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => AddCard(),
              ),
            ),
            icon: Icon(
              Icons.add,
              color: Colors.black45,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Provider.of<CardProvider>(context).getCardLength() > 0
                  ? Container(
                      height: 210.0,
                      child: Consumer<CardProvider>(
                        builder: (context, cards, widget) => CardList(
                          cards: cards.allCards,
                        ),
                      ),
                    )
                  /* CardView(
                      card: CardModel(
                          available: 1000,
                          currency: 'US',
                          name: 'MasterCard',
                          number: '1234 **** **** 1234'),
                    ) */
                  : Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.0),
                      width: double.infinity,
                      height: 210.0,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Add your new card',
                            style: TextStyle(
                              color: Colors.black38,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Icon(
                            Icons.add_circle_outline,
                            color: Colors.black38,
                            size: 36.0,
                          ),
                        ],
                      ),
                    ),
              SizedBox(height: 30.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Text(
                      'Last Transactions',
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15.0),
                    TransactionView(
                      trans: TransactionModel(
                          type: '-', price: 1200, name: 'Shopping'),
                    ),
                    TransactionView(
                      trans:
                          TransactionModel(type: '+', price: 900, name: 'Work'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

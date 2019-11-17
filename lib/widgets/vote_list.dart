import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voting_app/models/vote.dart';
import 'package:voting_app/state/vote.dart';

typedef Color RandomColor();

class VoteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RandomColor colorPicker = getAlternate(start: 0);

    return Consumer<VoteState>(
      builder: (context, voteState, child) => Column(
        children: <Widget>[for (Vote vote in voteState.voteList)
            Card(
              child: ListTile(
                title: Container(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    vote.title,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black
                    ),
                  ),
                ),
              ),
              color: colorPicker(),
            )
        ],
      )
    );
  }

  RandomColor getAlternate ({ int start = 0 }) {
    int indexNum = start;

    Color getColor() {
      Color color = indexNum %2 == 0
        ? Colors.teal[100]
        : Colors.blueAccent[100];

      ++indexNum;

      return color;
    }

    return getColor;
  }
}

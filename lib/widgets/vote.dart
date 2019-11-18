import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voting_app/models/vote.dart';
import 'package:voting_app/state/vote.dart';

class VoteWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Vote activeVote = Provider.of<VoteState>(context).activeVote;
    List<String> options = List<String>();

    for (Map<String, int> option in activeVote.options) {
      option.forEach((title, value) {
        options.add(title);
      });
    }

    return Column(
      children: <Widget>[
        Card(
          child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          child: Text(
            activeVote.title,
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.teal),
          ),
        )),
        for (String option in options)
          Card(
            child: InkWell(
              onTap: () {
                Provider.of<VoteState>(context).selectedOptionInVote = option;
              },
              child: IntrinsicHeight(
                child: Row(
                  children: <Widget>[
                    Container(
                      constraints: BoxConstraints(
                        minHeight: 60,
                      ),
                      width: 8,
                      color: Colors.green,
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        color: Provider.of<VoteState>(context).selectedOptionInVote == option
                          ? Colors.green
                          : Colors.white,
                        child: Text(
                          option,
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
      ],
    );
  }
}

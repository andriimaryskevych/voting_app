import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:voting_app/models/vote.dart';
import 'package:voting_app/services/vote.dart';

class VoteState with ChangeNotifier {
  List<Vote> _voteList = List<Vote>();
  Vote _activeVote;
  String _selectedOptionInVote;

  void loadVoteList () {
    _voteList = getVoteList();
    notifyListeners();
  }

  void clearState () {
    _activeVote = null;
    _selectedOptionInVote = null;
  }

  List<Vote> get voteList => _voteList;
  Vote get activeVote => _activeVote;
  String get selectedOptionInVote => _selectedOptionInVote;

  set activeVote(Vote newValue) {
    _activeVote = newValue;
    notifyListeners();
  }

  set selectedOptionInVote(String selectedOption) {
    _selectedOptionInVote = selectedOption;
    notifyListeners();
  }

}
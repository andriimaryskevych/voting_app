class Vote {
  String id;
  String title;
  List<Map<String, int>> options;

  Vote({ this.id, this.title, this.options });
}

class Voter {
  String uid;
  String voteId;
  int markedVoteOption;

  Voter({ this.uid, this.voteId, this.markedVoteOption });
}
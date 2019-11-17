import 'package:uuid/uuid.dart';
import 'package:voting_app/models/vote.dart';

List<Vote> getVoteList () {
  List<Vote> voteList = List<Vote>();

  voteList.add(Vote(
    id: Uuid().v4(),
    title: 'Best mobile framework?',
    options: [
      { 'Flutter': 70 },
      { 'ReactNative': 10 },
      { 'Xamarive': 3 },
    ]
  ));

  voteList.add(Vote(
    id: Uuid().v4(),
    title: 'Best frontend framework?',
    options: [
      { 'Angular': 70 },
      { 'React': 10 },
      { 'Vue': 3 },
    ]
  ));

  voteList.add(Vote(
    id: Uuid().v4(),
    title: 'Best backend framework?',
    options: [
      { 'Laravel': 70 },
      { 'Express.js': 10 },
      { '.NET Core': 3 },
    ]
  ));

  return voteList;
}
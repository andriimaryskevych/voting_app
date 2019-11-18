import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voting_app/state/vote.dart';
import 'package:voting_app/widgets/vote.dart';
import 'package:voting_app/widgets/vote_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  int _currentStep = 0;

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      Provider.of<VoteState>(context, listen: false).clearState();
      Provider.of<VoteState>(context, listen: false).loadVoteList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Stepper(
              type: StepperType.horizontal,
              currentStep: _currentStep,
              steps: [
                getStep(
                  title: 'Choose',
                  child: VoteList(),
                  isActive: true
                ),
                getStep(
                  title: 'Vote',
                  child: VoteWidget(),
                  isActive: step2Allowed()
                )
              ],
              onStepContinue: () {
                setState(() {
                  if (_currentStep == 0) {
                    if (step2Allowed()) {
                      _currentStep = (_currentStep + 1) > 1 ? 1 : _currentStep + 1;
                    } else {
                      showSnackBar(context, 'Please select a vote first');
                    }
                  } else if (_currentStep == 1) {
                    if (step3Allowed()) {
                      Navigator.pushReplacementNamed(context, '/result');
                    } else {
                      showSnackBar(context, 'Please mark your choise!');
                    }
                  }
                });
              },
              onStepCancel: () {
                setState(() {
                  if (_currentStep <= 0) {
                    Provider.of<VoteState>(context).activeVote = null;
                  }

                  if(_currentStep <= 1) {
                    Provider.of<VoteState>(context).selectedOptionInVote = null;
                  }

                  _currentStep = (_currentStep - 1) < 0 ? 0 : _currentStep - 1;
                });
              },
            ),
          )
        ],
      ),
    );
  }

  bool step2Allowed () => Provider.of<VoteState>(context).activeVote != null;
  bool step3Allowed () => Provider.of<VoteState>(context).selectedOptionInVote != null;

  void showSnackBar (BuildContext context, String msg) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(
        msg,
        style: TextStyle(
          fontSize: 22
        ),
      ),
    ));
  }

  Step getStep({String title, Widget child, bool isActive = false}) {
    return Step(title: Text(title), content: child, isActive: isActive);
  }
}

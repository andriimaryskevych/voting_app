import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voting_app/state/vote.dart';
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
                  child: Text('vote content'),
                  isActive: true
                )
              ],
              onStepContinue: () {
                setState(() {
                  _currentStep = (_currentStep + 1) > 1 ? 1 : _currentStep + 1;
                });
              },
              onStepCancel: () {
                setState(() {
                  _currentStep = (_currentStep - 1) < 0 ? 0 : _currentStep - 1;
                });
              },
              onStepTapped: (int index) {
                setState(() {
                  _currentStep = index;
                });
              },
            ),
          )
        ],
      ),
    );
  }

  Step getStep({String title, Widget child, bool isActive = false}) {
    return Step(title: Text(title), content: child, isActive: isActive);
  }
}

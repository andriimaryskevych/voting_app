import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _LaunchState createState() => _LaunchState();
}

class _LaunchState extends State<HomePage> {
  int _currentStep = 0;

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
                  child: Text('choose conenet'),
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

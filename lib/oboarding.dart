import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        body: PageView.builder(itemBuilder: (_, i) {
          return Column(
            children: [
              SizedBox(
                height: 120,
              ),
              new Image.asset('images/icon_man.png', height: 200),
              SizedBox(
                height: 45,
              ),
              Text('Kontaktliste',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 35)),
              SizedBox(
                height: 35,
              ),
              Text(
                'Mithilfe dieser App behältst du deine Kontakte im Überblick.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 45,
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
                onPressed: () {
                  Navigator.pushNamed(context, '/main');
                },
                padding: EdgeInsets.all(16.0),
                color: Color.fromRGBO(0, 160, 227, 1),
                textColor: Colors.white,
                child: Text("Weiter", style: TextStyle(fontSize: 19)),
              ),
            ],
          );
        }));
  }
}

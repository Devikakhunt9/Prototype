import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
void main() {
  runApp(FanRegulatorApp());
}

class FanRegulatorApp extends StatefulWidget {
  @override
  State<FanRegulatorApp> createState() => _FanRegulatorAppState();
}

class _FanRegulatorAppState extends State<FanRegulatorApp> {
  double slidervalue = 0.0;
  double _rotationAngle = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startRotation();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fan Regulator'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Transform.rotate(
                angle: slidervalue==0?0.0: _rotationAngle * (3.1415927 / 180),
                child: FaIcon(
                FontAwesomeIcons.fan,
                  size: 100.0,
                ),
              ),
              Text(
                'Fan Speed',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(slidervalue.toString()),
              Slider(
                value: slidervalue,
                onChanged: (newValue) {
                  setState(() {
                    slidervalue = newValue;
                  });
                  // Implement logic to control the fan speed.
                },
              ),
              // RaisedButton(
              //   onPressed: () {
              //     // Implement logic to turn the fan on/off.
              //   },
              //   child: Text('Turn On/Off'),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  void startRotation() {
    print(slidervalue);
    Future.delayed(Duration(milliseconds: ( slidervalue.toInt()==1?(slidervalue - 0.05).toInt():slidervalue.toInt()*1000)), () {
      setState(() {
        _rotationAngle += 1; // Increment the rotation angle
        if (_rotationAngle >= 360) {
          _rotationAngle = 0; // Reset angle to 0 when it reaches 360
        }
      });
      startRotation(); // Recursively call to continue rotation
    });
  }
}

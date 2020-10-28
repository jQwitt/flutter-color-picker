import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'ColorPicker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class ColorInternal {
    double _r = 0;
    double get r => _r;
    double _b = 0;
    double get b => _b;
    double _g = 0;
    double get g => _g;

    ColorInternal();

    void setR(double v) {
      // if (v > -1 && v <= 255)
        this._r = v;
    }
    void setB(double v) {
      // if (v >= 0 && v <= 255)
        this._b = v;
    }
    void setG(double v) {
      // if (v >= 0 && v <= 255)
        this._g = v;
    }
    
    String toString() {
      return 'R: ${this.r.round()} B: ${this.b.round()} G: ${this.g.round()}';
    }
  }

class _MyHomePageState extends State<MyHomePage> {
  ColorInternal _color = new ColorInternal();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '${_color.toString()}',
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                backgroundColor: Colors.black,
              ),
            ),
            Slider(
              value: _color.r,
              min: 0,
              max: 255,
              divisions: 255,
              activeColor: Colors.red,
              label: 'Red',
              onChanged: (double v) {
                setState(() {
                  _color.setR(v);
                });
              },
            ),
            Slider(
              value: _color.b,
              min: 0,
              max: 255,
              divisions: 255,
              activeColor: Colors.blue,
              label: 'Blue',
              onChanged: (double v) {
                setState(() {
                  _color.setB(v);
                });
              },
            ),
            Slider(
              value: _color.g,
              min: 0,
              max: 255,
              divisions: 255,
              activeColor: Colors.green,
              label: 'Green',
              onChanged: (double v) {
                setState(() {
                  _color.setG(v);
                });
              },
            )
          ],
        ),
      ),
      backgroundColor: Color.fromRGBO(_color.r.round(), _color.b.round(), _color.g.round(), 1),
    );
  }
}

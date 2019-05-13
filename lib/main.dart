import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(title: 'Tip Calculator', home: new TipCalculator()));
}

class TipView extends StatelessWidget {
  double _billAmount = 0.0;
  
  TipView(this._billAmount);

  @override
  Widget build(BuildContext context) {
      double _tipPercentage1 = 10;
      double _tipPercentage2 = 15;
      double _tipPercentage3 = 20;
      double _calculatedTip1 = 0;
      double _calculatedTip2 = 0;
      double _calculatedTip3 = 0;
      double _total1 = 0;
      double _total2 = 0;
      double _total3 = 0;
      _calculatedTip1 = _billAmount * _tipPercentage1 / 100.0;
      String _calTip1str = _calculatedTip1.toStringAsFixed(2);
      _total1 = _billAmount + _calculatedTip1;
      String _total1str = _total1.toStringAsFixed(2);
      _calculatedTip2 = _billAmount * _tipPercentage2 / 100.0;
      String _calTip2str = _calculatedTip2.toStringAsFixed(2);
      _total2 = _billAmount + _calculatedTip2;  
      String _total2str = _total2.toStringAsFixed(2);
      _calculatedTip3 = _billAmount * _tipPercentage3 / 100.0;
      String _calTip3str = _calculatedTip3.toStringAsFixed(2);
      _total3 = _billAmount + _calculatedTip3;
      String _total3str = _total3.toStringAsFixed(2);


       Column _buildButtonColumn(Color color, String emoji, Widget) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("\n"+
          emoji, style: TextStyle(fontSize: 35),
        ),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Widget
        ),
      ],
    );
  }

    var widget1 = new Text("10% Tip: \$$_calTip1str \n"
                  "Total: \$$_total1str",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red[300]));
    var widget2= new Text("15% Tip: \$$_calTip2str \n"
                  "Total: \$$_total2str",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white));
    var widget3 = new Text("20% Tip: \$$_calTip3str \n"
                  "Total: \$$_total3str",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.greenAccent));

  Color color = Theme.of(context).primaryColor;

  Widget buttonSection = Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, "😥", widget1),
        _buildButtonColumn(color, "😐", widget2),
        _buildButtonColumn(color, "😀", widget3),
      ],
    ),
  );
    
    return buttonSection;
  }
}
class TipCalculator extends StatefulWidget {
  _TipCalculatorState createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {
  double _billAmount = 0.0;


  @override
  Widget build(BuildContext context) {
// Create first input field
    TextField billAmountField = new TextField(
      keyboardType: TextInputType.number,
      onChanged: (String value) {
        setState(() {
                try {
                  _billAmount = double.parse(value);
    
                } catch (exception) {
                  _billAmount = 0.0; 
                } 
                
        });
      },
      decoration: new InputDecoration(labelText: "Bill amount(\$)"),
    );

    Container container = new Container(
        padding: const EdgeInsets.all(16.0),
        decoration: new BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [const Color(0xFFffffff), const Color(0xFF96a7ff)],
            tileMode: TileMode.clamp,
          )
        ),
        child: new Column(
            children: [Image.network("https://localtvkdvr.files.wordpress.com/2015/03/tipping.jpeg?quality=85&strip=all&w=1200", width: 500, height: 140, fit:BoxFit.cover),
             billAmountField, new TipView(_billAmount)]));

    AppBar appBar = new AppBar(title: new Text("Tip Calculator"));

    Scaffold scaffold = new Scaffold(resizeToAvoidBottomPadding: false, appBar: appBar, body: container);
    return scaffold;
  }
}
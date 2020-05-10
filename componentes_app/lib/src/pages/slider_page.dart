import 'package:flutter/material.dart';

class SlidersPage extends StatefulWidget {

  @override
  _SlidersPageState createState() => _SlidersPageState();
}

class _SlidersPageState extends State<SlidersPage> {

  double _valorSlider = 100.0;
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders Page'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            //_crearCheckbox(),
            _crearCheckbox2(),
            _crearSwitch(),
            Divider(),
            Expanded(child: _crearImagen()),
          ],
          ),
      ),
      );
  }

  Widget _crearSlider(){
    return Slider(
      activeColor: Colors.indigo,
      inactiveColor: Colors.amber,
      label: 'Valor: ${_valorSlider.toInt()}',
      divisions: 300,
      value: _valorSlider,
      min: 10.0,
      max: 400.0,
      onChanged: (_isChecked) ? null : (valor){
        setState(() {
          _valorSlider = valor;
        });
      },
      );
  }


// Forma chafa
  Widget _crearCheckbox(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Bloquear Slider: ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
        Checkbox(
          value: _isChecked,
          activeColor: Colors.green,
          checkColor: Colors.blueGrey,
          onChanged: (valor){
            setState(() {
              _isChecked = valor;
            });
          }
          ),
      ],
    );
  }

// Forma con texto
  Widget _crearCheckbox2(){
    return CheckboxListTile(
      value: _isChecked,
      onChanged: (valor){
        setState(() {
          _isChecked = valor;
        });
      },
      activeColor: Colors.green,
      checkColor: Colors.blueGrey,
      title: Text('Bloquear Slider'),
      subtitle: Text('Con este checkbox deshabilitamos el slider'),
      );
  }

  Widget _crearSwitch(){
    return SwitchListTile(
      onChanged: (valor){
        setState(() {
          _isChecked = valor;
        });
      },
      title: Text('Switch para bloquear el Slider'),
      subtitle: Text('Este switch hace lo mismo que el checkbox de arriba'),
      activeColor: Colors.green,
      value: _isChecked,
    );
  }

  Widget _crearImagen(){
    return FadeInImage(
      placeholder: AssetImage('data/assets/jar-loading.gif'),
      image: NetworkImage('https://upload.wikimedia.org/wikipedia/en/1/19/Batman_%28circa_2016%29.png'),
      fit: BoxFit.contain,
      width: _valorSlider,
      height: _valorSlider,
    );
  }

}
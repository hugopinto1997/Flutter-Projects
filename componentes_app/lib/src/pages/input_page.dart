import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  
  String _nombre = '';
  String _email = '';
  String _pass = '';
  String _date = '';
  String _opcionSeleccionada = 'Volar';

  List<String> _poderes = ['Volar','Inmortalidad','Super velocidad', 'Invisibilidad'];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs Page'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona(),
          Divider(),
        ],
      ),
    );
  }

  Widget _crearInput(){
      return TextField(
        onChanged: (valor) {
           setState(() {
             _nombre = valor;
           });
           },
        autofocus: true,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),

          ),
          counter: Text('Cantidad de letras: ${_nombre.length.toString()}'),
          hintText: 'Introduzca el texto',
          labelText: 'Nombre',
          helperText: 'helper text',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle),



        ),
      );
  }

  Widget _crearEmail(){
    return TextField(
        onChanged: (valor) {
           setState(() {
             _email = valor;
           });
           },
           keyboardType: TextInputType.emailAddress,
        //autofocus: true,
        //textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),

          ),
          //counter: Text('Cantidad de letras: ${_nombre.length.toString()}'),
          hintText: 'Introduzca el email',
          labelText: 'Correo',
          //helperText: 'helper text',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email),



        ),
      );
  }

  Widget _crearPassword(){
    return TextField(
        onChanged: (valor) {
           setState(() {
             _pass = valor;
           });
           },
           obscureText: true,
           //keyboardType: TextInputType.emailAddress,
        //autofocus: true,
        //textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),

          ),
          //counter: Text('Cantidad de letras: ${_nombre.length.toString()}'),
          hintText: 'Introduzca la password',
          labelText: 'Password',
          //helperText: 'helper text',
          suffixIcon: Icon(Icons.text_format),
          icon: Icon(Icons.lock),



        ),
      );
  }

  Widget _crearFecha(BuildContext context){
    return TextField(
           controller: _inputFieldDateController,
           onTap: (){
             FocusScope.of(context).requestFocus(new FocusNode());
             _selectDate(context);
           },
           enableInteractiveSelection: false,
           keyboardType: TextInputType.datetime,
           //obscureText: true,
           //keyboardType: TextInputType.emailAddress,
        //autofocus: true,
        //textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),

          ),
          //counter: Text('Cantidad de letras: ${_nombre.length.toString()}'),
          hintText: 'Introduzca la fecha',
          labelText: 'Fecha de nacimientp',
          //helperText: 'helper text',
          suffixIcon: Icon(Icons.calendar_today),
          icon: Icon(Icons.calendar_view_day),



        ),
      );
  }

  _selectDate(BuildContext context) async {

    DateTime picked = await showDatePicker(context: context, initialDate: new DateTime.now(), firstDate: new DateTime(2018), lastDate: new DateTime(2038), locale: Locale('es','ES'));

    if(picked != null){
      setState(() {
        _date = picked.toIso8601String();
        _inputFieldDateController.text = _date;
      });
    }

  }

   List<DropdownMenuItem<String>> getOpts() {
        List<DropdownMenuItem<String>> lista = new List();

        _poderes.forEach((poder){
          lista.add(DropdownMenuItem(
            child: Text(poder),
            value: poder,
            )
          );
        });
        return lista;
    }

  Widget _crearDropdown(){
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0,),
        Expanded(
        child: 
          DropdownButton(
            value: _opcionSeleccionada,
            items: getOpts(),
            onChanged: (opt){
            setState(() {
              _opcionSeleccionada = opt;
            });
            },
          ),
        )
      ],
    );
  }

  Widget _crearPersona(){
    return ListTile(
      title: Text('Su nombre es: $_nombre'),
      subtitle: Text('Email: $_email'),
      trailing: Text(_opcionSeleccionada),

    );
  }

}
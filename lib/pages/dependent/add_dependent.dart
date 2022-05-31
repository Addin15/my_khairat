import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_khairat/styles/app_color.dart';

class AddDependent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PageView(
        children: [
          _Tanggungan(),
        ],
      ),
    );
  }
}

class _Tanggungan extends StatefulWidget {
  @override
  _TanggunganState createState() => _TanggunganState();
}

class _TanggunganState extends State<_Tanggungan> {
  List<TextEditingController> _nameControllers = [];
  List<TextField> _nameFields = [];
  List<TextEditingController> _relationshipControllers = [];
  List<TextField> _relationshipFields = [];

  @override
  void dispose() {
    for (final controller in _nameControllers) {
      controller.dispose();
    }
    for (final controller in _relationshipControllers) {
      controller.dispose();
    }

    _okController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.primary,
          ),
          body: Column(
            children: [
              SizedBox(height: 10,),
              Expanded(child: _listView()),
              Row(children: [Expanded(child: _addTile()), Expanded(child: _removeTile()),]),
              _okButton(context),


            ],
          )),
    );
  }

  Widget _addTile() {
    return ListTile(
      title: Icon(Icons.add),
      tileColor: Colors.green[200],
      onTap: () {
        final name = TextEditingController();
        final relationship = TextEditingController();

        final nameField = _generateTextField(name, "Nama Tanggungan");
        final relationshipField = _generateTextField(relationship, "Hubungan");

        setState(() {
          _nameControllers.add(name);
          _relationshipControllers.add(relationship);
          _nameFields.add(nameField);
          _relationshipFields.add(relationshipField);
        });
      },
    );
  }

  Widget _removeTile() {
    return ListTile(
      title: Icon(Icons.remove),
      tileColor: Colors.red[200],
      onTap: () {
        final name = TextEditingController();
        final relationship = TextEditingController();

        final nameField = _generateTextField(name, "Nama Tanggungan");
        final relationshipField = _generateTextField(relationship, "Hubungan");

        if (_nameControllers.length>0){
        setState(() {
          _nameControllers.removeLast();
          _relationshipControllers.removeLast();
          _nameFields.removeLast();
          _relationshipFields.removeLast();
        }
        );}
      },
    );
  }

  TextField _generateTextField(TextEditingController controller, String hint) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: hint,
      ),
    );
  }

  Widget _listView() {
    final children = [
      for (var i = 0; i < _nameControllers.length; i++)
        Container(
          margin: EdgeInsets.fromLTRB(10, 15, 10, 15),
          child: InputDecorator(
            child: Column(
              children: [
                _nameFields[i],
                _relationshipFields[i],
              ],
            ),
            decoration: InputDecoration(
              labelText: (i+1).toString(),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
    ];
    return SingleChildScrollView(
      child: Column(
        children: children,
      ),
    );
  }

  final _okController = TextEditingController();
  Widget _okButton(BuildContext context) {


    final button = ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: AppColor.primary,),
      onPressed: () async {
        String text = '';
        //final index = int.parse(_okController.text);
        for (var index = 0; index < _nameControllers.length; index++) {
         text = text + (index+1).toString() +".\nNama: ${_nameControllers[index].text}\n" +
              "Hubungan: ${_relationshipControllers[index].text}\n\n";
        }
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text("Senarai Tanggungan"),
              content: new Text(text),
              actions: <Widget>[
                new FlatButton(
                  child: new Text("OK"),
                  color: AppColor.primary,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },

      child: Text("Selesai"),
    );

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        button,
      ],
    );
  }
}

class _GroupControllers {
  TextEditingController name = TextEditingController();
  TextEditingController relationship = TextEditingController();
  void dispose() {
    name.dispose();
    relationship.dispose();
  }
}

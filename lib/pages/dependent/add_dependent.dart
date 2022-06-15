import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_khairat/styles/app_color.dart';
import 'package:ionicons/ionicons.dart';
import 'package:my_khairat/DAO/dependent_dao.dart';
import 'package:my_khairat/models/dependent.dart';
import 'package:sizer/sizer.dart';

class AddDependent extends StatefulWidget {
  const AddDependent(
      {required this.userID, required this.dependentDAO, Key? key})
      : super(key: key);

  final String userID;
  final DependentDAO dependentDAO;

  @override
  _AddDependentState createState() => _AddDependentState();
}

class _AddDependentState extends State<AddDependent> {
  List<TextEditingController> _nameControllers = [];
  List<TextField> _nameFields = [];
  List<TextEditingController> _relationshipControllers = [];
  List<TextField> _relationshipFields = [];
  List<TextEditingController> _icControllers = [];
  List<TextField> _icFields = [];
  bool _validate = false;

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final name = TextEditingController();
    final relationship = TextEditingController();
    final ic = TextEditingController();

    final nameField = _generateTextField(name, "Nama Tanggungan");
    final relationshipField = _generateTextField(relationship, "Hubungan");
    final icField = _generateTextField(ic, "No. Kad Pengenalan (tanpa '-')");

    setState(() {
      _nameControllers.add(name);
      _relationshipControllers.add(relationship);
      _icControllers.add(ic);
      _nameFields.add(nameField);
      _relationshipFields.add(relationshipField);
      _icFields.add(icField);
    });
  }

  @override
  void dispose() {
    for (final controller in _nameControllers) {
      controller.dispose();
    }
    for (final controller in _relationshipControllers) {
      controller.dispose();
    }
    for (final controller in _icControllers) {
      controller.dispose();
    }

    _okController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PageView(
        children: [
          Scaffold(
              appBar: AppBar(
                backgroundColor: AppColor.primary,
              ),
              body: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(child: _listView()),
                  Row(children: [
                    Expanded(child: _addTile()),
                    Expanded(child: _removeTile()),
                  ]),
                  _okButton(context),
                ],
              ))
        ],
      ),
    );
  }

  Widget _addTile() {
    return ListTile(
      title: Icon(Icons.add),
      tileColor: Colors.green[200],
      onTap: () {
        final name = TextEditingController();
        final relationship = TextEditingController();
        final ic = TextEditingController();

        final nameField = _generateTextField(name, "Nama Tanggungan");
        final relationshipField = _generateTextField(relationship, "Hubungan");
        final icField = _generateTextField(ic, "No. Kad Pengenalan (tanpa '-')");

        setState(() {
          _nameControllers.add(name);
          _relationshipControllers.add(relationship);
          _icControllers.add(ic);
          _nameFields.add(nameField);
          _relationshipFields.add(relationshipField);
          _icFields.add(icField);
        });
      },
    );
  }

  Widget _removeTile() {
    return ListTile(
      title: Icon(Icons.remove),
      tileColor: Colors.red[200],
      onTap: () {
        if (_nameControllers.length > 1) {
          setState(() {
            _nameControllers.removeLast();
            _relationshipControllers.removeLast();
            _icControllers.removeLast();
            _nameFields.removeLast();
            _relationshipFields.removeLast();
            _icFields.removeLast();
          });
        }
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
                _icFields[i],
              ],
            ),
            decoration: InputDecoration(
              labelText: (i + 1).toString(),
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
        primary: AppColor.primary,
      ),
      onPressed: () async {
        _validate = false;
        String text = '';
        //final index = int.parse(_okController.text);
        for (var index = 0; index < _nameControllers.length; index++) {
          if (_nameControllers[index].text.length == 0 ||
              _relationshipControllers[index].text.length == 0 ||
              _icControllers[index].text.length == 0 ||
              isNumeric(_icControllers[index].text)==false||
              _icControllers[index].text.length != 12 ) {
            _validate = true;
          }
        }

        if (_validate == true) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                //no kad pengenalan or ic number must be 12 digit
                title: new Text("Isi Maklumat Dengan Betul"),
                content: new Text("1. Tiada ruangan dibiarkan kosong \n\n"
                    "2. No. Kad Pengenalan diisi dengan betul (tanpa '-')"),
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
        } else {
          dynamic res;
          for (var index = 0; index < _nameControllers.length; index++) {
            res = await widget.dependentDAO.addDependent(
                widget.userID,
                DependentModel(
                  dependent_name: _nameControllers[index].text,
                  dependent_relation: _relationshipControllers[index].text,
                  dependent_ic: _icControllers[index].text,
                ));
          }
          Navigator.pop(context, res);
        }
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

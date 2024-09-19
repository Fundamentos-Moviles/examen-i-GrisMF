import 'package:flutter/material.dart';
import 'package:examen1_mfg/utils/constante.dart' as Fondo;

class MoreInfo extends StatefulWidget {
  @override
  _MoreInfoState createState() => _MoreInfoState();
}

class _MoreInfoState extends State<MoreInfo> {
  int nDivs = 1;
  List<int> rowsDivs = [];

  Color _getColor(int index) {
    return index % 2 == 0 ? Fondo.a : Fondo.b;
  }

  void addDivision() {
    setState(() {
      if (nDivs < 12) {
        nDivs++;
      } else {
        rowsDivs.add(12);
        nDivs = 1;
      }
    });
  }

  Widget addRow(int divisions) {
    return Row(
      children: List.generate(
        divisions,
            (index) => Expanded(
          child: Container(
            height: 100,
            color: _getColor(index),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
           backgroundColor: Fondo.botones,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: EdgeInsets.symmetric(horizontal: 120), // Más largo horizontalmente y más alto
          ),
          onPressed: addDivision,
          child: Text(
            'Iniciar Sesión',
            style: TextStyle(color: Fondo.texto), 
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ...rowsDivs.map((divisions) => addRow(divisions)).toList(),
                addRow(nDivs),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

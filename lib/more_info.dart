import 'package:flutter/material.dart';

class MoreInfo extends StatefulWidget {
  @override
  _MoreInfoState createState() => _MoreInfoState();
}

class _MoreInfoState extends State<MoreInfo> {
  int nDivs = 1;
  List<int> rowsDivs = [];

  Color _getColor(int index) {
    return index % 2 == 0 ? Colors.black : Colors.grey;
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
          onPressed: addDivision,
          child: Text('Iniciar Sesión'),
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

import 'package:flutter/material.dart';
import 'package:examen1_mfg/utils/constante.dart' as Fondo;
import 'package:examen1_mfg/more_info.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center (
            child:Text('Notificaciones de actividades'),
        ),


        backgroundColor: Fondo.fondo4,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: Fondo.listaExamen.length,
              itemBuilder: (context, index) {
                final item = Fondo.listaExamen[index].split('#');
                final id = item[0];
                final numero = int.parse(item[1]);
                final titulo = item[2];
                final descripcion = item[3];
                final estrellas = int.parse(item[4]);

                // Verificar si el número es par o impar y usar el constructor adecuado
                if (numero % 2 == 0) {
                  return CustomCard.even(numero, titulo, descripcion, estrellas);
                } else {
                  return CustomCard.odd(numero, titulo, descripcion, estrellas);
                }
              },
            ),
          ),
          // Aquí está el footer con tu nombre
          Container(
            padding: const EdgeInsets.all(10),
            color: Fondo.fondo4,
            child: const Text(
              'GRISELDA MARTÍNEZ FLORES',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final int numero;
  final String titulo;
  final String descripcion;
  final int estrellas;
  final bool isEven;

  // Constructor para números pares
  CustomCard.even(this.numero, this.titulo, this.descripcion, this.estrellas)
      : isEven = true;

  // Constructor para números impares
  CustomCard.odd(this.numero, this.titulo, this.descripcion, this.estrellas)
      : isEven = false;

  @override
  Widget build(BuildContext context) {
    return isEven ? _buildEvenCard() : _buildOddCard();
  }

  // Diseño para números pares
  Widget _buildEvenCard() {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: Colors.lightBlueAccent.withOpacity(0.3), // Color de fondo diferente
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  numero.toString(),
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        titulo,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Nota: $descripcion',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Fondo.a,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: List.generate(
                    estrellas,
                        (index) => const Icon(Icons.star, color: Colors.yellow),
                  ),
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:Fondo.botones,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: const Text('Ver más'),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Fondo.botones,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: const Text('Borrar'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Diseño para números impares
  Widget _buildOddCard() {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: Colors.greenAccent.withOpacity(0.3), // Color de fondo diferente
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  numero.toString(),
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        titulo,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Nota: $descripcion',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Fondo.a,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: List.generate(
                    estrellas,
                        (index) => const Icon(Icons.star, color: Colors.yellow),
                  ),
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Fondo.botones,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: const Text('Ver más'),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Fondo.botones,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: const Text('Borrar'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


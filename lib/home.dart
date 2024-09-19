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
    return isEven ? _buildEvenCard(context) : _buildOddCard(context);
  }

  //Diseño pares
  Widget _buildEvenCard(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Bordes redondeados
      ),
      elevation: 5, // Sombra para un ligero efecto flotante
      color: Fondo.cd, // Fondo blanco de la tarjeta
      child: Padding(
        padding: const EdgeInsets.all(15), // Espacio interno de la tarjeta
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Columna principal con número, título y descripción
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      // Número grande
                      Text(
                        numero.toString(),
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal[800], // Color del número
                        ),
                      ),
                      const Spacer(), // Para empujar el ícono al lado derecho
                      // Ícono en la esquina superior derecha
                      const Icon(
                        Icons.eco, // Icono de hoja (puedes cambiarlo si es necesario)
                        color: Colors.green,
                        size: 20,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8), // Espacio entre elementos
                  // Título de la actividad
                  Text(
                    titulo,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Fondo.a, // Color del texto
                    ),
                  ),
                  const SizedBox(height: 5),
                  // Descripción o nota
                  Text(
                    'Nota: $descripcion',
                    style: const TextStyle(
                      fontSize: 14,
                      color:Fondo.c,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Estrellas de calificación
                  Row(
                    children: List.generate(
                      estrellas,
                          (index) => const Icon(Icons.star, color: Colors.amber, size: 20),
                    ),
                  ),
                ],
              ),
            ),
            // Espacio horizontal entre las columnas
            const SizedBox(width: 50),
            // Columna de botones "Ver más" y "Borrar"
            Column(
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MoreInfo()),
                    );
                  },
                  icon: const Icon(Icons.edit, size: 18),
                  label: const Text('Ver más'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: () {

                  },
                  icon: const Icon(Icons.delete, size: 18),
                  label: const Text('Borrar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Diseño para números impares
  Widget _buildOddCard(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MoreInfo()),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color:Fondo.cd,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Texto con el número
                  Text(
                    numero.toString(),
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(width: 10),

                  // Expande para usar el espacio disponible
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          titulo,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Fondo.a,

                          ),
                        ),
                        // Descripción o nota
                        Text(
                          'Nota: $descripcion',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Fondo.c,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Añadir el ícono en la esquina superior derecha
                  const Icon(
                    Icons.eco,
                    color: Colors.green,
                    size: 20,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Estrellas y botones
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Mostrar las estrellas
                  Row(
                    children: List.generate(
                      estrellas,
                          (index) => const Icon(Icons.star, color: Colors.yellow),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}


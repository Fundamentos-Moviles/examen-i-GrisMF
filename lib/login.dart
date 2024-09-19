import 'package:flutter/material.dart';
import 'package:examen1_mfg/home.dart';
import 'package:examen1_mfg/utils/constante.dart' as Fondo;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Agrega los controladores para los campos de credenciales
  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController contrasenaController = TextEditingController();

  // Variable para almacenar los mensajes de error
  String? errorMessage;

  void _iniciarSesion() {
    setState(() {
      // Verifica si algún campo está vacío
      if (usuarioController.text.isEmpty || contrasenaController.text.isEmpty) {
        errorMessage = 'Datos incompletos';
      }
      // Si los campos están llenos, verificar cada dato
      else if (usuarioController.text != 'test' && contrasenaController.text != 'FDM1') {
        errorMessage = 'Usuario y contraseña incorrectos';
      } else if (usuarioController.text != 'test') {
        errorMessage = 'Usuario incorrecto';
      } else if (contrasenaController.text != 'FDM1') {
        errorMessage = 'Contraseña incorrecta';
      }
      // Si ambos datos son correctos, navegar a la siguiente pantalla
      else {
        errorMessage = null; // Reseteamos el mensaje de error
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => home()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Fondo.fondo3, Fondo.fondo],
              ),
            ),
          ),
          CustomPaint(
              painter: BackgroundLogin(), //Para Background Personalizado
              child: Container() //crea un container vacío por encima de fondo
          ),
          Center(
            //contenedor de Inicio de sesión
            child: Container(
              width: 400,
              height: 380, // Aumentamos el tamaño del contenedor para los mensajes de error
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Bienvenido a tu primer EXAMEN',
                      style: TextStyle(
                        fontSize: 20,
                        color: Fondo.titulos,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    //Crea el input de Usuario/Correo
                    TextField(
                      controller: usuarioController,
                      decoration: InputDecoration(
                        hintText: 'Correo/Usuario',
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.all(10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      obscureText: true,
                      controller: contrasenaController,
                      decoration: InputDecoration(
                        hintText: 'Contraseña',
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.all(10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    // Muestra el mensaje de error si existe
                    if (errorMessage != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          errorMessage!,
                          style: TextStyle(
                            color: Fondo.errorMsg,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                    //Crea el botón de Iniciar sesión
                    ElevatedButton(
                      onPressed: _iniciarSesion,
                      child: Text(
                        'Iniciar Sesión',
                        style: TextStyle(
                          color: Fondo.texto,

                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Fondo.botones,
                        padding: EdgeInsets.symmetric(
                            horizontal: 110, vertical: 20),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Mi primer examen, ¿estará sencillo?',
                      style: TextStyle(
                        fontSize: 15,
                        color: Fondo.texto,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


home() {
}

//Para pintar un Background personalizado
class BackgroundLogin extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path(); //crea un Nuevo objeto path
    final ColoresRect = [
      //creamos un arreglo de colores para los rectangulos
      Fondo.fondo2,
      Fondo.fondo4,
      Fondo.fondo,
      Fondo.fondo3,
    ];

    int colorIndex = 0; //sirve para ubicar la posición de los colores

    for (var i = 0; i < size.width; i += 125) {
      //recorremos el lienzo vertical y horizontalmente
      for (var j = 0; j < size.height; j += 155) {
        final Fcolor = Paint(); //Creamos un nuevo objeto paint
        Fcolor.color = ColoresRect[
        colorIndex]; //al objeto le asignamos el color que esta en la posición de colorindex
        path.addRRect(RRect.fromLTRBR(
            i as double,
            j as double,
            i + 125,
            j + 155,
            const Radius.circular(
                30))); //añado al objeto path un rectangulo redondeado
        canvas.drawPath(path, Fcolor); //lo dibujamos en el lienzo
        path.reset(); //reseteamos el objeto path
        colorIndex = (colorIndex + 1) %
            ColoresRect.length; //actualiza el indice de color
      }
      colorIndex = (colorIndex - 1 + ColoresRect.length) %
          ColoresRect
              .length; //cuando llega al tope del arreglo pinta los rectangulos con el color de la posicion del decremento del indice de color
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      false; //se pone en falso para no repintar este objeto cuando se recibe una nueva instancia de CustomPainter
}

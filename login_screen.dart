import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:sos_legal/providers/theme_provider.dart';
import 'package:sos_legal/services/firebase_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Iniciar Sesión')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bienvenido',
              style: Theme.of(context).textTheme.headlineMedium,
            ).animate().fadeIn(duration: 500.milliseconds),
            const SizedBox(height: 20),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Correo'),
            ).animate().fadeIn(duration: 500.milliseconds, delay: 200.milliseconds),
            const SizedBox(height: 20),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ).animate().fadeIn(duration: 500.milliseconds, delay: 400.milliseconds),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implementar lógica de inicio de sesión con email
              },
              child: const Text('Iniciar Sesión'),
            ).animate().fadeIn(duration: 500.milliseconds, delay: 600.milliseconds),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Implementar lógica de registro o recuperación de contraseña
              },
              child: const Text('¿No tienes cuenta? Regístrate'),
            ).animate().fadeIn(duration: 500.milliseconds, delay: 800.milliseconds),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const FaIcon(FontAwesomeIcons.google),
              label: const Text('Iniciar con Google'),
              onPressed: () async {
                await FirebaseService().signInWithGoogle();
                // Navegar a la pantalla principal después del inicio de sesión
              },
            ).animate().fadeIn(duration: 500.milliseconds, delay: 1000.milliseconds),
          ],
        ),
      ),
    );
  }
}
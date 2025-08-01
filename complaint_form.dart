import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ComplaintForm extends StatelessWidget {
  const ComplaintForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Formulario de Quejas')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Título de la Queja'),
            ).animate().fadeIn(duration: 500.milliseconds),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Descripción'),
              maxLines: 4,
            ).animate().fadeIn(
                  duration: 500.milliseconds,
                  delay: 200.milliseconds,
                ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implementar lógica para enviar la queja
              },
              child: const Text('Enviar Queja'),
            ).animate().fadeIn(
                  duration: 500.milliseconds,
                  delay: 400.milliseconds,
                ),
          ],
        ),
      ),
    );
  }
}
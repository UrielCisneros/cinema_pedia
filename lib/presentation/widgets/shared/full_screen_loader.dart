import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  @override
  Widget build(BuildContext context) {
    Stream<String> getTextMessage() {
      final messages = <String>[
        'Preparando orden',
        'Cocinando palomitas',
        'Preparando soda',
        'Empaquetando dulces',
      ];
      return Stream.periodic(
        const Duration(milliseconds: 1200),
        (step) {
          return messages[step];
        },
      ).take(messages.length);
    }

    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Espere por favor"),
        const SizedBox(
          height: 10,
        ),
        const CircularProgressIndicator(
          strokeWidth: 3,
        ),
        const SizedBox(
          height: 10,
        ),
        StreamBuilder(
            stream: getTextMessage(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return Text("Cargando");
              return Text(snapshot.data!);
            })
      ],
    ));
  }
}

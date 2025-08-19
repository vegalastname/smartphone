import 'package:flutter/material.dart';
import 'package:health_tracker_mobile/main.dart';
import 'dart:async';
import 'dart:math';
import 'steps_notifier.dart';  // Importa el notifier

class StepsScreen extends StatefulWidget {
  const StepsScreen({super.key});

  @override
  State<StepsScreen> createState() => _StepsScreenState();
}

class _StepsScreenState extends State<StepsScreen> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      stepsNotifier.increment(Random().nextInt(6));  // Usa el notifier
      setState(() {});  // Refresca la UI
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Pasos Diarios', style: TextStyle(fontSize: 24, color: Colors.grey)),
          ValueListenableBuilder<int>(
            valueListenable: stepsNotifier,  // Escucha el notifier
            builder: (context, steps, child) {
              return Text(steps.toString(), style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white));
            },
          ),
          const SizedBox(height: 20),
          const Text('Desliza para ver Ritmo Cardíaco', style: TextStyle(fontSize: 16, color: Colors.grey)),
        ],
      ),
    );
  }
}
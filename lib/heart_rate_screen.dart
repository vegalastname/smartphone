import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class HeartRateScreen extends StatefulWidget {
  const HeartRateScreen({super.key});

  @override
  State<HeartRateScreen> createState() => _HeartRateScreenState();
}

class _HeartRateScreenState extends State<HeartRateScreen> {
  int _heartRate = 78;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        _heartRate = 60 + Random().nextInt(41); // Simulate 60-100 BPM
        if (_heartRate < 60 || _heartRate > 100) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Alerta: Ritmo cardíaco anormal ($_heartRate BPM)'), backgroundColor: Colors.red),
          );
        }
      });
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
          const Text('Ritmo Cardíaco', style: TextStyle(fontSize: 24, color: Colors.grey)),
          Text('$_heartRate BPM', style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 20),
          const Text('Desliza para ver Pasos Diarios', style: TextStyle(fontSize: 16, color: Colors.grey)),
        ],
      ),
    );
  }
}// TODO Implement this library.
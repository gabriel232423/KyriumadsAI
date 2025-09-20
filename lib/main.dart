import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:share_plus/share_plus.dart';

void main() {
  runApp(const KyriumApp());
}

class KyriumApp extends StatelessWidget {
  const KyriumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kyrium Ads AI',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> _playSaleSound() async {
    await _audioPlayer.play(AssetSource("sale_sound.mp3"));
  }

  void _simulateSale() {
    _playSaleSound();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("💰 Simulação de venda realizada!")),
    );
  }

  void _realSale() {
    _playSaleSound();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("🎉 Venda REAL confirmada!")),
    );
  }

  void _shareApp() {
    Share.share("Baixe o app Kyrium Ads AI e ative o modo Turbo!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kyrium Ads AI")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _simulateSale,
              child: const Text("Simular Venda"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _realSale,
              child: const Text("Venda Real"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _shareApp,
              child: const Text("Compartilhar App"),
            ),
          ],
        ),
      ),
    );
  }
}

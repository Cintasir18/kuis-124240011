import 'package:flutter/material.dart';
import '../models/pokemon_model.dart';

class PokemonDetailPage extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetailPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pokemon.name)),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                pokemon.image,
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Pokemon Details',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            Text('Name: ${pokemon.name}'),
            Text('Type: ${pokemon.types}'),
            Text('Height: ${pokemon.height}'),
            Text('Weight: ${pokemon.weight}'),

            const SizedBox(height: 20),

            const Text(
              'Nama',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const Text(
              'Tipe',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            Wrap(
              spacing: 8,
              children: pokemon.types
                  .map((item) => Chip(label: Text(item)))
                  .toList(),
            ),

            const SizedBox(height: 20),

            const Text(
              'Abilities',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

        

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Kembali ke Home'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

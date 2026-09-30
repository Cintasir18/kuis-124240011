import 'package:flutter/material.dart';
import '../models/pokemon_model.dart';

class DetailPokemonPage extends StatelessWidget {
  final Pokemon pokemon;

  const DetailPokemonPage({
    super.key,
    required this.pokemon,
  });

  Widget detailItem(
    String label,
    String value,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          SizedBox(
            width: 90,

            child: Text(
              label,

              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const Text(':  '),

          Expanded(
            child: Text(
              value,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pokemon.name,
        ),

        backgroundColor: Colors.red,

        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
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

            const SizedBox(height: 10),
            Text(
              pokemon.name,

              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),
            Card(
              elevation: 4,

              child: Padding(
                padding: const EdgeInsets.all(18),

                child: Column(
                  children: [
                    detailItem(
                      'ID',
                      pokemon.id.toString(),
                    ),

                    detailItem(
                      'Name',
                      pokemon.name,
                    ),

                    detailItem(
                      'Image',
                      pokemon.image,
                    ),

                    detailItem(
                      'Types',
                      pokemon.types.join(', '),
                    ),

                    detailItem(
                      'Height',
                      pokemon.height.toString(),
                    ),

                    detailItem(
                      'Weight',
                      pokemon.weight.toString(),
                    ),

                    detailItem(
                      'Ability',
                      pokemon.ability,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              height: 50,

              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },

                icon: const Icon(
                  Icons.arrow_back,
                ),

                label: const Text(
                  'Kembali',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
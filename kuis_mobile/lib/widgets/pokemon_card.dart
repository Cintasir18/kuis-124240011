import 'package:flutter/material.dart';
import '../models/pokemon_model.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;
  final VoidCallback onTap;

  const PokemonCard({
    super.key,
    required this.pokemon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    pokemon.image,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 8),

              Text(
                pokemon.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(pokemon.types.join(', ')),

              const SizedBox(height: 4),

              Wrap(
                spacing: 4,
                children: pokemon.types
                    .map(
                      (type) => Chip(
                        label: Text(type),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
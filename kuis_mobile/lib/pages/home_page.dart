import 'package:flutter/material.dart';
import 'package:kuis_mobile/pages/detail_pokemon.dart';
import '../data/pokemon.dart';

class HomePage extends StatelessWidget {
  final String username;

  const HomePage({
    super.key,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pokemon List',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        backgroundColor: Colors.red,

        foregroundColor: Colors.white,
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(12),

        itemCount: pokemonList.length,

        itemBuilder: (context, index) {
          final Pokemon = pokemonList[index];

          return Card(
            elevation: 4,

            margin: const EdgeInsets.only(
              bottom: 12,
            ),

            child: ListTile(
              contentPadding: const EdgeInsets.all(10),


              leading: Image.network(
                Pokemon.image,

                width: 70,
                height: 70,

                fit: BoxFit.contain,

                errorBuilder: (
                  context,
                  error,
                  stackTrace,
                ) {
                  return const Icon(
                    Icons.image_not_supported,
                    size: 50,
                  );
                },
              ),


              title: Text(
                Pokemon.name,

                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              subtitle: Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                ),

                child: Text(
                  'Type: ${Pokemon.types.join(', ')}',
                ),
              ),

              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),


              onTap: () {
                Navigator.push(
                  context,

                  MaterialPageRoute(
                    builder: (context) {
                      return DetailPokemonPage(
                        pokemon: Pokemon,
                      );
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
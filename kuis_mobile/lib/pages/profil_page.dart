import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final String username;
  final VoidCallback onLogout;

  const ProfilePage({
    super.key,
    required this.username,
    required this.onLogout,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String profileImage =
      'https://archives.bulbagarden.net/media/upload/1/1f/Sword_Shield_Victor.png';

  final String maleImage =
      'https://archives.bulbagarden.net/media/upload/1/1f/Sword_Shield_Victor.png';


  final String femaleImage =
      'https://archives.bulbagarden.net/media/upload/c/cd/Sword_Shield_Gloria.png';

  void changeProfile(String image) {
    setState(() {
      profileImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        backgroundColor: Colors.red,

        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),

        child: Column(
          children: [
            const SizedBox(height: 20),
            ClipOval(
              child: Image.network(
                profileImage,

                width: 180,
                height: 180,

                fit: BoxFit.cover,

                errorBuilder: (
                  context,
                  error,
                  stackTrace,
                ) {
                  return Container(
                    width: 180,
                    height: 180,

                    color: Colors.grey.shade300,

                    child: const Icon(
                      Icons.person,
                      size: 100,
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),
            Text(
              widget.username,

              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              '"Saya bersumpah mengerjakan soal kuis ini dengan cara yang jujur dan tidak curang dengan cara apapun".',

              textAlign: TextAlign.center,

              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'Pilih Karakter',

              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                GestureDetector(
                  onTap: () {
                    changeProfile(
                      maleImage,
                    );
                  },

                  child: Container(
                    padding: const EdgeInsets.all(10),

                    decoration: BoxDecoration(
                      border: Border.all(
                        color: profileImage == maleImage
                            ? Colors.blue
                            : Colors.grey,

                        width: 3,
                      ),

                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                    ),

                    child: Image.network(
                      maleImage,

                      width: 100,
                      height: 100,

                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                const SizedBox(width: 20),

                GestureDetector(
                  onTap: () {
                    changeProfile(
                      femaleImage,
                    );
                  },

                  child: Container(
                    padding: const EdgeInsets.all(10),

                    decoration: BoxDecoration(
                      border: Border.all(
                        color: profileImage == femaleImage
                            ? Colors.pink
                            : Colors.grey,

                        width: 3,
                      ),

                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                    ),

                    child: Image.network(
                      femaleImage,

                      width: 100,
                      height: 100,

                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 35),

            SizedBox(
              width: double.infinity,
              height: 50,

              child: ElevatedButton.icon(
                onPressed: widget.onLogout,

                icon: const Icon(
                  Icons.logout,
                ),

                label: const Text(
                  'Logout',

                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
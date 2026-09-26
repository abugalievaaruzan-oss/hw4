import 'package:flutter/material.dart';
void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfilePage(),
  ));
}
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isFollowing = false;
  bool isLiked = false;
  int followers = 100;
  int likes = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      appBar: AppBar(
       title: const Text('Profile Card'),
        backgroundColor: Colors.purple.shade100,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    child: Icon(Icons.person, size: 60),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Aruzhan Abugaliyeva',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text('IT in Business student'),
                  const SizedBox(height: 20),
                  Text('Followers: $followers'),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (isFollowing) {
                          isFollowing = false;
                          followers--;
                        } else {
                          isFollowing = true;
                          followers++;
                        }
                      });
                    },
                    child: Text(
                      isFollowing ? 'Following' : 'Follow',
                    ),
                  ),
                  const SizedBox(height: 20),
                   IconButton(
                    onPressed: () {
                      setState(() {
                        if (isLiked) {
                          isLiked = false;
                          likes--;
                        } else {
                          isLiked = true;
                          likes++;
                        }
                      });
                    },
                    icon: Icon(
                      isLiked
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: isLiked ? Colors.red : Colors.grey,
                      size: 32,
                    ),
                  ),
                  Text('Likes: $likes'),
                  const SizedBox(height: 20),

                  // Reset button
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        isFollowing = false;
                        isLiked = false;
                        followers = 100;
                        likes = 0;
                      });
                    },
                    child: const Text('Reset'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
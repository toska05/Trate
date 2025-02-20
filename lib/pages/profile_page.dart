import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trate/services/login_service.dart';
// import 'package:trate/pages/form_page.dart';

class ProfilePage extends StatefulWidget {
  final VoidCallback? onNavigateToForm;

  const ProfilePage({Key? key, this.onNavigateToForm}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final String userEmail = "${LoginService.getCurrentUserEmail() ?? ''}";

  final List<Map<String, String>> exampleTranslations = [
    {"original": "Hello", "translated": "Hola"},
    {"original": "Thank you", "translated": "Gracias"},
    {"original": "Good morning", "translated": "Buenos días"},
  ];

  void _confirmDeleteAccount() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Delete Account"),
        content: const Text("Are you sure you want to delete your account? This action is irreversible."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context), 
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              // TODO: Implement delete account functionality
              Navigator.pop(context); 
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Account deleted successfully.")),
              );
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text("Delete"),
          ),
        ],
      ),
    );
  }

  void _deleteTranslation(int index) {
    setState(() {
      exampleTranslations.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Trate', style: GoogleFonts.bebasNeue(fontSize: 25)),
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10), 
            child: Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
              ),
            ),
          ),
        ],
      ),
      
      endDrawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('SETTINGS', style: GoogleFonts.bebasNeue(fontSize: 40)),
                ],
              ),
            ),
            
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.redAccent),
              title: const Text("Logout"),
              onTap: () {
                // TODO: Implement logout functionality
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Logged out successfully.")),
                );
                Navigator.pop(context); 
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete, color: Colors.redAccent),
              title: const Text("Delete Account"),
              onTap: _confirmDeleteAccount, 
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: theme.secondary,
              child: Icon(Icons.translate, size: 50, color: theme.onSecondary),
            ),
            const SizedBox(height: 20),
            Text(
              userEmail,
              style: const TextStyle(fontSize: 18, color: Colors.grey, fontWeight: FontWeight.w300),
            ),

            const SizedBox(height: 35),
            Text("Your Translations", style: GoogleFonts.bebasNeue(fontSize: 34, color: theme.onSurface)),
            const SizedBox(height: 28),

            ElevatedButton.icon(
              onPressed: widget.onNavigateToForm,
              icon: const Icon(Icons.add),
              label: const Text("Add New Translation"),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
                backgroundColor: theme.secondary,
                foregroundColor: theme.onSecondary,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              ),
            ),
            const SizedBox(height: 20),

            // Expanded(
            //   child: ListView.builder(
            //     itemCount: exampleTranslations.length,
            //     itemBuilder: (context, index) {
            //       final translation = exampleTranslations[index];
            //       return Card(
            //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            //         elevation: 3,
            //         margin: const EdgeInsets.symmetric(vertical: 8),
            //         child: ListTile(
            //           title: Text(translation["original"]!, style: const TextStyle(fontWeight: FontWeight.bold)),
            //           subtitle: Text(translation["translated"]!),
            //           leading: const Icon(Icons.g_translate, color: Colors.blueAccent),
            //         ),
            //       );
            //     },
            //   ),
            // ),
            Expanded(
              child: ListView.builder(
                itemCount: exampleTranslations.length,
                itemBuilder: (context, index) {
                  final translation = exampleTranslations[index];
                  return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(
                        translation["original"]!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(translation["translated"]!),
                      leading: const Icon(Icons.g_translate, color: Colors.blueAccent),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.blueAccent),
                        onPressed: () => _deleteTranslation(index),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


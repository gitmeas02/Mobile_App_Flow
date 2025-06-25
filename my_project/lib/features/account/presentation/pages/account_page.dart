import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_project/core/routes/app_routes.dart'; // Make sure this path is correct

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final List<Map<String, dynamic>> settings = [
    {'icon': Icons.shopping_bag_outlined, 'text': 'Orders'},
    {'icon': Icons.person_outline, 'text': 'My Details'},
    {'icon': Icons.location_on_outlined, 'text': 'Delivery Address'},
    {'icon': Icons.credit_card_outlined, 'text': 'Payment Methods'},
    {'icon': Icons.card_giftcard_outlined, 'text': 'Promo Code'},
    {'icon': Icons.notifications_none, 'text': 'Notifications'},
    {'icon': Icons.help_outline, 'text': 'Help'},
    {'icon': Icons.info_outline, 'text': 'About'},
  ];

  void _showEditDialog(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final nameController = TextEditingController(text: user?.displayName ?? '');

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Name"),
          content: TextField(
            controller: nameController,
            decoration: const InputDecoration(labelText: "Display Name"),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                final newName = nameController.text.trim();
                if (newName.isNotEmpty && user != null) {
                  await user.updateDisplayName(newName);
                  await user.reload();
                  setState(() {});
                }
                Navigator.of(context).pop();
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Handle settings action
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Profile Info
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage('./assets/images/profile.png'),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            user?.displayName ?? 'No Name',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(width: 8),
                          GestureDetector(
                            onTap: () => _showEditDialog(context),
                            child: const Icon(
                              Icons.edit,
                              size: 16,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        user?.email ?? 'No email',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          // Settings List
          Expanded(
            child: ListView.separated(
              itemCount: settings.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(
                    settings[index]['icon'],
                    color: Colors.grey[700],
                  ),
                  title: Text(
                    settings[index]['text'],
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.black,
                  ),
                  onTap: () {
                    // Handle tap on setting item
                  },
                );
              },
            ),
          ),
          // Logout Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextButton.icon(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();

                if (context.mounted) {
                  Navigator.of(
                    context,
                  ).pushNamedAndRemoveUntil(AppRoutes.Login, (route) => false);
                }
              },

              icon: const Icon(Icons.logout, color: Colors.green),
              label: const Text(
                "Log Out",
                style: TextStyle(color: Colors.green, fontSize: 16),
              ),
              style: TextButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.green.withOpacity(0.1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

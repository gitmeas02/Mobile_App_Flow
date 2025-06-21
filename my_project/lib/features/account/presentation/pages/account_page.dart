import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final List<Map<String, dynamic>> settings = [
    {'icon': Icons.shopping_bag_outlined, 'text': 'Orders',},
    {'icon': Icons.person_outline, 'text': 'My Details'},
    {'icon': Icons.location_on_outlined, 'text': 'Delivery Address'},
    {'icon': Icons.credit_card_outlined, 'text': 'Payment Methods'},
    {'icon': Icons.card_giftcard_outlined, 'text': 'Promo Code'},
    {'icon': Icons.notifications_none, 'text': 'Notifications'},
    {'icon': Icons.help_outline, 'text': 'Help'},
    {'icon': Icons.info_outline, 'text': 'About'},
  ];

  @override
  Widget build(BuildContext context) {
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
                CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage('./assets/images/axolotl.png'), // Replace with your image
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Text('Axolotl',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18,color: Colors.black)),
                          SizedBox(width: 8),
                          Icon(Icons.edit, size: 16, color: Colors.green),
                        ],
                      ),
                      const Text('axolotltzin2@gmail.com',
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                )
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
                  leading: Icon(settings[index]['icon'], color: Colors.grey[700]),
                  title: Text(settings[index]['text'],
                      style: const TextStyle(fontWeight: FontWeight.w500,color: Colors.black)),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black),
                  onTap: () {
                    // Handle tap
                  },
                );
              },
            ),
          ),
          // Logout Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextButton.icon(
              onPressed: () {
                // Handle logout
              },
              icon: const Icon(Icons.logout, color: Colors.green),
              label: const Text("Log Out",
                  style: TextStyle(color: Colors.green, fontSize: 16)),
              style: TextButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.green.withOpacity(0.1),
              ),
            ),
          ),
        ],
      ),
      // Bottom Navigation Bar
    );
  }
}

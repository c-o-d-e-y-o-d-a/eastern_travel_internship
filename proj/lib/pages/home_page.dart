import 'package:flutter/material.dart';
import 'package:proj/pages/all_messages_page.dart';
import 'package:proj/pages/payment_page.dart';
import 'package:proj/services/auth/auth_service.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home', style: TextStyle(color: Colors.yellow),),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildButton(
              context,
              label: 'See Messages',
              icon: Icons.message,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AllMessagePage()),
                );
              },
            ),
            const SizedBox(height: 20),
            _buildButton(
              context,
              label: 'Payment',
              icon: Icons.payment,
              onPressed: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentPage()),
                );
              },
            ),
            const SizedBox(height: 20),
            _buildButton(
              context,
              label: 'Logout',
              icon: Icons.logout,
              onPressed: () {
                final authService =
                    Provider.of<AuthService>(context, listen: false);
                authService.signOut();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context,
      {required String label,
      required IconData icon,
      required void Function() onPressed}) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 24),
      label: Text(label, style: const TextStyle(fontSize: 18)),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        backgroundColor: Colors.black,
        foregroundColor: Colors.yellow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

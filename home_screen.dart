import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:sos_legal/providers/theme_provider.dart';
import 'package:sos_legal/screens/login_screen.dart';
import 'package:sos_legal/services/firebase_service.dart';
import 'package:sos_legal/screens/complaints_list.dart';
import 'package:sos_legal/screens/jobs_screen.dart';
import 'package:sos_legal/screens/webview_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = [
    ComplaintsList(),
    JobsScreen(),
    WebViewScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('SOS Legal'),
        actions: [
          IconButton(
            icon: FaIcon(
              themeProvider.themeData.brightness == Brightness.light
                  ? FontAwesomeIcons.moon
                  : FontAwesomeIcons.sun,
            ),
            onPressed: () {
              themeProvider.toggleTheme();
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: const Text(
                'Menú',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ).animate().fadeIn(duration: 500.milliseconds),
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.user),
              title: const Text('Perfil'),
              onTap: () {
                // Implementar navegación al perfil
              },
            ).animate().slideX(begin: 0.2, duration: 500.milliseconds),
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.headset),
              title: const Text('Soporte'),
              onTap: () {
                // Implementar navegación al soporte
              },
            ).animate().slideX(
                  begin: 0.2,
                  duration: 500.milliseconds,
                  delay: 200.milliseconds,
                ),
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.signOutAlt),
              title: const Text('Cerrar Sesión'),
              onTap: () async {
                await FirebaseService().signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                );
              },
            ).animate().slideX(
                  begin: 0.2,
                  duration: 500.milliseconds,
                  delay: 400.milliseconds,
                ),
          ],
        ),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.exclamationTriangle),
            label: 'Quejas',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.briefcase),
            label: 'Trabajos',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.globe),
            label: 'Web',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ).animate().fadeIn(duration: 500.milliseconds),
    );
  }
}
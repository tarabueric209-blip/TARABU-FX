import 'package:flutter/material.dart';

void main() {
  runApp(const TarabuFXApp());
}

class TarabuFXApp extends StatelessWidget {
  const TarabuFXApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TARABU FX',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF07111F),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFD6AE4B),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final pages = const [
    DashboardPage(),
    SignalsPage(),
    AcademyPage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: pages[selectedIndex]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() => selectedIndex = index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.show_chart_outlined),
            selectedIcon: Icon(Icons.show_chart),
            label: 'Signals',
          ),
          NavigationDestination(
            icon: Icon(Icons.school_outlined),
            selectedIcon: Icon(Icons.school),
            label: 'Academy',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}

class BrandHeader extends StatelessWidget {
  const BrandHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            gradient: const LinearGradient(
              colors: [
                Color(0xFFD6AE4B),
                Color(0xFFF3D88B),
              ],
            ),
          ),
          child: const Center(
            child: Text(
              'TF',
              style: TextStyle(
                color: Color(0xFF07111F),
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        const Text(
          'TARABU FX',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.2,
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_none),
        ),
      ],
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const BrandHeader(),
        const SizedBox(height: 28),
        const Text(
          'Trade Smarter.\nLearn. Grow.',
          style: TextStyle(
            fontSize: 31,
            fontWeight: FontWeight.w900,
            height: 1.05,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Your TARABU FX trading and education hub.',
          style: TextStyle(
            color: Colors.white.withOpacity(.65),
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: const LinearGradient(
              colors: [
                Color(0xFF142943),
                Color(0xFF0A1728),
              ],
            ),
            border: Border.all(
              color: const Color(0xFFD6AE4B),
              width: .6,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.trending_up,
                color: Color(0xFFD6AE4B),
                size: 36,
              ),
              const SizedBox(height: 15),
              const Text(
                'Professional Trading Hub',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Signals, education, premium membership and trading technology.',
                style: TextStyle(
                  color: Colors.white.withOpacity(.70),
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 18),
              FilledButton(
                onPressed: () {},
                child: const Text('Explore TARABU FX'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'Latest Signal',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 12),
        const SignalCard(
          pair: 'XAUUSD',
          direction: 'BUY',
          entry: 'DEMO',
          sl: 'DEMO',
          tp: 'DEMO',
        ),
        const SizedBox(height: 24),
        const Text(
          'Quick Access',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: const [
            Expanded(
              child: QuickCard(
                icon: Icons.school,
                title: 'Academy',
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: QuickCard(
                icon: Icons.workspace_premium,
                title: 'Premium',
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: const [
            Expanded(
              child: QuickCard(
                icon: Icons.smart_toy,
                title: 'MT5 / BOT',
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: QuickCard(
                icon: Icons.support_agent,
                title: 'Support',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class SignalsPage extends StatelessWidget {
  const SignalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: const [
        BrandHeader(),
        SizedBox(height: 24),
        Text(
          'Forex Signals',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Demo signals — live market data will be connected later.',
          style: TextStyle(color: Colors.white60),
        ),
        SizedBox(height: 20),
        SignalCard(
          pair: 'XAUUSD',
          direction: 'BUY',
          entry: 'DEMO',
          sl: 'DEMO',
          tp: 'DEMO',
        ),
        SizedBox(height: 14),
        SignalCard(
          pair: 'EURUSD',
          direction: 'SELL',
          entry: 'DEMO',
          sl: 'DEMO',
          tp: 'DEMO',
        ),
      ],
    );
  }
}

class AcademyPage extends StatelessWidget {
  const AcademyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final courses = [
      'Forex Fundamentals',
      'Technical Analysis',
      'Risk Management',
      'Trading Psychology',
    ];

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const BrandHeader(),
        const SizedBox(height: 24),
        const Text(
          'TARABU FX Academy',
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Learn the foundations of professional trading.',
          style: TextStyle(color: Colors.white60),
        ),
        const SizedBox(height: 18),
        ...courses.map(
          (course) => Card(
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.play_arrow),
              ),
              title: Text(
                course,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: const Text('Course module'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
          ),
        ),
      ],
    );
  }
}

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const BrandHeader(),
        const SizedBox(height: 30),
        const Center(
          child: CircleAvatar(
            radius: 40,
            child: Icon(Icons.person, size: 40),
          ),
        ),
        const SizedBox(height: 12),
        const Center(
          child: Text(
            'TARABU FX Member',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        const SizedBox(height: 25),
        accountTile(Icons.workspace_premium, 'Premium Membership'),
        accountTile(Icons.credit_card, 'Payments'),
        accountTile(Icons.smart_toy, 'MT5 / BOT'),
        accountTile(Icons.notifications, 'Notifications'),
        accountTile(Icons.support_agent, 'Support'),
        accountTile(Icons.settings, 'Settings'),
      ],
    );
  }

  Widget accountTile(IconData icon, String title) {
    return Card(
      child: ListTile(
        leading: Icon(
          icon,
          color: const Color(0xFFD6AE4B),
        ),
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {},
      ),
    );
  }
}

class SignalCard extends StatelessWidget {
  final String pair;
  final String direction;
  final String entry;
  final String sl;
  final String tp;

  const SignalCard({
    super.key,
    required this.pair,
    required this.direction,
    required this.entry,
    required this.sl,
    required this.tp,
  });

  @override
  Widget build(BuildContext context) {
    final isBuy = direction == 'BUY';

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  pair,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: isBuy
                        ? Colors.green.withOpacity(.18)
                        : Colors.red.withOpacity(.18),
                  ),
                  child: Text(
                    direction,
                    style: TextStyle(
                      color: isBuy
                          ? Colors.greenAccent
                          : Colors.redAccent,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                metric('ENTRY', entry),
                metric('SL', sl),
                metric('TP', tp),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget metric(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            color: Colors.white54,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}

class QuickCard extends StatelessWidget {
  final IconData icon;
  final String title;

  const QuickCard({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: const Color(0xFFD6AE4B),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

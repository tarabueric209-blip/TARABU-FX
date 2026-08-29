import 'package:flutter/material.dart';

void main() {
  runApp(const TarabuFxApp());
}

class TarabuFxApp extends StatelessWidget {
  const TarabuFxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TARABU FX',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF07111F),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFD6AE4B),
          brightness: Brightness.dark,
        ),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  final pages = const [
    HomePage(),
    SignalsPage(),
    AcademyPage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: pages[selectedIndex],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
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

// ---------------- BRAND HEADER ----------------

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
                fontWeight: FontWeight.w900,
                fontSize: 18,
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

// ---------------- HOME ----------------

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
            fontSize: 32,
            fontWeight: FontWeight.w900,
            height: 1.05,
          ),
        ),

        const SizedBox(height: 10),

        Text(
          'Your TARABU FX trading and education hub.',
          style: TextStyle(
            color: Colors.white.withOpacity(0.65),
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
              color: Color(0xFFD6AE4B),
              width: 0.6,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.trending_up,
                color: Color(0xFFD6AE4B),
                size: 38,
              ),

              const SizedBox(height: 14),

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
                  color: Colors.white.withOpacity(0.70),
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

// ---------------- SIGNALS ----------------

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
          'Demo signals. Live market data will be connected later.',
          style: TextStyle(
            color: Colors.white60,
          ),
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

        SizedBox(height: 14),

        SignalCard(
          pair: 'GBPUSD',
          direction: 'BUY',
          entry: 'DEMO',
          sl: 'DEMO',
          tp: 'DEMO',
        ),
      ],
    );
  }
}

// ---------------- ACADEMY ----------------

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
          style: TextStyle(
            color: Colors.white60,
          ),
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
              subtitle: const Text(
                'Course module • Coming soon',
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
          ),
        ),
      ],
    );
  }
}

// ---------------- ACCOUNT ----------------

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
            child: Icon(
              Icons.person,
              size: 40,
            ),
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

        AccountTile(
          icon: Icons.workspace_premium,
          title: 'Premium Membership',
        ),

        AccountTile(
          icon: Icons.credit_card,
          title: 'Payments',
        ),

        AccountTile(
          icon: Icons.smart_toy,
          title: 'MT5 / BOT',
        ),

        AccountTile(
          icon: Icons.notifications,
          title: 'Notifications',
        ),

        AccountTile(
          icon: Icons.support_agent,
          title: 'Support',
        ),

        AccountTile(
          icon: Icons.settings,
          title: 'Settings',
        ),
      ],
    );
  }
}

// ---------------- SIGNAL CARD ----------------

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
                        ? Colors.green.withOpacity(0.18)
                        : Colors.red.withOpacity(0.18),
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
                Metric(
                  label: 'ENTRY',
                  value: entry,
                ),
                Metric(
                  label: 'SL',
                  value: sl,
                ),
                Metric(
                  label: 'TP',
                  value: tp,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------- METRIC ----------------

class Metric extends StatelessWidget {
  final String label;
  final String value;

  const Metric({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
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

// ---------------- QUICK CARD ----------------

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
              color: Color(0xFFD6AE4B),
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

// ---------------- ACCOUNT TILE ----------------

class AccountTile extends StatelessWidget {
  final IconData icon;
  final String title;

  const AccountTile({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          icon,
          color: Color(0xFFD6AE4B),
        ),
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {},
      ),
    );
  }
}

// Prezzemolo - Endlich ankommen
// Diese App vereint Coaching, Benimmkurse, Servietten-Shop und Raumgestaltung.
// Entwickelt mit Flutter für iOS & Android.

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const PrezemoloApp());
}

// Haupt-App
class PrezemoloApp extends StatelessWidget {
  const PrezemoloApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prezzemolo - Endlich ankommen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: GoogleFonts.montserrat().fontFamily,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF5A6B73), // Dunkelblau
          secondary: const Color(0xFFD4AF8C), // Goldakzent
        ),
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Startseite
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  // Seiten für die Bottom Navigation
  final List<Widget> _screens = [
    const HomeTab(),
    const ServicesTab(),
    const ShopTab(),
    const AboutTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Prezzemolo',
          style: GoogleFonts.playfairDisplay(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF5A6B73),
        elevation: 0,
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF5A6B73),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Angebote',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Über mich',
          ),
        ],
      ),
    );
  }
}

// Home-Tab
class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Hero-Banner
          Container(
            height: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Text(
                'Bewusstes Leben & Stil',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.5),
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Kategorien
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Entdecke meine Angebote',
              style: GoogleFonts.montserrat(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          // Kategorie-Karten
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                _buildCategoryCard(
                  context,
                  'Bei sich ankommen',
                  Icons.self_improvement,
                  const Color(0xFFD4AF8C),
                  '/achtsamkeit',
                ),
                const SizedBox(height: 10),
                _buildCategoryCard(
                  context,
                  'Benimmkurse',
                  Icons.school,
                  const Color(0xFF5A6B73),
                  '/benimmkurse',
                ),
                const SizedBox(height: 10),
                _buildCategoryCard(
                  context,
                  'Raumgestaltung',
                  Icons.house,
                  const Color(0xFF8C7A6B),
                  '/raumgestaltung',
                ),
                const SizedBox(height: 10),
                _buildCategoryCard(
                  context,
                  'Servietten-Shop',
                  Icons.shopping_basket,
                  const Color(0xFFB8860B),
                  '/shop',
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Neuigkeiten
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Neuigkeiten & Inspiration',
              style: GoogleFonts.montserrat(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Text(
                      'Die Kunst des Ankommens: 5 Tipps für mehr Achtsamkeit im Alltag',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'In unserem hektischen Alltag vergessen wir oft, im Moment zu leben. Hier sind 5 einfache Tipps, um wieder bei dir selbst anzukommen.',
                      style: GoogleFonts.montserrat(fontSize: 14),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Weiterlesen',
                          style: GoogleFonts.montserrat(
                            color: const Color(0xFF5A6B73),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Hilfsfunktion für Kategorie-Karten
  Widget _buildCategoryCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    String route,
  ) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          // Navigation zu den jeweiligen Seiten
          if (route == '/shop') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ShopTab()),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Icon(icon, size: 30, color: color),
              const SizedBox(width: 15),
              Text(
                title,
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}

// Angebote-Tab
class ServicesTab extends StatelessWidget {
  const ServicesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Meine Dienstleistungen',
              style: GoogleFonts.montserrat(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Coaching
          _buildServiceCard(
            context,
            '1:1 Coaching',
            'Individuelle Begleitung für mehr Achtsamkeit und Klarheit in deinem Leben.',
            Icons.person,
            const Color(0xFFD4AF8C),
          ),
          const SizedBox(height: 10),
          // Benimmkurse
          _buildServiceCard(
            context,
            'Benimmkurse',
            'Lerne die wichtigsten Regeln für einen stilvollen Auftritt in Gesellschaft.',
            Icons.school,
            const Color(0xFF5A6B73),
          ),
          const SizedBox(height: 10),
          // Raumgestaltung
          _buildServiceCard(
            context,
            'Raumgestaltung',
            'Schaffe harmonische Räume, die deine Persönlichkeit widerspiegeln.',
            Icons.house,
            const Color(0xFF8C7A6B),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    Color color,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, size: 30, color: color),
                  const SizedBox(width: 10),
                  Text(
                    title,
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                description,
                style: GoogleFonts.montserrat(fontSize: 16),
              ),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5A6B73),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Mehr erfahren',
                    style: GoogleFonts.montserrat(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Shop-Tab (Servietten)
class ShopTab extends StatelessWidget {
  const ShopTab({super.key});

  @override
  Widget build(BuildContext context) {
    // Beispiel-Produktliste
    final List<Map<String, dynamic>> products = [
      {
        'name': 'Leinenserviette "Elegance"',
        'price': '24,90 €',
        'image': 'https://images.unsplash.com/photo-1584464491033-06628f3a6b7b?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80',
        'description': 'Handgefertigte Leinenserviette mit zarten Stickereien.',
      },
      {
        'name': 'Baumwollserviette "Classic"',
        'price': '18,90 €',
        'image': 'https://images.unsplash.com/photo-1578662996442-48f60103fc96?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80',
        'description': 'Robuste Baumwollserviette für den täglichen Gebrauch.',
      },
      {
        'name': 'Seidenserviette "Luxury"',
        'price': '49,90 €',
        'image': 'https://images.unsplash.com/photo-1578662996442-48f60103fc96?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80',
        'description': 'Edle Seidenserviette für besondere Anlässe.',
      },
    ];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Servietten-Shop',
              style: GoogleFonts.montserrat(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Produktliste
          ...products.map((product) => _buildProductCard(context, product)),
        ],
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, Map<String, dynamic> product) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Produktbild
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.network(
                product['image'],
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            // Produktinfo
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product['name'],
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    product['description'],
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product['price'],
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF5A6B73),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF5A6B73),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'In den Warenkorb',
                          style: GoogleFonts.montserrat(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Über mich-Tab
class AboutTab extends StatelessWidget {
  const AboutTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          // Profilbild
          Center(
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: const DecorationImage(
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80',
                  ),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  color: const Color(0xFF5A6B73),
                  width: 3,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Bio
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Über mich',
              style: GoogleFonts.montserrat(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Hallo, ich bin Sophia la Cour. Seit über 10 Jahren begleite ich Menschen dabei, ihren eigenen Stil zu finden – sei es durch bewusste Raumgestaltung, stilvolle Tischkultur oder innere Achtsamkeit. Meine Leidenschaft gilt dem Schaffen von Harmonie, sowohl im Äußeren als auch im Inneren.',
              style: GoogleFonts.montserrat(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          // Qualifikationen
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Meine Qualifikationen',
              style: GoogleFonts.montserrat(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                _buildQualificationItem('Zertifizierte Achtsamkeitslehrerin'),
                const SizedBox(height: 5),
                _buildQualificationItem('Ausbildung zur Stilberaterin'),
                const SizedBox(height: 5),
                _buildQualificationItem('10+ Jahre Erfahrung in Raumgestaltung'),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Kontakt
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Kontakt',
              style: GoogleFonts.montserrat(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                _buildContactItem(Icons.email, 'E-Mail', 'sophia@lacour.de'),
                const SizedBox(height: 5),
                _buildContactItem(Icons.phone, 'Telefon', '+49 123 456789'),
                const SizedBox(height: 5),
                _buildContactItem(Icons.language, 'Website', 'www.sophialacour.de'),
                const SizedBox(height: 5),
                _buildContactItem(Icons.instagram, 'Instagram', '@sophialacour'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQualificationItem(String text) {
    return Row(
      children: [
        const Icon(Icons.check_circle, color: Color(0xFF5A6B73), size: 20),
        const SizedBox(width: 10),
        Text(
          text,
          style: GoogleFonts.montserrat(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildContactItem(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFF5A6B73), size: 20),
        const SizedBox(width: 10),
        Text(
          '$label: ',
          style: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.montserrat(fontSize: 16),
        ),
      ],
    );
  }
}

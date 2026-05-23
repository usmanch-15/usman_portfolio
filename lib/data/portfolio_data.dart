// lib/data/portfolio_data.dart
// All portfolio content — easy to update without touching UI

class PortfolioData {
  // ─── Personal Info ──────────────────────────────────────
  static const String name        = 'Usman';
  static const String fullName    = 'Muhammad Usman';
  static const String role        = 'Flutter App Developer';
  static const String tagline     = 'Building beautiful, high-performance mobile experiences';
  static const String location    = 'Pakistan 🇵🇰';
  static const String email       = 'usman4009797@gmail.com';
  static const String phone       = '+92 3044009797';
  static const String github      = 'https://github.com/usmanch-15/';
  static const String linkedin    = 'https://www.linkedin.com/in/muhammad-usman-78434a37b/';
  static const String cvUrl       = '#';

  static const String aboutText = '''
I'm a passionate Flutter App Developer from Pakistan with expertise in building 
cross-platform mobile applications. I specialize in creating seamless user experiences 
with clean architecture, smooth animations, and high-performance code.

With hands-on experience in Firebase, REST APIs, and AI integration, I craft mobile 
solutions that solve real-world problems. I'm dedicated to writing clean, maintainable 
code that scales.
''';

  // ─── Skills ─────────────────────────────────────────────
  static const List<Map<String, dynamic>> skills = [
    {'name': 'Flutter & Dart', 'level': 0.95, 'category': 'Mobile'},
    {'name': 'Firebase',       'level': 0.90, 'category': 'Backend'},
    {'name': 'REST APIs',      'level': 0.88, 'category': 'Backend'},
    {'name': 'State Management','level': 0.92,'category': 'Mobile'},
    {'name': 'UI/UX Design',   'level': 0.85, 'category': 'Design'},
    {'name': 'Git & GitHub',   'level': 0.90, 'category': 'Tools'},
    {'name': 'AI Integration', 'level': 0.80, 'category': 'AI'},
    {'name': 'App Optimization','level': 0.87,'category': 'Mobile'},
    {'name': 'GetX / Riverpod','level': 0.88, 'category': 'Mobile'},
    {'name': 'SQLite / Hive',  'level': 0.82, 'category': 'Database'},
    {'name': 'Push Notifications','level': 0.85,'category': 'Backend'},
    {'name': 'CI/CD & Play Store','level': 0.78,'category': 'Tools'},
  ];

  // ─── Tech Stack Badges ──────────────────────────────────
  static const List<String> techStack = [
    'Flutter', 'Dart', 'Firebase', 'REST API',
    'GetX', 'Riverpod', 'Provider', 'BLoC',
    'SQLite', 'Hive', 'Dio', 'Retrofit',
    'Git', 'GitHub', 'VS Code', 'Android Studio',
    'Google Maps API', 'Stripe', 'OneSignal', 'OpenAI API',
  ];

  // ─── Services ───────────────────────────────────────────
  static const List<Map<String, String>> services = [
    {
      'icon':  '📱',
      'title': 'Flutter App Development',
      'desc':  'End-to-end cross-platform apps for iOS & Android with pixel-perfect UI and smooth 60fps performance.',
    },
    {
      'icon':  '🔥',
      'title': 'Firebase Integration',
      'desc':  'Auth, Firestore, Storage, Cloud Functions, FCM push notifications and real-time database setup.',
    },
    {
      'icon':  '🌐',
      'title': 'REST API Integration',
      'desc':  'Seamless backend connectivity with Dio, Retrofit, JSON parsing, authentication, and error handling.',
    },
    {
      'icon':  '🤖',
      'title': 'AI-Powered Features',
      'desc':  'ChatGPT, Gemini, and custom ML model integration into mobile apps for intelligent user experiences.',
    },
    {
      'icon':  '🎨',
      'title': 'Mobile UI/UX Design',
      'desc':  'Stunning, modern interfaces with animations, custom widgets, glassmorphism, and pixel-perfect designs.',
    },
    {
      'icon':  '⚡',
      'title': 'App Performance Optimization',
      'desc':  'Code audits, widget rebuilds optimization, lazy loading, caching, and memory leak fixes.',
    },
  ];

  // ─── Projects ────────────────────────────────────────────
  static const List<Map<String, dynamic>> projects = [
    {
      'title':    'AI Chat Assistant',
      'desc':     'A ChatGPT-powered Flutter app with real-time streaming responses, chat history, and beautiful bubble UI.',
      'tech':     ['Flutter', 'OpenAI API', 'Firebase', 'Riverpod'],
      'color':    0xFF38BDF8,
      'emoji':    '🤖',
      'github':   '#',
      'live':     '#',
      'featured': true,
    },
    {
      'title':    'E-Commerce App',
      'desc':     'Full-featured shopping app with Stripe payments, product catalog, cart management, and Firebase backend.',
      'tech':     ['Flutter', 'Firebase', 'Stripe', 'GetX'],
      'color':    0xFF818CF8,
      'emoji':    '🛒',
      'github':   '#',
      'live':     '#',
      'featured': true,
    },
    {
      'title':    'Food Delivery App',
      'desc':     'Real-time food ordering with Google Maps tracking, push notifications, and restaurant management panel.',
      'tech':     ['Flutter', 'Google Maps', 'FCM', 'REST API'],
      'color':    0xFF34D399,
      'emoji':    '🍕',
      'github':   '#',
      'live':     '#',
      'featured': true,
    },
    {
      'title':    'Task Manager Pro',
      'desc':     'Offline-first productivity app with Hive local storage, categories, reminders, and analytics dashboard.',
      'tech':     ['Flutter', 'Hive', 'Local Notifications', 'BLoC'],
      'color':    0xFFF59E0B,
      'emoji':    '✅',
      'github':   '#',
      'live':     '#',
      'featured': false,
    },
    {
      'title':    'Fitness Tracker',
      'desc':     'Health & workout tracking app with custom charts, BMI calculator, step counter, and workout plans.',
      'tech':     ['Flutter', 'SQLite', 'FL Chart', 'Provider'],
      'color':    0xFFEC4899,
      'emoji':    '💪',
      'github':   '#',
      'live':     '#',
      'featured': false,
    },
    {
      'title':    'News Aggregator',
      'desc':     'Multi-source news app with category filters, bookmarks, offline reading, and dark/light theme.',
      'tech':     ['Flutter', 'News API', 'Hive', 'Riverpod'],
      'color':    0xFFFF6B6B,
      'emoji':    '📰',
      'github':   '#',
      'live':     '#',
      'featured': false,
    },
  ];

  // ─── Experience ──────────────────────────────────────────
  static const List<Map<String, String>> experience = [
    {
      'role':     'Senior Flutter Developer',
      'company':  'TechVision Solutions',
      'period':   'Jan 2023 – Present',
      'desc':     'Leading mobile development team, architecting scalable Flutter apps, mentoring junior devs, and integrating AI features.',
    },
    {
      'role':     'Flutter Developer',
      'company':  'AppCraft Studio',
      'period':   'Jun 2021 – Dec 2022',
      'desc':     'Built 10+ production apps for international clients. Worked with Firebase, REST APIs, and complex state management.',
    },
    {
      'role':     'Junior Flutter Developer',
      'company':  'Freelance',
      'period':   'Jan 2020 – May 2021',
      'desc':     'Developed cross-platform mobile applications for local and international clients via Upwork and Fiverr.',
    },
  ];

  // ─── Testimonials ────────────────────────────────────────
  static const List<Map<String, String>> testimonials = [
    {
      'name':    'Ahmed Raza',
      'role':    'CEO, TechStart Pakistan',
      'text':    'Usman delivered an exceptional app that exceeded our expectations. His attention to detail and clean code made the project a huge success.',
      'initials':'AR',
    },
    {
      'name':    'Sarah Johnson',
      'role':    'Product Manager, AppCraft',
      'text':    'Working with Usman was a pleasure. He understood our vision immediately and built a stunning UI with seamless animations.',
      'initials':'SJ',
    },
    {
      'name':    'David Chen',
      'role':    'Startup Founder, USA',
      'text':    'Best Flutter developer I\'ve hired! Delivered the MVP in record time with pixel-perfect design and zero bugs.',
      'initials':'DC',
    },
  ];

  // ─── Stats ───────────────────────────────────────────────
  static const List<Map<String, String>> stats = [
    {'number': '50+', 'label': 'Projects Completed'},
    {'number': '3+',  'label': 'Years Experience'},
    {'number': '30+', 'label': 'Happy Clients'},
    {'number': '10+', 'label': 'Apps on Play Store'},
  ];
}
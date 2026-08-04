// lib/data/portfolio_data.dart

class PortfolioData {
  // ─── Personal Info ───────────────────────────────────────
  static const String name     = 'Usman';
  static const String fullName = 'Muhammad Usman';
  static const String role     = 'Flutter & MERN Stack Developer';
  static const String tagline  = 'Building high-performance mobile & web applications';
  static const String location = 'Pakistan 🇵🇰';
  static const String email    = 'usman4009797@gmail.com';
  static const String phone    = '+92 3044009797';
  static const String github   = 'https://github.com/usmanch-15/';
  static const String linkedin = 'https://www.linkedin.com/in/muhammad-usman-78434a37b/';
  static const String cvUrl    = '#';

  static const String aboutText = '''
I'm a passionate Flutter and MERN Stack Developer from Pakistan, specializing in building high-performance mobile and web applications. I create scalable, user-focused solutions using Flutter, React.js, Node.js, Express.js, and MongoDB, with a strong emphasis on clean architecture, modern UI/UX, and seamless user experiences.

With hands-on experience in Firebase, Supabase, REST APIs, AI-powered solutions, and full-stack development, I develop applications that solve real-world business challenges. I am committed to writing clean, maintainable, and efficient code while delivering reliable, scalable, and innovative digital products.
''';

  // ─── Skills ──────────────────────────────────────────────
  static const List<Map<String, dynamic>> skills = [
    {'name': 'Flutter',            'level': 0.95, 'category': 'Mobile'},
    {'name': 'Firebase',           'level': 0.90, 'category': 'Backend'},
    {'name': 'PHP',                'level': 0.90, 'category': 'Backend'},
    {'name': 'REST APIs',          'level': 0.90, 'category': 'Backend'},
    {'name': 'Clean Architecture', 'level': 0.90, 'category': 'Mobile'},
    {'name': 'Git & GitHub',       'level': 0.90, 'category': 'Tools'},
    {'name': 'AI Solutions',       'level': 0.85, 'category': 'AI'},
    {'name': 'React.js',           'level': 0.85, 'category': 'Web'},
    {'name': 'JavaScript',         'level': 0.85, 'category': 'Web'},
    {'name': 'Supabase',           'level': 0.80, 'category': 'Backend'},
    {'name': 'MERN Stack',         'level': 0.80, 'category': 'Web'},
    {'name': 'Python',             'level': 0.60, 'category': 'AI'},
  ];

  // ─── Tech Stack (marquee) ────────────────────────────────
  static const List<String> techStack = [
    'Flutter', 'Firebase', 'React', 'Node.js', 'Express.js', 'MongoDB',
    'JavaScript', 'Python', 'PHP', 'Supabase', 'Git', 'GitHub',
    'REST APIs', 'AI Solutions',
  ];

  // ─── Services ────────────────────────────────────────────
  static const List<Map<String, String>> services = [
    {
      'icon':  '📱',
      'title': 'Flutter App Development',
      'desc':  'End-to-end cross-platform apps for iOS & Android with pixel-perfect UI and smooth 60fps performance.',
    },
    {
      'icon':  '🌐',
      'title': 'MERN Stack Development',
      'desc':  'Full-stack web apps using React.js, Node.js, Express.js and MongoDB with scalable REST API architecture.',
    },
    {
      'icon':  '🔥',
      'title': 'Firebase & Supabase Integration',
      'desc':  'Auth, Firestore, Storage, Cloud Functions, FCM push notifications and real-time database setup.',
    },
    {
      'icon':  '🤖',
      'title': 'AI-Powered Features',
      'desc':  'ChatGPT, Gemini, NLP and custom ML model integration for intelligent, real-world user experiences.',
    },
    {
      'icon':  '🎨',
      'title': 'Mobile UI/UX Design',
      'desc':  'Stunning, modern interfaces with animations, custom widgets, glassmorphism, and pixel-perfect designs.',
    },
    {
      'icon':  '⚡',
      'title': 'App Performance & Architecture',
      'desc':  'Clean architecture, BLoC/Provider patterns, lazy loading, caching, and memory optimization.',
    },
  ];

  // ─── Projects ────────────────────────────────────────────
  // Only real, verifiable, delivered work is listed below.
  static const List<Map<String, dynamic>> projects = [
    // ── FLAGSHIP / REAL ──
    {
      'title':    'Cargoos — Cargo Logistics Platform',
      'desc':     'Live cargo & freight logistics app deployed across 4 African states. Connects loaders to transporters for city-to-city delivery with real-time tracking, route management, and Firebase backend.',
      'tech':     ['Flutter', 'Firebase', 'Firestore', 'Google Maps', 'FCM'],
      'color':    0xFF38BDF8,
      'emoji':    '🚛',
      'github':   'https://github.com/usmanch-15/',
      'live':     null,
      'featured': true,
    },
    {
      'title':    'EchoSee — AI Glasses for Hearing Impaired',
      'desc':     'Hardware-integrated Flutter app for hearing-impaired users. Detects real-world sound through smart glasses and converts it to Urdu & English text in real time using AI/NLP.',
      'tech':     ['Flutter', 'AI/NLP', 'Hardware IoT', 'Real-time Text'],
      'color':    0xFFA855F7,
      'emoji':    '👓',
      'github':   'https://github.com/usmanch-15/',
      'live':     null,
      'featured': true,
    },
    // ── GOFLOW — Multi-Vendor Delivery & Ride Platform (4 Apps) ──
    {
      'title':    'Goflow — Customer App',
      'desc':     'Multi-vendor delivery & ride-booking app for customers — online ordering, vendor browsing, live delivery tracking and multiple payment methods. Part of a 4-app ecosystem built with Flutter and a Laravel REST API.',
      'tech':     ['Flutter', 'Laravel', 'REST API', 'Admin Panel'],
      'color':    0xFF22C55E,
      'emoji':    '🛵',
      'github':   null,
      'live':     'https://play.google.com/store/apps/details?id=com.goflow.taxi.rider',
      'featured': true,
    },
    {
      'title':    'Goflow — Driver App',
      'desc':     'Ride & delivery driver app for the Goflow ecosystem — trip requests, live navigation, earnings and status management, synced with the same Laravel backend.',
      'tech':     ['Flutter', 'Laravel', 'REST API', 'Live Tracking'],
      'color':    0xFF16A34A,
      'emoji':    '🚕',
      'github':   null,
      'live':     'https://play.google.com/store/apps/details?id=com.goflowdriver.taxi.driver',
      'featured': false,
    },
    {
      'title':    'Goflow — Store / Vendor App',
      'desc':     'Vendor-side app for managing menus, incoming orders, and store availability in real time, connected to the Goflow admin panel and API.',
      'tech':     ['Flutter', 'Laravel', 'REST API', 'Vendor Management'],
      'color':    0xFF15803D,
      'emoji':    '🏬',
      'github':   null,
      'live':     'https://play.google.com/store/apps/details?id=com.ailab.goflow.storeapp',
      'featured': false,
    },
    {
      'title':    'Goflow — Delivery Boy App',
      'desc':     'Delivery-partner app for order pickup, route navigation, and delivery status updates across the Goflow multi-vendor platform.',
      'tech':     ['Flutter', 'Laravel', 'REST API', 'Delivery Tracking'],
      'color':    0xFF166534,
      'emoji':    '📦',
      'github':   null,
      'live':     'https://play.google.com/store/apps/details?id=com.ailab.goflow.deliveryboy',
      'featured': false,
    },
    // ── MOVEPK — Ride-Hailing Platform for Pakistan (2 Apps + Admin) ──
    {
      'title':    'MovePk — Customer App',
      'desc':     'Ride-hailing app for Pakistan with real-time ride booking, live tracking, OTP-verified rides and in-app wallet. Built with Flutter and Firebase, backed by a Laravel admin panel.',
      'tech':     ['Flutter', 'Firebase', 'Laravel', 'OTP Verification'],
      'color':    0xFFF59E0B,
      'emoji':    '🚖',
      'github':   null,
      'live':     'https://play.google.com/store/apps/details?id=com.movepk.ailabcustomer',
      'featured': true,
    },
    {
      'title':    'MovePk — Driver App',
      'desc':     'Driver-side ride-hailing app for MovePk with real-time trip requests, live location tracking, and driver subscription management.',
      'tech':     ['Flutter', 'Firebase', 'Laravel', 'Live Tracking'],
      'color':    0xFFD97706,
      'emoji':    '🚗',
      'github':   null,
      'live':     'https://play.google.com/store/apps/details?id=com.movepk.ailabdriver',
      'featured': false,
    },
  ];

  // ─── Experience ──────────────────────────────────────────
  static const List<Map<String, dynamic>> experience = [
    {
      'role':     'Team Lead — Flutter Developer',
      'company':  'CodeCelix',
      'period':   'Jan 2026 – May 2026',
      'type':     'Internship',
      'icon':     '🏢',
      'color':    0xFF38BDF8,
      'desc':     'Led a team of developers to build and deliver 2–3 production-level Flutter applications. Managed sprint planning, code reviews, and architecture decisions while actively contributing to feature development.',
      'tags':     ['Flutter', 'Team Lead', 'Firebase', 'Clean Architecture'],
    },
    {
      'role':     'Flutter Developer — Cargoos',
      'company':  'Freelance / Independent',
      'period':   '2024 – 2025',
      'type':     'Project',
      'icon':     '🚛',
      'color':    0xFF34D399,
      'desc':     'Designed and developed Cargoos — a live cargo logistics platform deployed across 4 African states. Built real-time tracking, city-to-city freight matching, and Firebase backend from scratch.',
      'tags':     ['Flutter', 'Firebase', 'Google Maps', 'Live App'],
    },
    {
      'role':     'AI App Developer — EchoSee',
      'company':  'Personal / R&D Project',
      'period':   '2024',
      'type':     'Project',
      'icon':     '👓',
      'color':    0xFFA855F7,
      'desc':     'Built EchoSee — an AI-powered Flutter app integrated with hardware glasses for hearing-impaired users. Converts ambient sound to real-time Urdu & English text using NLP.',
      'tags':     ['Flutter', 'AI/NLP', 'Hardware IoT', 'Accessibility'],
    },
    {
      'role':     'Full Stack & Mobile Developer',
      'company':  'Freelance',
      'period':   '2023 – Present',
      'type':     'Freelance',
      'icon':     '💼',
      'color':    0xFF818CF8,
      'desc':     'Delivered mobile and web applications for clients across Pakistan and internationally. Projects span Flutter apps, MERN Stack platforms, Firebase integrations, and AI-powered features.',
      'tags':     ['Flutter', 'MERN Stack', 'Firebase', 'REST APIs'],
    },
  ];

  // ─── Stats ───────────────────────────────────────────────
  static const List<Map<String, String>> stats = [
    {'number': '2',   'label': 'Multi-App Platforms Delivered'},
    {'number': '2+',  'label': 'Years Experience'},
    {'number': '4',   'label': 'African States — Cargoos Live'},
    {'number': '6',   'label': 'Live Apps on Google Play'},
  ];

  // ─── Testimonials ────────────────────────────────────────
  // Empty until real client testimonials are available — avoid
  // placeholder/fake reviews for credibility.
  static const List<Map<String, String>> testimonials = [];
}
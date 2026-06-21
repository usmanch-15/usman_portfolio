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
  static const List<Map<String, dynamic>> projects = [
    // ── FLAGSHIP / REAL ──
    {
      'title':    'Cargoos — Cargo Logistics Platform',
      'desc':     'Live cargo & freight logistics app deployed across 4 African states. Connects loaders to transporters for city-to-city delivery with real-time tracking, route management, and Firebase backend.',
      'tech':     ['Flutter', 'Firebase', 'Firestore', 'Google Maps', 'FCM'],
      'color':    0xFF38BDF8,
      'emoji':    '🚛',
      'github':   'https://github.com/usmanch-15/',
      'live':     '#',
      'featured': true,
    },
    {
      'title':    'EchoSee — AI Glasses for Hearing Impaired',
      'desc':     'Hardware-integrated Flutter app for hearing-impaired users. Detects real-world sound through smart glasses and converts it to Urdu & English text in real time using AI/NLP.',
      'tech':     ['Flutter', 'AI/NLP', 'Hardware IoT', 'Real-time Text'],
      'color':    0xFFA855F7,
      'emoji':    '👓',
      'github':   'https://github.com/usmanch-15/',
      'live':     '#',
      'featured': true,
    },
    // ── Flutter ──
    {
      'title':    'Blood Bank App',
      'desc':     'Donor matching system with emergency blood requests, real-time notifications, and Firebase-powered donor management.',
      'tech':     ['Flutter', 'Firebase', 'FCM', 'Google Maps'],
      'color':    0xFFEF4444,
      'emoji':    '🩸',
      'github':   '#',
      'live':     '#',
      'featured': true,
    },
    {
      'title':    'ServiceHub',
      'desc':     'On-demand service booking platform with in-app chat, provider management, and real-time booking status.',
      'tech':     ['Flutter', 'Firebase', 'Firestore', 'FCM'],
      'color':    0xFF34D399,
      'emoji':    '🔧',
      'github':   '#',
      'live':     '#',
      'featured': false,
    },
    {
      'title':    'POS System',
      'desc':     'Point of Sale system with billing, inventory tracking, and detailed sales reports for small businesses.',
      'tech':     ['Flutter', 'Firebase', 'SQLite', 'PDF Gen'],
      'color':    0xFF818CF8,
      'emoji':    '🏪',
      'github':   '#',
      'live':     '#',
      'featured': false,
    },
    {
      'title':    'Doctor Appointment App',
      'desc':     'Book appointments, view doctor profiles, manage schedules, and receive consultation reminders.',
      'tech':     ['Flutter', 'Firebase', 'Firestore', 'FCM'],
      'color':    0xFF22D3EE,
      'emoji':    '🩺',
      'github':   '#',
      'live':     '#',
      'featured': false,
    },
    {
      'title':    'Task Manager App',
      'desc':     'Offline-first productivity app with task tracking, categories, reminders, and priority management.',
      'tech':     ['Flutter', 'SQLite', 'Local Notifications'],
      'color':    0xFFF59E0B,
      'emoji':    '✅',
      'github':   '#',
      'live':     '#',
      'featured': false,
    },
    {
      'title':    'Weather Forecast App',
      'desc':     'Live weather updates and 7-day forecasts with beautiful animated weather UI and location-based data.',
      'tech':     ['Flutter', 'REST API', 'OpenWeather', 'Lottie'],
      'color':    0xFF60A5FA,
      'emoji':    '🌤️',
      'github':   '#',
      'live':     '#',
      'featured': false,
    },
    {
      'title':    'Fitness Tracker App',
      'desc':     'Workout tracking and health monitoring with custom charts, BMI calculator, and step counter.',
      'tech':     ['Flutter', 'Firebase', 'FL Chart', 'Provider'],
      'color':    0xFFEC4899,
      'emoji':    '💪',
      'github':   '#',
      'live':     '#',
      'featured': false,
    },
    {
      'title':    'Expense Tracker App',
      'desc':     'Manage income and expenses with visual reports, category budgets, and offline SQLite storage.',
      'tech':     ['Flutter', 'SQLite', 'FL Chart', 'BLoC'],
      'color':    0xFF10B981,
      'emoji':    '💰',
      'github':   '#',
      'live':     '#',
      'featured': false,
    },
    // ── MERN ──
    {
      'title':    'E-Commerce Platform',
      'desc':     'Full-featured shopping platform with product catalog, cart, Stripe payments, and admin panel.',
      'tech':     ['React', 'Node.js', 'Express', 'MongoDB'],
      'color':    0xFF6366F1,
      'emoji':    '🛒',
      'github':   '#',
      'live':     '#',
      'featured': false,
    },
    {
      'title':    'Real Estate Management System',
      'desc':     'Property listing and search platform with advanced filters, agent dashboard, and inquiry management.',
      'tech':     ['React', 'Node.js', 'MongoDB', 'Express'],
      'color':    0xFFF97316,
      'emoji':    '🏠',
      'github':   '#',
      'live':     '#',
      'featured': false,
    },
    {
      'title':    'Learning Management System',
      'desc':     'Online learning platform with course creation, video lessons, quizzes, and certificate generation.',
      'tech':     ['MERN Stack', 'JWT', 'Cloudinary'],
      'color':    0xFF8B5CF6,
      'emoji':    '🎓',
      'github':   '#',
      'live':     '#',
      'featured': false,
    },
    {
      'title':    'Job Portal System',
      'desc':     'Job posting and application platform with recruiter dashboard, applicant tracking, and resume upload.',
      'tech':     ['React', 'Node.js', 'MongoDB', 'JWT'],
      'color':    0xFF0EA5E9,
      'emoji':    '💼',
      'github':   '#',
      'live':     '#',
      'featured': false,
    },
    {
      'title':    'School Management System',
      'desc':     'Complete school ERP with student enrollment, attendance tracking, results, and teacher management.',
      'tech':     ['MERN Stack', 'JWT', 'PDF Gen', 'Charts'],
      'color':    0xFF14B8A6,
      'emoji':    '🏫',
      'github':   '#',
      'live':     '#',
      'featured': false,
    },
    // ── AI ──
    {
      'title':    'AI Resume Ranking System',
      'desc':     'NLP-powered resume analysis system that ranks candidates based on job description matching and skill scoring.',
      'tech':     ['Python', 'NLP', 'AI/ML', 'FastAPI'],
      'color':    0xFFD946EF,
      'emoji':    '🤖',
      'github':   '#',
      'live':     '#',
      'featured': false,
    },
    {
      'title':    'AI Chat Assistant',
      'desc':     'Real-time AI chatbot with OpenAI integration, chat history, streaming responses, and beautiful bubble UI.',
      'tech':     ['React', 'Node.js', 'OpenAI API', 'MongoDB'],
      'color':    0xFF22D3EE,
      'emoji':    '💬',
      'github':   '#',
      'live':     '#',
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
    {'number': '17+', 'label': 'Projects Completed'},
    {'number': '2+',  'label': 'Years Experience'},
    {'number': '4',   'label': 'African States — Cargoos Live'},
    {'number': '3',   'label': 'Domains: Mobile · Web · AI'},
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
}
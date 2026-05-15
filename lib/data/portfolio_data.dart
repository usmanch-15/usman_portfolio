import '../models/models.dart';

class PortfolioData {
  PortfolioData._();

  // ── SKILLS ──────────────────────────────────────────────────────────────
  static const List<SkillModel> skills = [
    SkillModel(category: 'Flutter & Mobile', name: 'Flutter', level: 95),
    SkillModel(category: 'Flutter & Mobile', name: 'Dart', level: 92),
    SkillModel(category: 'Flutter & Mobile', name: 'Firebase', level: 85),
    SkillModel(category: 'Flutter & Mobile', name: 'REST APIs', level: 88),
    SkillModel(category: 'Flutter & Mobile', name: 'GetX / Riverpod', level: 82),
    SkillModel(category: 'Flutter & Mobile', name: 'Provider', level: 80),

    SkillModel(category: 'UI/UX Design', name: 'Figma', level: 88),
    SkillModel(category: 'UI/UX Design', name: 'UI Design', level: 90),
    SkillModel(category: 'UI/UX Design', name: 'Prototyping', level: 82),
    SkillModel(category: 'UI/UX Design', name: 'Motion Design', level: 75),

    SkillModel(category: 'AI & Backend', name: 'OpenAI API', level: 80),
    SkillModel(category: 'AI & Backend', name: 'Gemini AI', level: 78),
    SkillModel(category: 'AI & Backend', name: 'Python', level: 72),
    SkillModel(category: 'AI & Backend', name: 'Node.js', level: 68),
    SkillModel(category: 'AI & Backend', name: 'Supabase', level: 74),

    SkillModel(category: 'Tools', name: 'Git & GitHub', level: 90),
    SkillModel(category: 'Tools', name: 'VS Code', level: 95),
    SkillModel(category: 'Tools', name: 'Postman', level: 85),
    SkillModel(category: 'Tools', name: 'Jira', level: 72),
  ];

  // ── EXPERIENCE ──────────────────────────────────────────────────────────
  static const List<ExperienceModel> experiences = [
    ExperienceModel(
      role: 'Flutter Developer',
      company: 'Cargoo Pass (Live Product)',
      duration: '2023 – Present',
      description:
      'Built and shipped a cross-border cargo logistics platform running live '
          'in 4 African countries. Responsible for full Flutter frontend, real-time '
          'tracking, payment integration, and driver/shipper dashboards.',
      technologies: ['Flutter', 'Dart', 'Firebase', 'REST API', 'Google Maps'],
    ),
    ExperienceModel(
      role: 'Freelance Flutter Developer',
      company: 'Upwork',
      duration: '2022 – Present',
      description:
      'Delivered 10+ Flutter projects for international clients including '
          'e-commerce apps, health trackers, and AI-powered tools. Maintained '
          '5-star rating with consistent on-time delivery.',
      technologies: ['Flutter', 'Firebase', 'GetX', 'Stripe', 'OpenAI'],
    ),
    ExperienceModel(
      role: 'Final Year Project Lead',
      company: 'University – AI Resume Analyzer',
      duration: '2023 – 2024',
      description:
      'Led a team to build an AI-powered resume analyzer using Flutter + OpenAI. '
          'The app parses resumes, matches them against job descriptions, and gives '
          'actionable improvement feedback.',
      technologies: ['Flutter', 'Python', 'OpenAI API', 'FastAPI', 'Figma'],
    ),
    ExperienceModel(
      role: 'UI/UX Designer & Developer',
      company: 'EchoSee (Accessibility App)',
      duration: '2022 – 2023',
      description:
      'Designed and developed an AI-powered accessibility app for the visually '
          'impaired using real-time object detection and audio feedback. '
          'Published on Google Play.',
      technologies: ['Flutter', 'TensorFlow Lite', 'Text-to-Speech', 'Camera'],
    ),
  ];

  // ── PROJECTS ────────────────────────────────────────────────────────────
  static const List<ProjectModel> projects = [
    ProjectModel(
      id: 'cargopass',
      title: 'Cargoo Pass',
      subtitle: 'Cargo Logistics Platform',
      description:
      'A full-featured cross-border cargo logistics app running live in 4 African countries.',
      longDescription:
      'Cargoo Pass is a real-world cargo logistics platform connecting shippers and drivers '
          'across Africa. Features include real-time GPS tracking, multi-currency payments, '
          'driver rating system, and admin dashboard.',
      technologies: ['Flutter', 'Firebase', 'Google Maps', 'REST API', 'GetX'],
      liveUrl: 'https://cargoopass.com',
      isLive: true,
      isFeatured: true,
      liveCountries: ['Kenya', 'Tanzania', 'Uganda', 'Rwanda'],
      category: 'Logistics',
      status: 'Live',
      iconName: 'local_shipping',
      gradientColors: ['#667eea', '#764ba2'],
    ),
    ProjectModel(
      id: 'echosee',
      title: 'EchoSee',
      subtitle: 'AI Accessibility App',
      description:
      'An AI-powered accessibility app for visually impaired users with real-time object detection.',
      longDescription:
      'EchoSee uses TensorFlow Lite for real-time object detection and converts visual info '
          'to audio descriptions. Published on Google Play with 500+ downloads.',
      technologies: ['Flutter', 'TensorFlow Lite', 'Text-to-Speech', 'Camera API'],
      githubUrl: 'https://github.com/usmanch-15/echosee',
      isLive: true,
      isFeatured: true,
      category: 'Accessibility',
      status: 'Live',
      iconName: 'visibility',
      gradientColors: ['#f093fb', '#f5576c'],
    ),
    ProjectModel(
      id: 'bloodbank',
      title: 'Blood Bank Connect',
      subtitle: 'Emergency Blood Donation',
      description:
      'A real-time blood donor finder connecting patients with donors in emergencies.',
      longDescription:
      'Uses Firebase Realtime Database and location services to match blood seekers '
          'with nearby donors instantly. Features blood type filtering, emergency alerts, '
          'and donation history.',
      technologies: ['Flutter', 'Firebase', 'Google Maps', 'Push Notifications'],
      githubUrl: 'https://github.com/usmanch-15/bloodbank',
      isFeatured: true,
      category: 'Healthcare',
      status: 'Completed',
      iconName: 'favorite',
      gradientColors: ['#ff416c', '#ff4b2b'],
    ),
    ProjectModel(
      id: 'fitquest',
      title: 'FitQuest',
      subtitle: 'Gamified Fitness Tracker',
      description:
      'A gamified fitness app that turns workouts into quests with XP, levels, and rewards.',
      longDescription:
      'FitQuest makes fitness fun by adding RPG-style progression to workouts. '
          'Users earn XP, level up their avatar, and compete on leaderboards.',
      technologies: ['Flutter', 'Hive', 'Pedometer', 'Charts', 'Riverpod'],
      githubUrl: 'https://github.com/usmanch-15/fitquest',
      category: 'Health & Fitness',
      status: 'Completed',
      iconName: 'fitness_center',
      gradientColors: ['#43e97b', '#38f9d7'],
    ),
    ProjectModel(
      id: 'airesume',
      title: 'AI Resume Analyzer',
      subtitle: 'FYP – Smart Career Tool',
      description:
      'An AI-powered resume analyzer that scores resumes against job descriptions using OpenAI.',
      longDescription:
      'Final Year Project — parses uploaded resumes, compares them with job descriptions '
          'using OpenAI GPT, and provides a detailed score with improvement suggestions. '
          'Flutter frontend + Python FastAPI backend.',
      technologies: ['Flutter', 'Python', 'FastAPI', 'OpenAI GPT', 'Supabase'],
      githubUrl: 'https://github.com/usmanch-15/ai-resume-analyzer',
      isFeatured: true,
      isFyp: true,
      category: 'AI / Career',
      status: 'Completed',
      iconName: 'description',
      gradientColors: ['#4facfe', '#00f2fe'],
    ),
    ProjectModel(
      id: 'github',
      title: 'More on GitHub',
      subtitle: 'Open Source Projects',
      description:
      'Check out more Flutter projects, UI kits, and experiments on my GitHub.',
      longDescription:
      'Visit my GitHub for more projects including UI clones, packages, and experiments.',
      technologies: ['Flutter', 'Dart', 'Firebase', 'Various'],
      githubUrl: 'https://github.com/usmanch-15',
      category: 'Open Source',
      status: 'Active',
      iconName: 'code',
      gradientColors: ['#a18cd1', '#fbc2eb'],
    ),
  ];

  // ── SERVICES ────────────────────────────────────────────────────────────
  static const List<ServiceModel> services = [
    ServiceModel(
      title: 'Flutter App Development',
      description:
      'End-to-end Flutter apps for iOS, Android, and Web. Clean architecture, '
          'smooth animations, and production-ready code that scales.',
      icon: 'phone_iphone',
    ),
    ServiceModel(
      title: 'UI/UX Design',
      description:
      'Beautiful, user-centered designs in Figma. From wireframes to polished '
          'high-fidelity prototypes that developers can build from.',
      icon: 'palette',
    ),
    ServiceModel(
      title: 'AI-Powered Apps',
      description:
      'Integrate OpenAI, Gemini, or custom ML models into your Flutter app. '
          'Chatbots, analyzers, recommendation engines — you name it.',
      icon: 'auto_awesome',
    ),
    ServiceModel(
      title: 'Firebase Integration',
      description:
      'Authentication, Firestore, Realtime Database, Cloud Functions, and '
          'push notifications — full Firebase setup and optimization.',
      icon: 'local_fire_department',
    ),
    ServiceModel(
      title: 'App Optimization',
      description:
      'Performance audits, code refactoring, state management upgrades, '
          'and smooth 60fps animations for existing Flutter apps.',
      icon: 'speed',
    ),
    ServiceModel(
      title: 'API Integration',
      description:
      'Connect your Flutter app to any REST or GraphQL API. Payment gateways, '
          'maps, third-party services — clean and reliable.',
      icon: 'sync_alt',
    ),
  ];
}
<div align="center">

<img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" />
<img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" />
<img src="https://img.shields.io/badge/Vercel-000000?style=for-the-badge&logo=vercel&logoColor=white" />
<img src="https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=white" />
<img src="https://img.shields.io/badge/GetX-19A0D8?style=for-the-badge&logo=flutter&logoColor=white" />

# 🚀 Muhammad Usman — Flutter Developer Portfolio

**A modern, responsive, and beautifully animated Flutter web portfolio showcasing my skills, projects, research, and journey as a Flutter developer.**

[![Live Demo](https://img.shields.io/badge/🌐_Live_Demo-Click_Here-02569B?style=for-the-badge)](https://usman-portfolio-lake-five.vercel.app)
&nbsp;
[![Platform](https://img.shields.io/badge/Platform-Web_%7C_Mobile-green?style=for-the-badge)]()
&nbsp;
[![License](https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge)]()

</div>

---

## ✨ About the Project

This portfolio app is built entirely with **Flutter** and showcases my capabilities as a Flutter Developer. It combines clean architecture, modern UI/UX principles, smooth animations, and interactive visual effects to deliver a seamless experience across **web and mobile platforms**.

> Built not just to display work — but to *be* the work.

---

## 🌐 Live Demo

👉 **[https://usman-portfolio-lake-five.vercel.app](https://usman-portfolio-lake-five.vercel.app)**

---

## 🎯 Key Features

| Feature | Description |
|---|---|
| ⚡ **Particle Background** | Floating dots with connecting lines for dynamic visual effect |
| 🎭 **Hero Stagger Animations** | GSAP-style text reveal with staggered transitions |
| 🌟 **Glowing Orbs** | Animated gradient orbs in the hero section |
| 📊 **Animated Skill Bars** | Progress bars that animate on scroll visibility |
| 🏷️ **Interactive Skill Tags** | Hover effects with floating animations |
| 💼 **Projects Showcase** | Responsive grid with tech stack badges and live links |
| 📝 **Research Papers** | Published academic work with DOI references |
| 📞 **Contact Form** | Functional contact section with social media links |
| 🌐 **Fully Responsive** | Adaptive layout for Mobile, Tablet, and Desktop |
| ⚡ **Smooth Transitions** | Page transitions powered by GoRouter |
| 🎨 **Glassmorphism UI** | Modern frosted glass card design language |
| 🎬 **Lottie Animations** | High-quality JSON animations for visual polish |

---

## 🛠️ Tech Stack

### Core Technologies
| Technology | Purpose |
|---|---|
| **Flutter** | Cross-platform UI framework |
| **Dart** | Programming language |
| **Firebase** | Backend & database |
| **REST API** | Backend communication |

### Packages & Libraries

| Package | Version | Usage |
|---|---|---|
| [`go_router`](https://pub.dev/packages/go_router) | latest | Declarative navigation |
| [`google_fonts`](https://pub.dev/packages/google_fonts) | latest | Typography |
| [`flutter_animate`](https://pub.dev/packages/flutter_animate) | latest | UI animations |
| [`lottie`](https://pub.dev/packages/lottie) | latest | JSON animations |
| [`font_awesome_flutter`](https://pub.dev/packages/font_awesome_flutter) | latest | Icon pack |
| [`url_launcher`](https://pub.dev/packages/url_launcher) | latest | External links |
| [`getx`](https://pub.dev/packages/get) | latest | State management |
| [`riverpod`](https://pub.dev/packages/riverpod) | latest | Advanced state management |

---

## 📂 Project Structure

```
usman_portfolio/
│
├── android/                        # Android platform config
├── ios/                            # iOS platform config
├── web/                            # Web platform config
│
├── assets/
│   ├── animations/                 # Lottie JSON files
│   │   ├── hero_animation.json
│   │   ├── skills_animation.json
│   │   └── particle_effect.json
│   ├── fonts/                      # Custom fonts
│   ├── icons/                      # SVG / PNG icons
│   └── images/                     # Screenshots & profile
│       ├── profile.png
│       ├── project_1.png
│       └── project_2.png
│
├── lib/
│   ├── core/                       # App-wide base layer
│   │   ├── constants/
│   │   │   ├── app_colors.dart
│   │   │   ├── app_strings.dart
│   │   │   ├── app_typography.dart
│   │   │   └── breakpoints.dart
│   │   ├── theme/
│   │   │   ├── app_theme.dart
│   │   │   └── text_theme.dart
│   │   └── utils/
│   │       ├── responsive_helper.dart
│   │       ├── url_launcher_helper.dart
│   │       └── extensions.dart
│   │
│   ├── features/                   # Feature-first architecture
│   │   ├── hero/
│   │   │   ├── widgets/
│   │   │   │   ├── animated_intro.dart
│   │   │   │   ├── particle_background.dart
│   │   │   │   ├── glowing_orbs.dart
│   │   │   │   └── hero_cta_buttons.dart
│   │   │   └── hero_section.dart
│   │   │
│   │   ├── about/
│   │   │   ├── widgets/
│   │   │   │   └── experience_card.dart
│   │   │   └── about_section.dart
│   │   │
│   │   ├── projects/
│   │   │   ├── models/
│   │   │   │   └── project_model.dart
│   │   │   ├── data/
│   │   │   │   └── projects_data.dart
│   │   │   ├── widgets/
│   │   │   │   ├── project_card.dart
│   │   │   │   ├── project_grid.dart
│   │   │   │   └── tech_chip.dart
│   │   │   └── projects_section.dart
│   │   │
│   │   ├── skills/
│   │   │   ├── models/
│   │   │   │   └── skill_model.dart
│   │   │   ├── data/
│   │   │   │   └── skills_data.dart
│   │   │   ├── widgets/
│   │   │   │   ├── skill_chip.dart
│   │   │   │   └── animated_skill_bar.dart
│   │   │   └── skills_section.dart
│   │   │
│   │   ├── research/
│   │   │   ├── models/
│   │   │   │   └── research_paper_model.dart
│   │   │   ├── data/
│   │   │   │   └── research_data.dart
│   │   │   ├── widgets/
│   │   │   │   └── research_card.dart
│   │   │   └── research_section.dart
│   │   │
│   │   └── contact/
│   │       ├── widgets/
│   │       │   ├── contact_form.dart
│   │       │   └── social_links_row.dart
│   │       └── contact_section.dart
│   │
│   ├── navigation/
│   │   ├── app_router.dart         # GoRouter configuration
│   │   └── route_names.dart        # Named route constants
│   │
│   ├── shared/
│   │   └── widgets/
│   │       ├── navbar.dart
│   │       ├── footer.dart
│   │       ├── section_title.dart
│   │       ├── glassmorphism_card.dart
│   │       ├── animated_gradient_bg.dart
│   │       └── lottie_widget.dart
│   │
│   ├── app.dart                    # MaterialApp entry point
│   └── main.dart                   # App bootstrap
│
├── test/
│   └── features/
│       ├── projects_section_test.dart
│       ├── skills_section_test.dart
│       └── contact_form_test.dart
│
├── .env                            # Environment variables (gitignored)
├── pubspec.yaml                    # Dependencies & assets
├── analysis_options.yaml           # Lint rules
└── README.md

```

---

## 🚀 Getting Started

### Prerequisites

Ensure you have the following installed:

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (>= 3.0.0)
- [Dart](https://dart.dev/get-dart) (>= 3.0.0)
- A code editor ([VS Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio))

### Installation

```bash
# 1. Clone the repository
git clone https://github.com/usmanch-15/usman-portfolio.git

# 2. Navigate into the project directory
cd usman_portfolio

# 3. Install dependencies
flutter pub get

# 4. Run the app on your preferred platform
flutter run -d chrome         # Web
flutter run -d android        # Android
flutter run -d ios            # iOS
```

### Build for Web (Production)

```bash
flutter build web --release
```

---

## 🌐 Deployment

This project is deployed on **Vercel** using the Flutter Web build output.

```bash
# 1. Build web release
flutter build web --release

# 2. Deploy via Vercel CLI
vercel --prod build/web
```

---

## 📚 Research & Publications

### Published Paper

**Security Vulnerabilities in MERN-Flutter Applications**

- **DOI:** [10.5281/zenodo.20636215](https://doi.org/10.5281/zenodo.20636215)
- **Focus:** Security analysis and best practices for full-stack MERN-Flutter applications
- **Availability:** Open access on Zenodo

---

## 🏗️ Architecture

This project follows a **Feature-First Clean Architecture** pattern:

```
┌─────────────────────────────────┐
│   Presentation Layer            │
│   (Features → UI Widgets)       │
├─────────────────────────────────┤
│   Domain Layer                  │
│   (Models & Data Classes)       │
├─────────────────────────────────┤
│   Data Layer                    │
│   (Static Data / Firebase APIs) │
├─────────────────────────────────┤
│   Core Layer                    │
│   (Constants, Themes, Utils)    │
└─────────────────────────────────┘
```

### Key Design Decisions

- **No heavy state management** — Pure Flutter `setState` + `InheritedWidget` for simplicity
- **GoRouter** for declarative navigation with named routes
- **Responsive Helper** detects screen size breakpoints and adapts layout dynamically
- **Firebase Integration** for dynamic content and contact form submissions
- **REST API** for flexible backend communication

---

## 🎨 Design System

- **Color Scheme:** Dark theme with glassmorphism elements
- **Typography:** Google Fonts with custom text hierarchy
- **Animations:** GSAP-style stagger effects + Lottie for complex animations
- **Components:** Reusable, composable widget library
- **Responsive Breakpoints:**
  - Mobile: < 600px
  - Tablet: 600px - 1200px
  - Desktop: > 1200px

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

1. Fork the repository
2. Create your feature branch — `git checkout -b feature/amazing-feature`
3. Commit your changes — `git commit -m 'Add some amazing feature'`
4. Push to the branch — `git push origin feature/amazing-feature`
5. Open a Pull Request

---

## 📄 License

This project is licensed under the **MIT License** — see the [LICENSE](LICENSE) file for details.

---

## 📬 Contact & Connect

**Muhammad Usman**

[![Email](https://img.shields.io/badge/Email-D14836?style=for-the-badge&logo=gmail&logoColor=white)](mailto:usman4009797@gmail.com)
&nbsp;
[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://linkedin.com/in/muhammad-usman-78434a37b)
&nbsp;
[![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/usmanch-15)

---

## 📊 Project Stats

- ✨ **Lines of Dart:** 5000+
- 🎨 **Custom Widgets:** 25+
- 📦 **Packages Used:** 15+
- 🌍 **Platforms Supported:** Web, Android, iOS
- ⚡ **Performance Score:** 95+ (Lighthouse)

---

<div align="center">

Made with ❤️ and Flutter by **Muhammad Usman**

⭐ **If you find this project helpful, please give it a star!** ⭐

**[View Live Portfolio](https://usman-portfolio-lake-five.vercel.app)** • **[GitHub](https://github.com/usmanch-15)** • **[LinkedIn](https://linkedin.com/in/muhammad-usman-78434a37b)**

</div>

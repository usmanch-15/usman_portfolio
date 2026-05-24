<div align="center">

<img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" />
<img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" />
<img src="https://img.shields.io/badge/Vercel-000000?style=for-the-badge&logo=vercel&logoColor=white" />

# 🚀 Usman Portfolio — Flutter Developer Portfolio App

**A modern, responsive, and animated Flutter portfolio app showcasing my skills, projects, and journey as a Flutter developer.**

[![Live Demo](https://img.shields.io/badge/🌐_Live_Demo-Click_Here-02569B?style=for-the-badge)](https://usman-portfolio-lake-five.vercel.app)
&nbsp;
[![Platform](https://img.shields.io/badge/Platform-Web_%7C_Mobile-green?style=for-the-badge)]()
&nbsp;
[![License](https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge)]()

</div>

---

## ✨ About the Project

This portfolio app is built entirely with **Flutter** and serves as a living showcase of my capabilities as a Flutter Developer. It combines clean architecture, modern UI/UX principles, and smooth animations to deliver an experience that works seamlessly across both **web and mobile**.

> Built not just to display work — but to *be* the work.

---

## 🖥️ Live Demo

👉 **[https://usman-portfolio-lake-five.vercel.app](https://usman-portfolio-lake-five.vercel.app)**

---

## 📸 Screenshots

> _Add screenshots here to enhance presentation_

| Hero Section | Projects | Skills | Contact |
|:---:|:---:|:---:|:---:|
| ![Hero](assets/screenshots/hero.png) | ![Projects](assets/screenshots/projects.png) | ![Skills](assets/screenshots/skills.png) | ![Contact](assets/screenshots/contact.png) |

---

## 📱 Features

| Feature | Description |
|---|---|
| 🎯 **Animated Hero Section** | Intro text with smooth Flutter Animate transitions |
| 💼 **Projects Showcase** | Real-world projects with tech stack badges and live links |
| 🧠 **Skills Display** | Categorized skill chips with animated reveal |
| 📞 **Contact Form** | Functional contact section with social links |
| 🌐 **Fully Responsive** | Adaptive layout for Web, Tablet, and Mobile |
| ⚡ **Smooth Transitions** | Page transitions powered by GoRouter |
| 🎨 **Glassmorphism UI** | Modern frosted glass card design language |
| 🎬 **Lottie Animations** | High-quality JSON animations for visual polish |

---

## 🛠️ Tech Stack

### Core
| Technology | Purpose |
|---|---|
| **Flutter** | Cross-platform UI framework |
| **Dart** | Programming language |

### Packages & Libraries

| Package | Version | Usage |
|---|---|---|
| [`go_router`](https://pub.dev/packages/go_router) | latest | Declarative navigation |
| [`google_fonts`](https://pub.dev/packages/google_fonts) | latest | Typography |
| [`flutter_animate`](https://pub.dev/packages/flutter_animate) | latest | UI animations |
| [`lottie`](https://pub.dev/packages/lottie) | latest | Lottie JSON animations |
| [`font_awesome_flutter`](https://pub.dev/packages/font_awesome_flutter) | latest | Icon pack |
| [`url_launcher`](https://pub.dev/packages/url_launcher) | latest | Open external links |

---

## 📂 Folder Structure

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
│   │   └── skills_animation.json
│   ├── fonts/                      # Google Fonts (TTF/OTF)
│   ├── icons/                      # SVG / PNG icons
│   └── images/                     # Project screenshots & profile
│       ├── profile.png
│       └── project_1.png
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
│   │   │   │   ├── hero_cta_buttons.dart
│   │   │   │   └── hero_avatar.dart
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
│   │   │   │   └── skill_chip.dart
│   │   │   └── skills_section.dart
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

Make sure you have the following installed:

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (>= 3.0.0)
- [Dart](https://dart.dev/get-dart) (>= 3.0.0)
- A code editor ([VS Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio))

### Installation

```bash
# 1. Clone the repository
git clone https://github.com/your-username/usman_portfolio.git

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
# Build web release
flutter build web --release

# Deploy via Vercel CLI
vercel --prod build/web
```

---

## 🏗️ Architecture

This project follows a **Feature-First Clean Architecture** pattern:

```
Presentation Layer  →  Features (UI Widgets + Screens)
Domain Layer        →  Models & Data classes
Data Layer          →  Static data / Future API integration
Core Layer          →  Constants, Themes, Utils, Extensions
```

- **No external state management** — pure Flutter `setState` and `InheritedWidget` for simplicity
- **GoRouter** handles all navigation with named routes
- **Responsive helper** detects breakpoints and adapts layout for mobile, tablet, and desktop

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

## 📬 Contact

**Usman**

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://linkedin.com/in/your-username)
[![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/your-username)
[![Email](https://img.shields.io/badge/Email-D14836?style=for-the-badge&logo=gmail&logoColor=white)](mailto:your@email.com)

---

<div align="center">

Made with ❤️ and Flutter by **Usman**

⭐ **If you find this project helpful, please give it a star!** ⭐

</div>

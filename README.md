# Profile Editor App

A Flutter application to view, edit, and upload user profile information including name, email, bio, phone number, location, and profile image.

## 🚀 How to Run the App Locally

1. **Clone the repository**  
   ```bash
   git clone https://github.com/your-username/profile_editor.git
   cd profile_editor

2. **Install dependencies**  

```flutter pub get
```

lib/
├── core/
│   └── constants/           # App-wide constants (colors, text styles, etc.)
│   └── services/            # Reusable services like CloudinaryService
├── features/
│   └── profile/
│       ├── data/            # API models and repository implementations
│       ├── domain/          # Entities and abstract repositories
│       └── presentation/
│           ├── bloc/        # BLoC logic (events, states, bloc)
│           └── pages/       # Screens and widgets
├── main.dart                # Entry point with GetIt and app setup

# 📱 Eventure - Complete Project Documentation

A modern event discovery and networking Flutter application inspired by 8club, featuring authentication, bookmarks, favorites, and 42 curated Indian events.

---

## 🎯 Project Overview

**Eventure** is a premium event discovery and networking platform built with Flutter. Users can browse through 42 carefully curated Indian events across 8 categories, bookmark events they're interested in, favorite events they love, and manage their profile with a beautiful Material 3 UI.

### Project Stats

- **Lines of Code**: ~3,500+
- **Development Time**: Full-featured app
- **Flutter Version**: 3.x
- **Platforms**: Android, iOS (ready)
- **Total Files**: 25+

---

## ✨ Features

### 🔐 Authentication

- **Email/Password Login & Signup** - Dummy authentication (accepts any credentials)
- **Name Input Screen** - Personalized onboarding after signup
- **Persistent Login** - Stays logged in using SharedPreferences
- **Logout Functionality** - Complete session clearing

### 📅 Event Management

- **42 Indian Events** - Curated events across India
- **8 Categories**:
    - Technology (8 events)
    - Music (7 events)
    - Arts & Culture (7 events)
    - Food & Culinary (6 events)
    - Sports & Fitness (5 events)
    - Business & Networking (5 events)
    - Education & Workshops (4 events)
- **Event Details**: Date, time, location, price (₹500-10,000), attendees, description
- **Search Functionality** - Search by name, category, or location
- **Category Filters** - Filter events by category chips

### 🔖 Bookmarks & Favorites

- **Bookmarks** - Save events you want to attend
- **Favorites** - Heart events you love
- **Visual Feedback**:
    - Default: White circle with violet icon
    - Active: Violet circle with white icon
- **Persistent Storage** - Saved locally with SharedPreferences
- **Separate Lists** - View bookmarks and favorites separately

### 👤 Profile & Settings

- **User Profile** - Display name and email
- **Stats Display**:
    - 42 Total Events
    - Bookmarks count (dynamic)
    - Favorites count (dynamic)
- **Theme Toggle** - System/Light/Dark modes
- **Notification Settings** - Push, Email, Event Reminders (toggleable)
- **Profile Drawer** - Quick access to Profile, Bookmarks, Favorites, Event History

### 🎨 UI/UX

- **Material 3 Design** - Modern, clean interface
- **Poppins Font** - Professional typography
- **Scrolling Tagline** - "You can take the man out of the city, not the city outta him."
- **Smooth Animations** - Page transitions and state changes
- **Responsive Layout** - Works on all screen sizes
- **Dark/Light Mode** - Full theme support

---

## 📚 Snapshots

| ![sign-up-page](https://github.com/jagyanjit/Eventure/blob/main/snapshots/sign-up-page.jpg) | ![name-page](https://github.com/jagyanjit/Eventure/blob/main/snapshots/name-page.jpg) | ![home-page](https://github.com/jagyanjit/Eventure/blob/main/snapshots/home-page.jpg) | ![categories-arts](https://github.com/jagyanjit/Eventure/blob/main/snapshots/categories-arts.jpg) | ![categories-music](https://github.com/jagyanjit/Eventure/blob/main/snapshots/categories-music.jpg) | ![event-page](https://github.com/jagyanjit/Eventure/blob/main/snapshots/event-page.jpg) |
|:--:|:--:|:--:|:--:|:--:|:--:|
| **sign-up-page** | **name-page** | **home-page** | **categories-arts** | **categories-music** | **event-page** |


| ![register-page](https://github.com/jagyanjit/Eventure/blob/main/snapshots/register-page.jpg) | ![bookmark-button](https://github.com/jagyanjit/Eventure/blob/main/snapshots/bookmark-button.jpg) | ![favorite-button](https://github.com/jagyanjit/Eventure/blob/main/snapshots/favorite-button.jpg) | ![left-side-bar](https://github.com/jagyanjit/Eventure/blob/main/snapshots/left-side-bar.jpg) | ![profile-page](https://github.com/jagyanjit/Eventure/blob/main/snapshots/profile-page.jpg) | ![bookmarks-page](https://github.com/jagyanjit/Eventure/blob/main/snapshots/bookmarks-page.jpg) |
|:--:|:--:|:--:|:--:|:--:|:--:|
| **register-page** | **bookmark-button** | **favorite-button** | **left-side-bar** | **profile-page** | **bookmarks-page** |


| ![favorites-page](https://github.com/jagyanjit/Eventure/blob/main/snapshots/favorites-page.jpg) | ![event-history-page](https://github.com/jagyanjit/Eventure/blob/main/snapshots/event-history-page.jpg) | ![right-side-bar](https://github.com/jagyanjit/Eventure/blob/main/snapshots/right-side-bar.jpg) | ![settings-page](https://github.com/jagyanjit/Eventure/blob/main/snapshots/settings-page.jpg) | ![danger-zone](https://github.com/jagyanjit/Eventure/blob/main/snapshots/danger-zone.jpg) | ![logged-out](https://github.com/jagyanjit/Eventure/blob/main/snapshots/logged-out.jpg) |
|:--:|:--:|:--:|:--:|:--:|:--:|
| **favorites-page** | **event-history-page** | **right-side-bar** | **settings-page** | **danger-zone** | **logged-out** |




## 🛠 Tech Stack

### Core

- **Framework**: Flutter 3.x
- **Language**: Dart
- **State Management**: Riverpod 2.4.0

### Packages

YAML

```
dependencies:
  flutter_riverpod: ^2.4.0      # State management
  http: ^1.1.0                  # API calls (future use)
  shared_preferences: ^2.2.2    # Local storage
  google_fonts: ^6.1.0          # Poppins font
  cached_network_image: ^3.3.0  # Image caching
  intl: ^0.18.1                 # Date formatting
```

### Architecture

- **Clean Architecture** - Separated layers
- **Provider Pattern** - Centralized state
- **Service Layer** - API and storage abstraction
- **Model-View-ViewModel** - Clear separation of concerns

---

## 📁 Project Structure

text

```
event_explorer/
├── android/
├── ios/
├── lib/
│   ├── main.dart                           # App entry point
│   │
│   ├── models/
│   │   ├── event.dart                      # Event data model
│   │   └── user.dart                       # User data model
│   │
│   ├── providers/
│   │   ├── auth_provider.dart              # Authentication state
│   │   ├── events_provider.dart            # Events & filters state
│   │   ├── favorites_provider.dart         # Favorites state
│   │   ├── bookmarks_provider.dart         # Bookmarks state
│   │   ├── theme_provider.dart             # Theme state
│   │   └── notification_provider.dart      # Notification settings
│   │
│   ├── screens/
│   │   ├── auth/
│   │   │   ├── login_screen.dart           # Login UI
│   │   │   ├── signup_screen.dart          # Signup UI
│   │   │   └── name_input_screen.dart      # Name entry after signup
│   │   ├── home_screen.dart                # Main events list
│   │   ├── event_detail_screen.dart        # Event details
│   │   ├── favorites_screen.dart           # Favorites list
│   │   ├── bookmarks_screen.dart           # Bookmarks list
│   │   ├── profile_screen.dart             # User profile
│   │   ├── event_history_screen.dart       # Event history
│   │   └── settings_screen.dart            # App settings
│   │
│   ├── services/
│   │   ├── api_service.dart                # API calls & local data
│   │   ├── auth_service.dart               # Auth operations
│   │   └── storage_service.dart            # Local storage operations
│   │
│   ├── widgets/
│   │   ├── event_card.dart                 # Reusable event card
│   │   ├── empty_state.dart                # Empty state widget
│   │   ├── loading_widget.dart             # Loading indicator
│   │   ├── profile_drawer.dart             # Profile side drawer
│   │   ├── settings_drawer.dart            # Settings side drawer
│   │   └── scrolling_tagline.dart          # Animated tagline
│   │
│   ├── theme/
│   │   └── app_theme.dart                  # Light/Dark themes
│   │
│   └── utils/
│       └── page_transitions.dart           # Custom transitions
│
├── test/
├── pubspec.yaml                             # Dependencies
├── README.md                                # Project documentation
└── .gitignore                              # Git ignore rules
```

---

## 🚀 Installation & Setup

### Prerequisites

- Flutter SDK (>=3.0.0)
- Dart SDK
- Android Studio / VS Code
- Git

### Step 1: Clone & Install

Bash

```
# Clone the repository
git clone https://github.com/yourusername/eventure.git
cd eventure

# Install dependencies
flutter pub get

# Run the app
flutter run
```

### Step 2: Clean Build (if issues)

Bash

```
flutter clean
flutter pub get
flutter run
```

### Step 3: Build for Release

Bash

```
# Android
flutter build apk --release

# iOS
flutter build ios --release
```

---

## 🎯 Key Implementations

### Authentication Flow

**Flow Diagram**:

text

```
App Start → Check Auth Status
  ↓
  ├─ No User → LoginScreen
  │            ↓
  │            Login/Signup → User created (name: "User")
  │            ↓
  │            NameInputScreen → Enter name
  │            ↓
  │            Update user → Navigate to HomeScreen
  │
  └─ User Exists
       ├─ Name is "User" → NameInputScreen
       └─ Name is custom → HomeScreen
```

---

### Bookmarks vs Favorites

**Separation**:

- **Bookmarks** = Events you want to attend (Bookmark icon 🔖)
- **Favorites** = Events you love (Heart icon ❤️)

**Storage**:

- Stored separately in SharedPreferences
- Different keys: `bookmarked_events` vs `favorite_events`
- Separate providers and UI lists

**Color Scheme** (Both follow same pattern):

|State|Background|Icon|
|---|---|---|
|Inactive|White ⚪|Violet 🟣|
|Active|Violet 🟣|White ⚪|

---

### Search & Filter System

**Features**:

- Real-time search as you type
- Category chips for quick filtering
- Combined filters work together
- Clear filters button when empty

---

### Theme System

**Three Modes**:

1. **System** - Follows device theme
2. **Light** - Always light mode
3. **Dark** - Always dark mode

**Persistence**:

dart

```
Future<void> setThemeMode(ThemeMode mode) async {
  state = mode;
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('theme_mode', _themeModeToString(mode));
}
```

**Usage**:

dart

```
// In settings
SegmentedButton<ThemeMode>(
  segments: const [
    ButtonSegment(value: ThemeMode.system, label: Text('System')),
    ButtonSegment(value: ThemeMode.light, label: Text('Light')),
    ButtonSegment(value: ThemeMode.dark, label: Text('Dark')),
  ],
  selected: {currentThemeMode},
  onSelectionChanged: (newSelection) {
    ref.read(themeModeProvider.notifier).setThemeMode(newSelection.first);
  },
)
```

---

### State Management Pattern

**Riverpod Structure**:

text

```
StateNotifier (Logic)
    ↓
StateNotifierProvider (Provider)
    ↓
Consumer Widget (UI)
```

---

## 🐛 Troubleshooting

### Issue: App Stuck on Loading Screen

**Solution**:

Bash

```
# Clear all cache
flutter clean
rm -rf build/
flutter pub get
flutter run
```

### Issue: Buttons Not Changing Color

**Root Cause**: Provider not watching state correctly

**Solution**: Use `Provider.family` for individual item state:

dart

```
final isBookmarkedProvider = Provider.family<bool, String>((ref, eventId) {
  final bookmarksAsync = ref.watch(bookmarksProvider);
  return bookmarksAsync.when(
    data: (bookmarks) => bookmarks.any((e) => e.id == eventId),
    loading: () => false,
    error: (_, __) => false,
  );
});
```

### Issue: SharedPreferences Not Saving

**Check**:

dart

```
// Always await save operations
await prefs.setString(key, value);

// Always get instance first
final prefs = await SharedPreferences.getInstance();
```

### Issue: Login Works, Signup Stuck

**Solution**: Manual navigation after name update:

dart

```
await ref.read(authProvider.notifier).updateName(name);
Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(builder: (_) => const HomeScreen()),
  (route) => false,
);
```

---

## 🚀 Future Enhancements

### Phase 1 (MVP Complete) ✅

- [x]  Authentication system
- [x]  Event browsing
- [x]  Bookmarks & Favorites
- [x]  Search & Filters
- [x]  Profile management
- [x]  Settings

### Phase 2 (Next Steps)

- [ ]  Firebase Authentication
- [ ]  Real-time event API integration
- [ ]  Event registration functionality
- [ ]  QR code ticket generation
- [ ]  Calendar integration
- [ ]  Share events

### Phase 3 (Advanced)

- [ ]  Social features (friends, chat)
- [ ]  Event check-in
- [ ]  Photo sharing
- [ ]  Reviews and ratings
- [ ]  Push notifications
- [ ]  Location-based suggestions

### Phase 4 (Enterprise)

- [ ]  Event organizer portal
- [ ]  Analytics dashboard
- [ ]  Payment integration
- [ ]  Multi-language support
- [ ]  Admin panel

---

## 📊 Performance Metrics

### App Size

- **APK Size**: ~15-20 MB
- **Dependencies**: 6 main packages
- **Assets**: Minimal (images from Unsplash CDN)

### Performance

- **Cold Start**: ~2-3 seconds
- **Hot Reload**: < 1 second
- **Search**: Real-time (< 100ms)
- **Navigation**: Smooth 60fps

### Code Quality

- **Lines of Code**: ~3,500
- **Files**: 25+
- **Test Coverage**: Basic (expandable)
- **Lint Warnings**: 0

---

## 🎓 Learning Outcomes

### Skills Demonstrated

1. **Flutter Fundamentals**
    
    - Widget composition
    - State management
    - Navigation
    - Theming
2. **Riverpod Mastery**
    
    - Providers
    - StateNotifiers
    - Family providers
    - Async handling
3. **API Integration**
    
    - HTTP requests
    - JSON parsing
    - Error handling
    - Fallback data
4. **Local Storage**
    
    - SharedPreferences
    - Data persistence
    - JSON serialization
5. **UI/UX Design**
    
    - Material 3
    - Custom themes
    - Animations
    - Responsive layouts
6. **Problem Solving**
    
    - Debugging state issues
    - Performance optimization
    - User flow design

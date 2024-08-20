# never_situp_assessment

## Project structure ##
- **lib**
  - **bloc** ***--- store BLoC state management (business logic) for this app***
    - **Product** ***--- store BLoC for each module***
      - **model** ***--- store JSON data model for each BLoC***
      - *product_bloc.dart* ***--- BLoC business logic***
      - *product_event.dart* ***--- define BLoC event(s)***
      - *product_state.dart* ***--- define state variables for this BLoC***
  - **config** ***--- store config or constant***
    - *API.dart* ***--- store API configurations***
    - *Color.dart* ***--- store defined Color theme***
    - *Text.dart* ***--- store defined Text theme***
  - **service** ***--- store API services***
    - *MainAPI.dart* ***--- Main API Service***
  - **view** ***--- store All UI Widget***
    - **Home** ***--- store UI by page or module***
      - **Widget** ***--- store Widget component of each page / module***
      - *Home.dart* ***--- Homepage UI container***
  - *main.dart* ***--- Entry point of the app***
- *app_debug.apk* ***--- Demo Android APK installation file***

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

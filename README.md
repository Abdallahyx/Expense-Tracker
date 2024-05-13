# Expense Tracker

This is a simple expense tracker application built using Flutter and Hive.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

- Flutter SDK
- Dart SDK

### Installation

1. Create a new Flutter project:
   ```bash
   flutter create expense_tracker
   ```
2. Navigate to the project directory:
   ```bash
   cd expense_tracker
   ```
3. Replace the content of `pubspec.yaml` with the following:
   ```yaml
   environment:
     sdk: '>=3.3.4 <4.0.0'

   dependencies:
     flutter:
       sdk: flutter
     hive: ^2.0.4
     hive_flutter: ^1.1.0
     cupertino_icons: ^1.0.6
     multi_value_listenable_builder: ^0.0.2

   dev_dependencies:
     flutter_test:
       sdk: flutter
     hive_generator: ^1.1.3
     build_runner: ^2.1.11
     flutter_lints: ^3.0.0
   ```
4. Run `flutter pub get` to fetch the packages.
5. Clone the repo and copy the `lib` and `assets` folders into your project directory:
   ```bash
   git clone https://github.com/abdallahyx/Expense-Tracker.git
   cp -r Project-Name/lib expense_tracker/lib
   cp -r Project-Name/assets expense_tracker/assets
   ```
6. Run the app:
   ```bash
   flutter run
   ```

## Usage

After launching the application, you can add new expenses by clicking on the floating action button. The expenses will be listed on the home screen.


# sportball_coach

Sport Coach Organizer 🏆📲
A mobile app designed to make coaching easier by managing classes, tracking attendance, and sending session plans to parents. This app helps coaches stay organized and keeps parents in the loop about what their kids are learning.

Quick Start
🚀 Without Docker
Install Dependencies
Make sure you have Flutter installed. Then, inside the project folder, run:

bash
Copy
Edit
flutter pub get
Run the App
To launch the app on an emulator or connected device:

bash
Copy
Edit
flutter run
🐳 With Docker
Install Docker (if not installed)
bash
Copy
Edit
curl https://get.docker.com | sh && sudo systemctl --now enable docker
Download and Run the Container
bash
Copy
Edit
docker run --rm --shm-size=8g --ulimit memlock=-1 --gpus all -it sportball/coach-organizer
Run the App Inside Docker
bash
Copy
Edit
flutter run
Description
The Sportball Coach Organizer was built to help youth sports coaches organize training sessions, track attendance, and communicate with parents effortlessly.
It allows coaches to assign lesson plans, notify parents about missed sessions, and collaborate with assistant coaches.

Key Features:
📅 Class & Roster Management – Create sessions, assign players, and take attendance.

🏆 Lesson Plan Builder – Create structured training plans that can be shared with parents.

📩 Parent Notifications – Automatically send updates on missed classes and practice suggestions.

💬 Coach Messaging System – Easily collaborate with assistant coaches.

🏀 Multi-Sport Support – Works for soccer, basketball, baseball, hockey, and football.

Tech Stack
Frontend: Flutter (Dart) / React Native

Backend: Firebase / Supabase (for storing data)

Auth: Firebase Authentication

Notifications: Firebase Cloud Messaging / Push API

Usage
Running the App
Ensure you have Flutter installed. Then, navigate to the project folder and run:

bash
Copy
Edit
flutter run
If you need to rebuild the app:

bash
Copy
Edit
flutter clean
flutter pub get
flutter run
Building for iOS & Android
To build an APK (Android):

bash
Copy
Edit
flutter build apk
To build for iOS (requires macOS):

bash
Copy
Edit
flutter build ios
API & Database
This app uses Firebase for authentication, real-time data storage, and notifications.
To set up Firebase:

Create a Firebase project at Firebase Console.

Download the google-services.json (Android) or GoogleService-Info.plist (iOS) and place them in the respective folders.

Enable Firestore, Authentication, and Cloud Messaging.

Contributing
Got ideas? Found a bug? Feel free to fork this repo and submit a pull request!

Contact
For any questions or feedback, reach out to me at sufmk3@gmail.com or open an issue on GitHub.

🔥 Built to make coaching easier and more efficient! 🏅

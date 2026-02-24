# 📝 Campus Notes

A high-performance, locally persistent note-taking application built with Flutter. This project was developed as a comprehensive technical assessment to demonstrate proficiency in offline-first mobile architecture, reactive state management, and modern UI/UX design.

## 📱 Screenshots
<img src="https://github.com/user-attachments/assets/ee936a49-110e-461e-b12f-aae3fbd6bc78" width="180" height=300>
<img src="https://github.com/user-attachments/assets/2faad79a-6e4b-43e9-b8ff-959074647cea" width="180" height=300>
<img src="https://github.com/user-attachments/assets/7febb528-c590-459d-b1fa-8bd0d10425b0" width="180" height=300>
<img src="https://github.com/user-attachments/assets/5fd3ad6d-b420-47b9-9ed1-d81466580971" width="180" height=300>

## 🛠 Dependencies Used
This project leverages industry-standard packages to ensure performance and scalability:
* **Hive & Hive Flutter**: High-performance NoSQL local storage for offline data persistence.
* **Provider**: For clean, reactive state management and dependency injection.
* **Flutter ScreenUtil**: To ensure a responsive UI across various mobile device sizes.
* **Intl**: Used for localized date and time formatting of notes.
* **Google Fonts**: For professional and consistent typography.

## 🏗 Architecture Explanation
The application follows a **Provider-based MVVM (Model-View-ViewModel)** architecture to ensure a strict separation of concerns:


1. **Model**: Defines the data structure for notes using Hive TypeAdapters for efficient binary serialization.
2. **View**: Modular UI components built with Material 3 design principles, decoupled from business logic.
3. **ViewModel/Provider**: Centralizes database operations (CRUD) and app state. It notifies the UI to rebuild only when data changes, optimizing performance.

## ⚙️ Setup Steps
Follow these instructions to get the project running locally:

1. **Clone the Repository**:
   ```bash
   git clone [https://github.com/your-username/campus_notes.git](https://github.com/Kevy-k/campus_notes.git)
2. **Install Dependencies**:
   ```bash
   flutter pub get
3. **Generate Hive Adapters**:
   ```bash
   flutter pub run build_runner build
4. **Run the Application**:
   ```bash
   flutter run

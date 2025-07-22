# Kisan Sakha – Smart AI Farming Assistant

![Project Kisan Logo](assets/logo.png)

> “Your AI-powered companion for Indian farmers — instant crop diagnosis, mandi price forecasts, and government scheme navigation, all in your language.”

---

## Overview

Kisan Sakha is a mobile-first Flutter application that empowers Indian farmers with:

- 🌾 **Crop Sakha**: Diagnose crop diseases from photos or voice descriptions and receive actionable treatment advice.
- 📈 **Mandi Sakha**: Get real-time price trends, simple forecasts, and personalized selling advice for your crops.
- 🏛 **Yojana Sakha**: Instantly discover government schemes, subsidies, and step-by-step guidance, tailored to your state and query.
- 🎤 **Multilingual & Voice-First**: Supports English, Hindi, Kannada, and Telugu. Speak, listen, and interact hands-free.

The project is part of the Agentic AI Day Hackathon 2025, aiming to demonstrate true **agentic AI behavior** (proactivity, learning, and contextual adaptation).

---

## Features

- Modern, clean UI with tab navigation: Crop Sakha, Mandi Sakha, Yojana Sakha
- Language selector (English, Hindi, Kannada, Telugu)
- Image upload & voice input for diagnosis (Crop Sakha)
- Price forecasting (Mandi Sakha) and government scheme Q&A (Yojana Sakha)
- Ready for agentic AI integration: proactive reminders, adaptive advice, FCM push notifications
- Fully mobile responsive and easy to extend

---

## Getting Started

### 1. **Clone the Repository**

    git clone https://github.com/midhiman12/project_kisan.git
    cd project_kisan/kisan_sakha


### 2. **Install Dependencies**
Make sure you have [Flutter](https://flutter.dev/docs/get-started/install) installed (3.x recommended).

    flutter pub get
### 3. **Run the App**

-   **Web:**
     
    `flutter run -d chrome` 
    
-   **Android/iOS (emulator or device):**
    `flutter run` 
    

> _For desktop, enable desktop support with `flutter config --enable-windows-desktop` and run as above._

----------


## Usage

1.  **Select Language**: Use the dropdown on the app bar to set your preferred language.
    
2.  **Navigate Tabs**: Choose Crop Sakha, Mandi Sakha, or Yojana Sakha.
    
3.  **Interact**:
    
    -   Crop Sakha: Upload a photo or use voice input, tap "Get Diagnosis".
        
    -   Mandi Sakha: Select crop & mandi, tap "Get Forecast".
        
    -   Yojana Sakha: Select state, ask a question about schemes, tap "Find Schemes".
        

> Each screen is ready for integration with backend agentic AI logic via Firebase, Cloud Functions, and GCP Vertex AI.

----------

## Agentic AI Integration (Next Steps)

-   **Cloud Functions**: Connect image/voice/text input to Gemini Vision, Forecasting, and Agent Builder.
    
-   **Firestore**: Log user data and enable agent memory for personalized recommendations.
    
-   **Push Notifications**: Use FCM to send proactive alerts, reminders, and follow-ups.
    
-   **Voice-First Logic**: Integrate STT and TTS for truly hands-free agent experience.
    

----------

## Contributing

1.  Fork the repo
    
2.  Create your feature branch (`git checkout -b feature/your-feature`)
    
3.  Commit your changes (`git commit -am 'Add some feature'`)
    
4.  Push to the branch (`git push origin feature/your-feature`)
    
5.  Create a new Pull Request
    

----------

## License

MIT

----------

## Team

-   **Dhiman Manji** – Product Lead, UI/UX, Integration
    
-   **Gowtham** – Backend, Cloud Functions, Voice
    
-   **Jagan** – AI Integration, Data APIs
    

For any questions, open an issue or contact us!

----------

**Let’s build a friend for every farmer.**

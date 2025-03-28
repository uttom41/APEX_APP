# Flutter Coding Assessment - Apex DMIT Limited

## Project Overview
This Flutter project is developed following the MVVM architecture. It includes state management using Riverpod, dependency injection with `get_it`, and network communication via `dio`. Additionally, it ensures a pixel-perfect UI design and securely stores user credentials with Flutter Secure Storage for a one-time login experience.

## Features
- **MVVM Architecture:** Ensures a clean separation of concerns.
- **State Management:** Implemented using Riverpod for efficient and scalable state handling.
- **Dependency Injection:** `get_it` is used to manage dependencies.
- **Network Requests:** `dio` is used for handling API calls efficiently.
- **Secure Storage:** Flutter Secure Storage is used for one-time login functionality.
- **Pixel-Perfect Design:** UI designed to match the given requirements precisely.
- **Offline Support:** Uses local caching where necessary.

## Technologies Used
- Flutter
- Riverpod (State Management)
- get_it (Dependency Injection)
- dio (Networking)
- Flutter Secure Storage (Local Storage)

## Installation & Setup
1. Clone the repository:
   ```sh
   git clone [repository_url]
   ```
2. Navigate to the project directory:
   ```sh
   cd flutter_project
   ```
3. Install dependencies:
   ```sh
   flutter pub get
   ```
4. Run the app:
   ```sh
   flutter run
   ```

## Project Structure
```
/lib
│── main.dart              
│── route.dart 
│── core
│   ├── component           
│   ├── di            
│   ├── http           
│   ├── state_manage            
│   ├── base_entity.dart           
│   ├── base_screen.dart            
│   ├── base_viewmodel.dart            
│   ├── index.dart            
│   ├── px_to_dp.dart            
│   ├── utils.dart            
│── pages
│   ├── login             
│   ├── purchase_list       

```

## API Configuration
- Update the `http_session.dart` file with the correct API base URL before running the project.

## Contact
For any questions or clarifications, feel free to reach out.

Best regards,  
[Uttrom kumar mitra]  
[uttom41@gmail.com]  


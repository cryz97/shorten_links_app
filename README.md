# Shorten Links App

This Flutter application allows the user shorten links through a web service, also the app displays the recient shorten links.

# Technologies

- [Flutter 2.8.1](https://docs.flutter.dev/get-started/install) : Is an open source framework by Google for building beautiful, natively compiled, multi-platform applications from a single codebase.
- [Dart version 2.15.1](https://dart.dev/get-dart): Is a client-optimized language for fast apps on any platform.

# Libraries used

- [http: 0.13.4](https://pub.dev/packages/http) : A composable, Future-based library for making HTTP requests.
- [test](https://pub.dev/packages/test) : rovides a standard way of writing and running tests in Dart.
- [mockito](https://pub.dev/packages/mockito): A mock framework inspired by Mockito with APIs for Fakes, Mocks, behavior verification, and stubbing.
- [build_runner](https://pub.dev/packages/build_runner): The `build_runner` package provides a concrete way of generating files using Dart code, outside of tools like `pub`.

## Folder Architecture

- lib
	- bloc
	- models
	- services
	- ui
		 - widgets
	- main.dart
- test
	- ...

### BLoC
Business Logic Component. Contains the logic for the ShortenUrl Object and connect business logic and UI. Uses a StreamController, a getter and a void method that allows send url to the service.
### Models
Have the ShortenUrl and Links Objects and works as main entities for this app also contain the methods to deserialize json
### Services
Here is where the web service is used. Contains a Post request to send url to short.
### UI
In this directory are all the UI components like button, text field, home page, etc.

### Test
Contains the Unit Test and Widget Testing to verify the logic and component behaviour


## How to Run the application

**Step 1:**

Go to project root and execute the following command in console to get the required dependencies:

```
flutter pub get
```

**Step 2:**

Open the Android Emulator and execute the following command:

```
flutter run lib/main.dart -d "device name or device id"
```

## How to Run the Tests



Go to project root and execute the following command in console

```
flutter test --coverage
```

## License
[MIT](https://choosealicense.com/licenses/mit/)


# Dropdown Sample

#### Current Version: 1.0.0

Creates a two dropdowns where a user can choose the country and state they live in by calling an API presented by the ``Social Discovery Group``.

## Getting Started

To start the application run the following command:

```
cd dropdown_sample
flutter run 
```

### Flutter Mobile

To run on Flutter Mobile simply connect an emulator or your actual device (in developer mode) to the system running the code.

Alternative if on Android, you could generate an apk  and then run it on your mobile device using:

```
flutter build apk
```

### Flutter Web

You may get a server-side CORS error when running the application on web. To work around this, locally you can run with the following command:

```
flutter run -d chrome --web-browser-flag "--disable-web-security"

```

For it to work with flutter web during deployment, either configure the server to be able to accept requests from the deployed website (or disable it entirely). Another option is to use a CORS proxy or gateway and send the requests through that url (e.g. corsproxy.io)


## Architectural Design

Since the application is small, there are only a few architectural requirements if following the principle *Less code is good code*. However to make it extensible and used as a format for future applications, the following structure is utilised:

* **Widget:**

  * Contains a customized dropdown for this application
  * More customized, reusable components can be added under this file
* **Service:**

  * Contains required api service for collecting data
  * Can implement more services such as other APIs, AI chat tools, etc.
* **Dto:**

  * Used to transfer data between services and pages (i.e. HomePage)
  * Contains LocationDto as returned by API

Use of *Pages*, *Controllers,* *Dao*'s, etc. could also have been included but were not due to the scope

## Secrets

Due to the simplicity of the application, keytools secret generation for API_KEY has not been used. This can be implemented if the application contains sensitive information. Alternative an *env.local* file can also be used to store passwords.

Since the application should be directly executable without any modifications, the API key has been manually inserted in the ``cupid_api_service``.

## Testing

Unit tests have only been created for the business logic and not the UI components. This is because of the small scope of this project causing UI testing to be unnecessary overhead.

To run the tests use command:

```
flutter test test/dto/location_dto_test.dart && flutter test test/services/cupid_api_service_test.dart
```

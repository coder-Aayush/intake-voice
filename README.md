# FlutterSound Intake Project
simple project for recording voice and storing to Firebase


### DEMO APP
TODO: Link 

## Running Project
Before running project you need to configure firebase. Go to console.firebase.com and make project and place google-services.json file in android/app/

### Update Rule in Colud Firestore

```
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if request.auth != null;
    }
  }
}
```

Make Sure to enable google authentication and Firebase Storage Option.


## Screenshoots



## Features 
- able to login using Google account
- able to record and upload voice
- Nice UI
- Organized Code

## Screens 

- login page
- homepage
- Voice page (where user can play the uploaded voice)
- TODO:

## Packages/Plugin
- firebase_core
- cloud_firestore
- firebase_auth
- firebase_storage
- flutter_sound
- google_sign_in
- get (For simple state managment and dependancy injection)
- path_provider
- permission_handler (for runtime permission)

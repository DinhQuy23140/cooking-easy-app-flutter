import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart';

import 'package:cooking_easy/firebase_options.dart';

/// Initializes Firebase and Google Sign-In (required before [GoogleSignIn.instance.authenticate]).
Future<void> initializeFirebaseAndGoogleSignIn() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } else {
    // On Android/iOS, Firebase reads native config files
    // (google-services.json / GoogleService-Info.plist).
    await Firebase.initializeApp();
  }
  await GoogleSignIn.instance.initialize();
}

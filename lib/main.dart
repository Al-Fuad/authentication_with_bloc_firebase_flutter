import 'package:authentication_with_bloc_firebase_flutter/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'firebase_options.dart';
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
  if (kIsWeb || defaultTargetPlatform == TargetPlatform.macOS) {
    await FacebookAuth.i.webAndDesktopInitialize(
      appId: "961438979329754",
      cookie: true,
      xfbml: true,
      version: "v14.0",
    );
  }
  runApp(const App());
}

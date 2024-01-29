import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tontineo_mobile_app/state/auth/authentication_bloc.dart';
import 'package:tontineo_mobile_app/ui/tontine_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

bool shouldUseFirestoreEmulator = false;

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );
  if (shouldUseFirestoreEmulator) {
    FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
  }
  runApp(
    BlocProvider(
      create: (context) => AuthenticationBloc(),
      child: const TontineoApp(),
    ),
  );
}



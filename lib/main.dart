import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_app/routing.dart';
import 'package:demo_app/trash/presentation/controllers/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'trash/presentation/screens/counter_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore db = FirebaseFirestore.instance;
  runApp(BlocProvider(
    create: (context) => CounterCubit(),  ///TODO: TO BE DELETED
    child: const ColorClashApp(),
  ));
}

class ColorClashApp extends StatelessWidget {
  const ColorClashApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: homeScreen,
      onGenerateRoute: onGenerateRoute,
    );
  }
}





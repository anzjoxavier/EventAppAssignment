import 'package:eventapp/Bloc/EventsBloc.dart';
import 'package:eventapp/Bloc/Nav_Cubit.dart';
import 'package:eventapp/Event_Page/Event_Page.dart';
import 'package:eventapp/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(providers: 
      [
        BlocProvider(create:(context) => NavCubit(), ),
        BlocProvider<EventsBloc>(create: (context) => EventsBloc()..add(LoadEventsEvent()),),
      ],
      child: AppNavigator(),
      ),
    );
  }
}

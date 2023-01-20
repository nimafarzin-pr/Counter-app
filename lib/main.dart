import 'package:counter_app/logic/cubit/counter/counter_cubit.dart';
import 'package:counter_app/logic/cubit/theme/theme_cubit.dart';
import 'package:counter_app/presentation/screens/counter_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => CounterCubit(),
        ),
      ],
      child: const CounterApp(),
    );
  }
}
